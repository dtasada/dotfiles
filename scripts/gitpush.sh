echo -n "Enter commit message: "
read $commitmsg
git commit -a -m "$commitmsg"
git push origin master
