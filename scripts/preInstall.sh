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
