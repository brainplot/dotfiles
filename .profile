platform="$(uname -s | tr '[:upper:]' '[:lower:]')"

# Set default locale
[ -z "$LANG" ] && export LANG=en_US.UTF-8

# Make sure PATH is marked as exported
export PATH

prepend_dir_to_path_if_exists() { [ -d "$1" ] && PATH="$d:$PATH" ; }

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

case "$platform" in
	linux*)
		export XDG_CACHE_HOME="$HOME/.cache"
		;;
	darwin*)
		export XDG_CACHE_HOME="$HOME/Library/Caches"
		eval "$(/opt/homebrew/bin/brew shellenv)"
		;;
esac

# Set the default number of jobs used by `cmake --build` and `ctest`
# https://stackoverflow.com/a/23569003
if cpu_count="$(getconf _NPROCESSORS_ONLN)"
then
	export CMAKE_BUILD_PARALLEL_LEVEL="$(($cpu_count+2))"
	export CTEST_PARALLEL_LEVEL="$CMAKE_BUILD_PARALLEL_LEVEL"
fi

# Python user site
user_site="$(python3 -m site --user-base)" && prepend_dir_to_path_if_exists "$user_site/bin"

# Set cargo location
export CARGO_HOME="$XDG_DATA_HOME/cargo"
prepend_dir_to_path_if_exists "$CARGO_HOME/bin"

# Set rustup location
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
prepend_dir_to_path_if_exists "$RUSTUP_HOME/bin"

# Set Golang local repository
export GOPATH="$XDG_DATA_HOME/go"
prepend_dir_to_path_if_exists "$GOPATH/bin"

# Set up composer installation
export COMPOSER_HOME="$XDG_DATA_HOME/composer"
prepend_dir_to_path_if_exists "$COMPOSER_HOME/vendor/bin"

# Set the root of the Android SDK for proper detection in Android Studio
export ANDROID_SDK_ROOT="$XDG_DATA_HOME/android-sdk"
prepend_dir_to_path_if_exists "$ANDROID_SDK_ROOT/platform-tools"

# Alternate location for less's config file and cache and default options
export LESS=-FR5
export LESSKEY="$XDG_CONFIG_HOME/less/lesskey"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"

# Alternate location for npm's data
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
prepend_dir_to_path_if_exists "$XDG_DATA_HOME/node_modules/bin"

# Set user-wide paths to binaries
PATH="$HOME/.local/bin:$PATH"

# Cleanup
unset platform
unset cpu_count
unset user_site
unset -f prepend_dir_to_path_if_exists
