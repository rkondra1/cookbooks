cd wordpress-patches
patch_files=`find . -name "*.patch"`
cd ..
for patch_file in $patch_files
do
  source_file="$(sed  "s/\.\/\(.*\)\.patch/\1/g" <<< $patch_file)"
  echo "the wordpress installation location is$WORDPRESS_INSTALLATION_LOCATION"
  patch "$WORDPRESS_INSTALLATION_LOCATION"/$source_file wordpress-patches/$patch_file
done
