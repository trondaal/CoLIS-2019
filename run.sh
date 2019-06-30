#!/bin/sh

echo "Creating xslt conversion for lrm"
java -cp "../marc2entities/jar/saxon/saxon9he.jar"  net.sf.saxon.Transform -xsl:"../marc2entities/xslt/make.xslt" -s:"rules/colis-lrm-rules.xml" -o:"xslt/colis-marc2lrm.xslt" 
echo "Creating xslt conversion for bibframe full"
java -cp "../marc2entities/jar/saxon/saxon9he.jar"  net.sf.saxon.Transform -xsl:"../marc2entities/xslt/make.xslt" -s:"rules/colis-bibframe-full-rules.xml" -o:"xslt/colis-marc2bibframe-full.xslt" 
echo "Creating xslt conversion for bibframe strict"
java -cp "../marc2entities/jar/saxon/saxon9he.jar"  net.sf.saxon.Transform -xsl:"../marc2entities/xslt/make.xslt" -s:"rules/colis-bibframe-strict-rules.xml" -o:"xslt/colis-marc2bibframe-strict.xslt" 

echo "Running transformation for lrm"
java -cp "../marc2entities/jar/saxon/saxon9he.jar" net.sf.saxon.Transform -xsl:"xslt/colis-marc2lrm.xslt" -s:"input" -o:"output-lrm" merge=true rdf=true
#echo "Running transformation for bibframe full"
#java -cp "../marc2entities/jar/saxon/saxon9he.jar" net.sf.saxon.Transform -xsl:"xslt/colis-marc2bibframe-full.xslt" -s:"input" -o:"output-bibframe-full" merge=true rdf=true
#echo "Running transformation for bibframe strict"
#java -cp "../marc2entities/jar/saxon/saxon9he.jar" net.sf.saxon.Transform -xsl:"xslt/colis-marc2bibframe-strict.xslt" -s:"input" -o:"output-bibframe-strict" merge=true rdf=true

