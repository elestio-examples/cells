#set env vars
set -o allexport; source .env; set +o allexport;

cat << EOT >> ./install-conf.yml
# WebUI Admin definition
frontendlogin: admin
frontendpassword: $ADMIN_PASSWORD

# DB connection
dbconnectiontype: tcp
dbtcphostname: mysql
dbtcpport: 3306
dbtcpname: cells
dbtcpuser: pydio
dbtcppassword: $MYSQL_PASSWORD
EOT

mkdir -p ./cellsdir
chown -R 1000:1000 ./cellsdir

mkdir -p ./install-conf.yml
chown -R 1000:1000 ./install-conf.yml

mkdir -p ./mysqldir
chown -R 1000:1000 ./mysqldir