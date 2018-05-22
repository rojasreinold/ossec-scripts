# ossec-scripts
Ossec scripts to automate various tasks

./ossec-server/addAgent.exp will add a server with specified ip address to ossec server. Example:
 
    [username:hostname path]# ./ossec-server/addAgent.exp testclient 10.0.0.5


 ./ossec-server/getAgentKey.sh will print out the agent key for the server hostname you specify. Example:
 
    [username:hostname path]# ./ossec-server/getAgentKey.sh -n testserver
    somereallylongrandomkeythatgetsprintedtostdout
