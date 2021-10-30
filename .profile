# XDG specifications
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
# User directories
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# Set cargo location
export CARGO_HOME="$XDG_DATA_HOME/cargo"
PATH="$CARGO_HOME/bin:$PATH"

# Set Golang local repository
export GOPATH="$XDG_DATA_HOME/go"
PATH="$GOPATH/bin:$PATH"

# Set up composer installation
export COMPOSER_HOME="$XDG_DATA_HOME/composer"
PATH="$COMPOSER_HOME/vendor/bin:$PATH"

# Set the default number of jobs used by `cmake --build` and `ctest`
export CMAKE_BUILD_PARALLEL_LEVEL=8
export CTEST_PARALLEL_LEVEL="$CMAKE_BUILD_PARALLEL_LEVEL"

# Set the root of the Android SDK for proper detection in Android Studio
export ANDROID_SDK_ROOT="$XDG_DATA_HOME/android-sdk"
PATH="$ANDROID_SDK_ROOT/platform-tools:$PATH"

# Alternate location for Gradle's data
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"

# Alternate location for less's config file and cache and default options
export LESS='-R -F --shift 5'
export LESSKEY="$XDG_CONFIG_HOME/less/lesskey"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"

# Alternate location for npm's data
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
PATH="$XDG_DATA_HOME/node_modules/bin:$PATH"

# Set user-wide paths to binaries and dynamically-linked libraries
export PATH="$HOME/.local/bin:$PATH"
