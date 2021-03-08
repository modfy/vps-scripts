if [ -d "eng" ]; then
  # Control will enter here if $DIRECTORY exists.
  cd eng/
fi
cd $1/
git pull origin master --ff-only
yarn deploy
