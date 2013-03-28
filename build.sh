#!/bin/bash
echo "Cleaning up old build.."
rm -rf build/
echo "Creating directories.."
mkdir -p build/skin/frontend/default/belpard-portal/
mkdir -p build/skin/frontend/default/belpard-portal/stylesheets/
mkdir -p build/skin/frontend/default/belpard-portal/javascripts/
mkdir -p build/skin/frontend/default/magic-rangs/
mkdir -p build/skin/frontend/default/magic-rangs/stylesheets/
mkdir -p build/skin/frontend/default/magic-rangs/javascripts/
mkdir -p build/skin/frontend/default/magic-pens/
mkdir -p build/skin/frontend/default/magic-pens/stylesheets/
mkdir -p build/skin/frontend/default/magic-pens/javascripts/
mkdir -p build/skin/frontend/default/leather-seal/
mkdir -p build/skin/frontend/default/leather-seal/stylesheets/
mkdir -p build/skin/frontend/default/leather-seal/javascripts/
mkdir -p build/skin/frontend/default/rennaisance/
mkdir -p build/skin/frontend/default/rennaisance/stylesheets/
mkdir -p build/skin/frontend/default/rennaisance/javascripts/
mkdir -p build/skin/frontend/default/sweepa/
mkdir -p build/skin/frontend/default/sweepa/stylesheets/
mkdir -p build/skin/frontend/default/sweepa/javascripts
mkdir -p build/skin/frontend/default/titan-knives/
mkdir -p build/skin/frontend/default/titan-knives/stylesheets/
mkdir -p build/skin/frontend/default/titan-knives/javascripts/
mkdir -p build/skin/frontend/default/iron-shield/
mkdir -p build/skin/frontend/default/iron-shield/stylesheets/
mkdir -p build/skin/frontend/default/iron-shield/javascripts/
echo "Done Creating Directories."
echo "Distributing files through packages"
packages=( "belpard-portal" "leather-seal" "magic-pens" "magic-rangs" "rennaisance" "sweepa" "titan-knives" "iron-shield" )
for i in "${packages[@]}"
do
   :
   echo "On package $i..";
   echo "** Copying images/shops/$i/ to build/skin/frontend/default/$i/images/";
   cp images/shops/$i/ build/skin/frontend/default/$i/images/ -R
   echo "** Copying stylesheets/$i.css to build/skin/frontend/default/$i/stylesheets/$i.css";
   cp stylesheets/$i.css build/skin/frontend/default/$i/stylesheets/$i.css
   echo "** Custom javascript build manifests"
   if [ -d ./javascripts/manifests/$i/ ]; then
     echo "!! javascript manifest for $i build detected.. copying.."
     cp javascripts/manifests/$i/* build/skin/frontend/default/$i/javascripts/ -R
   fi
done
echo "Bundling common files to default/default"
mkdir -p build/skin/frontend/default/default/stylesheets/
cp stylesheets/app.css  build/skin/frontend/default/default/stylesheets/.
cp stylesheets/foundation-overrides.css  build/skin/frontend/default/default/stylesheets/.
cp stylesheets/common.css  build/skin/frontend/default/default/stylesheets/.
echo "Bundling javascript along with build"
mkdir -p build/js
cp javascripts/* build/js/. -R
rm -rf build/js/manifests/
echo "Done."
echo "All tasks done"
