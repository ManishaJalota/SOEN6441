
package Main;

import java.util.ArrayList;

public privileged aspect Authentication
{
	private static ArrayList<String> record=new ArrayList<String>();
	pointcut warning(Client client1):call(void Server.getAllClients()) && this(client1);
	
	before(Client client1):warning(client1)

	{
		if(!(client1.server.isClient(client1) && record.contains(client1.address)))
		{
			record.add(client1.address);
			System.out.println("Warning>>>> Suspicious class from "+client1.address+": "+thisJoinPoint);
			client1.disconnect(client1.server);
		}
	}
}
