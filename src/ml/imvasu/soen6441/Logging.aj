package ml.imvasu.soen6441;

public privileged aspect Logging {
	
	// TASK 1
	
	// 1. Capture call() before connection
	pointcut captureClientConnectionRequestBeforeConnection (Client client):
		call( void Server.attach(Client)) && args(client);
	
	void around (Client client): captureClientConnectionRequestBeforeConnection (client)
	{
		System.out.println("CONNECTION REQUEST >>> "+client.toString()+" requests connection to "+client.getServer()+".");
	
		// Check BlockAddress
		if(!Authentication.blockAddresses.contains(client.address))
		{
			proceed(client);
		}
	}
	
	// 2. Capture call() After successful connection established
	pointcut captureClientConnectionRequestAfterConnection (Client client):
		call( void Server.attach(Client)) && args(client);
	
	after (Client client): captureClientConnectionRequestAfterConnection (client)
	{
		// Check BlockAddress
		if(!Authentication.blockAddresses.contains(client.address))
		{
			System.out.println("Connection established between "+client.toString()+" and "+client.getServer()+".");
			System.out.println("Clients logged in: "+client.server.clients);
			System.out.println();
		}
	}
	
	// TASK 2
	
	// 3. Capture call() After successful disconnect
	pointcut captureClientDisconnectRequestAfterDisconnect (Client client):
		call( void Server.detach(Client)) && args(client);
	
	after (Client client): captureClientDisconnectRequestAfterDisconnect (client)
	{
		System.out.println("Connection broken between "+client.toString()+" and "+client.getServer()+".");
		System.out.println("Clients logged in: "+client.server.clients);
		System.out.println();
	}
}
