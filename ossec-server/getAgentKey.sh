#!/bin/bash
#prints the agent key to stdout
BASEDIR=$(dirname $0)

while getopts ":n:h" optarg;
do
  case ${optarg} in 
    n )
      SERVER_HOSTNAME=${OPTARG}
      ;;
    
    i )
      SERVER_IP=${OPTARG}
      ;;

    h )
      echo """ $0 will print out the agent key for the server hostname you specify 
Example: $0 -n testserver
somereallylongrandomkeythatgetsprintedtostdout
"""
  esac
done
#print ossec id to log file
"${BASEDIR}/printID.exp" > "${BASEDIR}/agentList.log"

#get id of agent
SERVER_ID=$(grep "Name: ${SERVER_HOSTNAME}" ${BASEDIR}/agentList.log | cut -d"," -f1 | cut -d" " -f 5)

#print agent key
${BASEDIR}/printAgentKey.exp ${SERVER_ID} > "${BASEDIR}/agentKey-${SERVER_HOSTNAME}.log"
echo "$( awk '/Agent key information for/ { getline; print $0; }' ${BASEDIR}/agentKey-${SERVER_HOSTNAME}.log )"
rm -f "${BASEDIR}/agentKey-${SERVER_HOSTNAME}.log"
