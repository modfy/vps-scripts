if [ ! -f ~/.ssh/id_rsa ]; then
 	ssh-keygen -t rsa -b 4096 -C "deploy@modfy.video"
	cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
fi
echo "Public Key"
cat ~/.ssh/id_rsa.pub
read -p "Added to github? : " confirm
ssh -T git@github.com
if [ -d "eng" ]; then
  # Control will enter here if $DIRECTORY exists.
  cd eng/
fi
cd $1/
originalUrl=`git remote get-url origin`
secondString="git@"
echo $originalUrl
atUrl=$(echo "$originalUrl" | sed "s/https:\/\//$secondString/")
result=$(echo  "$atUrl" | sed -z "s/\//:/")
echo $result
git remote set-url origin $result
git pull origin master --ff-only
echo "Private Key"
cd 
cat ~/.ssh/id_rsa
echo "Git Action Template"
cat templateDeploy.yml
echo "CI guide: https://dev.to/knowbee/how-to-setup-continuous-deployment-of-a-website-on-a-vps-using-github-actions-54im"
