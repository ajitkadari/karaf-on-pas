# create a temp directory to hold the app
rm -rf push
mkdir push
cd push

# grab the custom PCF distribution
wget https://karafdist.cfapps.io/apache-karaf-4.2.1-pcfdist.tar.gz --no-check-certificate

# unpack it inside push directory, creating apache-karaf-4.2.1 subdirectory
tar -zxf apache-karaf-4.2.1-pcfdist.tar.gz

# copy the configs in the directory passed by user into the features subdirectory
cp ../$2/* apache-karaf-4.2.1/features

# go into aetos push directory, push, return
cd apache-karaf-4.2.1
cf push $1 -c "bin/custom-karaf" -b java_buildpack
cd ../..
