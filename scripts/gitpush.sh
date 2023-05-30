git add . 
git commit -am "$1"
git push origin $(git branch | awk '{print $2}')
