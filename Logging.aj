package Main;

public privileged aspect Logging 
{
	pointcut connectionRequest(Client client):call(void Server.attach(Client)) && args(client);
	
	void around(Client client):connectionRequest(client)
	{
		System.out.println("CONNECTION REQUEST >>>>"+" "+" "+client.toString()+"requests connection to "+client.getServer());
		
		
	}
	pointcut connectionEstablished(Client client):call(void Server.attach(Client))&& args(client);
	
	 after(Client client):connectionEstablished(client)
	{
		System.out.println("Connection Established between "+client.toString()+" and "+client.getServer());
		System.out.println("Clients logged in"+client.server.clients);
		System.out.println();
	}
	 pointcut disconnection(Client client):call(void Server.detach(Client)) && args(client);
	
	 after( Client client):disconnection(client){
		 System.out.println("Connection Broke between "+client.toString()+" and "+client.getServer()+".");
		 System.out.println("Clients logged in: "+client.server.clients);
	 }
}
