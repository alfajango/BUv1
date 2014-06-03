source ./env_vars

rpm -q screen
if [ $? -eq '1' ]; then
  sudo yum install -y screen
fi

screen -dmS 'rails'
screen -S rails -p 0 -X stuff "cd ${PRIETARY_HOME} && rails s
"

echo ""
echo "A Rails development server is now running listening on :3000"
echo "You may access the screen session by: 'sudo screen -r rails'"
echo "To access this Rails Web App visit: http://172.31.2.50:3000"
echo ""

