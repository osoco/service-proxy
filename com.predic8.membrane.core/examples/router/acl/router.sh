#!bin/bash
homeSet() {
 echo "MEMBRANE_HOME variable is now set"
 CLASSPATH=$MEMBRANE_HOME/conf
 CLASSPATH=$CLASSPATH:$MEMBRANE_HOME/starter.jar
 export CLASSPATH
 echo Membrane Router running...
 java  -classpath $CLASSPATH com.predic8.membrane.core.Starter -c rules.xml -b acl-beans.xml
 
}

terminate() {
	echo "Starting of Membrane Router failed."
	echo "Please execute this script from the MEMBRANE_HOME/examples/acl directory"
	
}

homeNotSet() {
  echo "MEMBRANE_HOME variable is not set"

  if [ ! -f  `pwd`/../../starter.jar ]
    then 
    	export MEMBRANE_HOME=`pwd`/../..
    	homeSet	
    else
    	terminate    
  fi 
}


if  [ ! -n  "${MEMBRANE_HOME:+x}"]  
	then homeSet
	else homeNotSet
fi

