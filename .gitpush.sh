echo -n "Enter commit message: "
read $commitmsg
git commit -am "$commitmsg"
git push origin main
