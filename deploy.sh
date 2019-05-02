set -e
echo "Deploying $APP_NAME using $EMAIL"
echo "" > ~/.netrc
echo "machine api.heroku.com" >> ~/.netrc
echo "  login $EMAIL" >> ~/.netrc
echo "  password $API_KEY" >> ~/.netrc
echo "machine git.heroku.com" >> ~/.netrc
echo "  login $EMAIL" >> ~/.netrc
echo "  password $API_KEY" >> ~/.netrc
git config --global user.email "$EMAIL"
git config --global user.name "$APP_NAME"
git config --global push.default simple

rm -rf /git/
mkdir /git/
cd /git/
git init
heroku git:remote -a $APP_NAME

cp /staging/* ./
echo 'web: ./run.sh' > ./Procfile
echo $(date) > stamp.txt

git add -A .
git commit -m "OK $(date)"
git push heroku master -f