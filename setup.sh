rm -rfv ./home_dir/* 2>/dev/null
rm -rfv ./home_dir/.* 2>/dev/null

if [ ! -d "./home_dir/" ]; then
  mkdir home_dir
fi

echo "adding install.sh into home_dir"
cp ./install.sh ./home_dir/
