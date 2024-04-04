# /bin/sh

# CHECK IF THE LIST OF DIRECTORIES IS CREATED
# .config
# .config/kitty
# .config/nvim
# .config/leftwm
# bin

HOME_ROOT=$1

# check if .config exists
if [ ! -d $HOME_ROOT/.config ]; then
echo "============Creating .config directory $HOME_ROOT/.config"
    mkdir $HOME_ROOT/.config
fi

# check if .config/kitty exists
if [ ! -d $HOME_ROOT/.config/kitty ]; then
    echo "Creating .config/kitty directory"
    mkdir $HOME_ROOT/.config/kitty
fi

# check if .config/nvim exists
if [ ! -d $HOME_ROOT/.config/nvim ]; then
    echo "Creating .config/nvim directory"
    mkdir $HOME_ROOT/.config/nvim
fi

# check if .config/leftwm exists
if [ ! -d $HOME_ROOT/.config/leftwm ]; then
    echo "Creating .config/leftwm directory"
    mkdir $HOME_ROOT/.config/leftwm
fi

# check if bin exists
if [ ! -d $HOME_ROOT/bin ]; then
    echo "Creating bin directory"
    mkdir $HOME_ROOT/bin
fi

echo "Directories checked"
