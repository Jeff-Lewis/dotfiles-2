alias reload!='. ~/.zshrc'

# OS X

alias osxe='vim ~/.dotfiles/osx/set-defaults.sh'
alias osxr='~/.dotfiles/osx/set-defaults.sh'

# Brew

alias bi='brew install'
alias bu='brew update'
alias bci='brew-cask install'

# Z Shell

alias zsha='vim ~/.dotfiles/zsh/aliases.zsh'
alias zshr='source ~/.zshrc'

# Apache

alias ace='sudo vim /private/etc/apache2/extra/httpd-vhosts.conf'
alias acr='sudo apachectl restart'
alias ach='sudo vim /private/etc/apache2/httpd.conf'
alias aeh='sudo vim /private/etc/hosts'

# PHP

alias phpi='vim /usr/local/php5/lib/php.ini'

# Shell

alias ls='ls -a'
alias lsl='ls -l'

# Copy with progress bar by rsync
alias cpr='rsync --info=progress2'
# Process info with header and grep
alias psg='ps -ef | egrep "$1|PID"'

alias cdd='cd ~/Dropbox'
alias cdg='cd ~/GitHub'
alias cdga='cdg; cd arcadas'
alias cdge='cdg; cd ennosol'
alias cdgec='cdge; cd carsee'
alias cdgeff='cdge; cd frontend-fotelsef'
alias cdgeff='cdge; cd frontend-fotelsef'

alias grep='grep --color=auto'
alias fic='find . -name "*.php" -print | xargs grep $1'

# Neo4j

alias neoi='neo4j info'
alias neos='neo4j start'
alias neoh='neo4j stop'
alias neor='neo4j restart'
alias neoc='sudo vim /usr/local/Cellar/neo4j/2.2.0/libexec/conf/neo4j-server.properties'
alias neoo='open -a Google\ Chrome http://127.0.0.1:7474/browser/'

# Project

function f_di() {
    mongo localhost/testing_api --eval "db.dropDatabase()"
    mongo localhost/testing_api < tests/db/test_api.js
}
function f_din() {
    mongo localhost/testing_api --eval "db.dropDatabase()"
    mongo localhost/testing_api < tests/db/test_api.js
    newman -s -c ./tests/newman/ennosol.postman_test_run.json -e ~/Dropbox/Ennosol/postman/$1.postman_environment.json -x
}

alias al='tail -f -n 100 storage/logs/laravel-$(date +"%Y-%m-%d").log'
alias at=f_din
alias atb=f_di

# Npm

alias ni='npm install'
alias nis='npm install --save'
alias nt='npm test'

# Bower

alias boi='bower install'
alias bou='bower update'

# Grunt

alias grs='grunt serve'
alias grt='grunt test'
alias grtc='grunt test:client'
alias grts='grunt test:server'
alias gr='grunt'
alias grb='grunt build'

# Gulp

alias gud='gulp dev:without_watch'
alias gcd='gulp config:dev'
alias gcs='gulp config:stg'
alias gcp='gulp config:prod'

# Build all with production.json
# gulp
# # Set dev evn - development.json
# gulp localapi
#
# # Jade files to .tmp/template.js-t and JS build (include gulp script:app cmd)
# gulp templatecache
# # Style build
# gulp styles:app

# Git

f_grbd() {
	git push origin :$1
}

f_grbdf() {
	git branch -rd origin/$1
}

f_gctnbp() {
	git branch $1
	git reset --hard HEAD~1
	git checkout $1
	git push -u origin $1
}

f_grcp() {
	git reset --hard HEAD
	git clean -f
	git pull
}

f_gmbdf() {
	git branch -r | awk -F/ '/\/pp-/{print $2}' | xargs -I {} git branch -D {}
	git branch -r | awk -F/ '/\/pp-/{print $2}' | xargs -I {} git branch -rd origin/{}
}

alias gct='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbdf='git branch -D'
alias ga='git add -A'
alias gc='git commit -am'
alias gco='git checkout'
alias gcom='git checkout master'
alias gcos='git checkout staging'
alias gpom='git pull origin master'
alias gpos='git pull origin staging'
alias gst='git status'
alias gs='git status -sb'
alias grbm='git pull --rebase origin master'
alias grbs='git pull --rebase origin staging'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'
alias gmt='git mergetool'
alias gctnbp=f_gctnbp
alias gmbdf=f_gmbdf
alias grbd=f_grbd
alias grbdf=f_grbdf
alias grcp=f_grcp

# Composer

#alias composer='php composer.phar'
alias cmpra='composer dump-autoload'
alias cmpri='composer install'
alias cmpru='composer update'
