package Main;

import java.util.ArrayList;

public privileged aspect Authentication
{
	private static ArrayList<String> record=new ArrayList<String>();
	pointcut warning(Client client):call(void Server.getAllClients()) && this(client);
	
	void around(Client client):warning(client)

	{
		if(!(client.server.isClient(client) && record.contains(client.address)))
		{
			record.add(client.address);
			System.out.println("Warning>>>> suspicios class from "+client.address+": "+thisJoinPoint);
			client.disconnect(client.server);
		}
	}
}
