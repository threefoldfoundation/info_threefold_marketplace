set -e
set +x

export NAME=tfnow

# INSTALL CRYSTAL TOOLS

if [[ "$OSTYPE" == "linux-gnu"* ]]; then 
    sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/crystaluniverse/crystaltools/master/tools/install.sh)"
    sudo chmod 777 /usr/local/bin/ct
elif [[ "OSTYPE" == "darwin"* ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/crystaluniverse/crystaltools/master/tools/install.sh)"
fi


# GET REQUIRED REPOSITORIES
ct git pull -u git@github.com:threefoldfoundation/www_$NAME.git
ct git pull -u git@github.com:threefoldfoundation/data_threefold.git

# GO INTO CODE DIRECTORY
set -e
cd ~/code/github/threefoldfoundation/www_$NAME

# INSTALL GRIDSOME & DEPENDENCIES FOR GRIDSOME
rm -f yarn.lock
rm -rf node_modules
rm -rf .cache

export NVM_DIR="$HOME/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm use --lts

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo npm install --global @gridsome/cli
 elif [[ "OSTYPE" == "darwin"* ]]; then
    npm install --global @gridsome/cli
fi
set +e
npm install

source run.sh


