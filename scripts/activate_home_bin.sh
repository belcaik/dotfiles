# make all files in ~/bin executable

HOME_ROOT=$1

# check if bin exists
if [ ! -d $HOME_ROOT/bin ]; then
    echo "Creating bin directory"
    mkdir $HOME_ROOT/bin
fi

# make all files in ~/bin executable
find $HOME_ROOT/bin -type f | while read -r file;
do
    # only files
    # check if file is a file and look if exists in ~
    if [ -f $file  ]; then
        chmod +x $file
    fi 
done

# check current shell
if [ -n "$ZSH_VERSION" ]; then
    echo "ZSH shell detected"
    echo "Adding ~/bin to PATH"
    echo "export PATH=$HOME_ROOT/bin:$PATH" >> $HOME_ROOT/.zshrc
elif [ -n "$BASH_VERSION" ]; then
    echo "BASH shell detected"
    echo "Adding ~/bin to PATH"
    echo "export PATH=$HOME_ROOT/bin:$PATH" >> $HOME_ROOT/.bashrc
else
    echo "Shell not detected"
    echo "Please add ~/bin to PATH"
fi