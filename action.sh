#!/bin/bash

ARCH=x86_64

MAKEFLAGS="-j(nproc)"

: ${BUILD_USER:="builder"}

: ${BUILD_DIR_ROOT=/tmp/builder}
: ${PKGS_DIR=/tmp/__pkgs__}
: ${CCACHE_DIR:="/tmp/ccache"}

: ${GITHUB_ACTOR:=""}
: ${GIT_REMOTE:=""}
: ${GIT_BRANCH:="gh-pages"}

GITHUB_REPO_OWNER=${GITHUB_REPOSITORY%/*}
ARCH_REPO_NAME=adig-pkgs

verify_packages() {
	cd "$PKGS_DIR/x86_64"
	pacman -Sy namcap --noconfirm
	for PACKAGE in $(find . -name "*.pkg.tar.zst"); do
		echo "For "$PACKAGE" :"
		namcap $PACKAGE || { echo "ERROR IN $PACKAGE"; true; }
	done
}

initialize() {
	pacman -Syu --noconfirm --needed git wget ccache ninja

	echo "${BUILD_USER} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${BUILD_USER}
	echo "cache_dir = ${CCACHE_DIR}" > /etc/ccache.conf

	useradd -m ${BUILD_USER}
	chown -R ${BUILD_USER}:${BUILD_USER} .
}

fetch_n_build() {
	export MAKEFLAGS="-j$(nproc)"

	mkdir -pv $BUILD_DIR_ROOT $PKGS_DIR/x86_64/
	cd $BUILD_DIR_ROOT

	PACKAGE=$1
	echo Package to build is :$PACKAGE
	git clone https://github.com/adig-pkgs/$PACKAGE "$BUILD_DIR_ROOT/$PACKAGE" --depth=1
	
	pushd $PACKAGE
	chown -R "${BUILD_USER}":"${BUILD_USER}" .
	sudo -u "${BUILD_USER}" makepkg -sfr --noconfirm --needed
	cp -v *.pkg.tar.zst "${PKGS_DIR}/x86_64/"
	popd
}

publish() {
	# Expecting the branch is cloned at "${GITHUB_BRANCH}"
	cd "${GIT_BRANCH}"

	rm -rfv "${ARCH}"	# To remove older packages
	mkdir "${ARCH}"

	# Remove older commit
	git reset --soft HEAD^

	# Add the packages
	cd "${ARCH}"

	find "${PKGS_DIR}" -name "*.pkg.tar.zst" -exec cp -v "{}" . \;

	repo-add $ARCH_REPO_NAME.db.tar.gz *.pkg.tar.zst
	rename '.tar.gz' '' *.tar.gz

	# Commit
	git add --all --verbose
	git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
	git config user.name "${GITHUB_ACTOR}"

	git commit -m "Updated at $(date +'%d/%m/%Y %H:%M:%S')"

	# Push
	git push -fu origin "${GIT_BRANCH}"
}

set -xe
"$@"
