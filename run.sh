#!/bin/sh

echo "Creating xslt conversion"
java -cp "../marc2frbr/jar/saxon/saxon9he.jar"  net.sf.saxon.Transform -xsl:"../marc2frbr/xslt/make.xslt" -s:"rules/colis-lrm-rules.xml" -o:"xslt/colis-marc2lrm.xslt" 
java -cp "../marc2frbr/jar/saxon/saxon9he.jar"  net.sf.saxon.Transform -xsl:"../marc2frbr/xslt/make.xslt" -s:"rules/colis-bibframe-rules.xml" -o:"xslt/colis-marc2bibframe.xslt" 



echo "Running transformation of local files in directory"
java -cp "../marc2frbr/jar/saxon/saxon9he.jar" net.sf.saxon.Transform -xsl:"xslt/colis-marc2lrm.xslt" -s:"input" -o:"output-lrm" merge=true rdf=true
java -cp "../marc2frbr/jar/saxon/saxon9he.jar" net.sf.saxon.Transform -xsl:"xslt/colis-marc2bibframe.xslt" -s:"input" -o:"output-bibframe" merge=true rdf=true

