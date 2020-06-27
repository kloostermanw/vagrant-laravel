# vagrant-laravel

## install

clone the project

`git clone https://github.com/wiebekn/vagrant-laravel.git yourproject`

`cd yourproject`

`rm -Rf .git`

change the variables <`project`> <`ipaddress`> <`hostname`> in

`vi ansible/group_vars/all`

run vagrant
`vagrant up`

edit hostfile for <`ipaddress`> <`hostname`>