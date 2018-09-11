#!/bin/sh

# clean up
rm -rf distribution
rm -f push/apache-karaf-4.2.1-pcfdist.tar.gz

# create temporary distribution directory
mkdir distribution
cd distribution

# copy Apache Karaf to temporary distribution directory
cp ../../apache-karaf-4.2.1.tar.gz .

# unpack inside distribution directory, creating Apache Karaf 4.2.1 subdirectory
tar -zxf apache-karaf-4.2.1.tar.gz
cd ..

# copy custom start script to the distribution
cp bin/custom-karaf distribution/apache-karaf-4.2.1/bin
chmod 755 distribution/apache-karaf-4.2.1/bin/custom-karaf

# copy custom config into the package - this is where we set the pax.web.cfg port to 8080
cp etc/org.ops4j.pax.web.cfg distribution/apache-karaf-4.2.1/etc

# copy custom logging file - disabled file logging and enabled stdout/console logging
# rm -f distribution/apache-karaf-4.2.1/etc/org.ops4j.pax.logging.cfg
# cp etc/org.ops4j.pax.logging.cfg distribution/apache-karaf-4.2.1/etc/

# tar up the custom distribution 
cd distribution
tar -cf apache-karaf-4.2.1-pcfdist.tar apache-karaf-4.2.1

# compress the custom distribution package
gzip -9 apache-karaf-4.2.1-pcfdist.tar
cd ..

# move the custom distribution package to push directory containing staticfile and manifest file
mv distribution/apache-karaf-4.2.1-pcfdist.tar.gz push/

# push to Pivotal Application Service (PAS) 
cd push
cf push
cd .. 
