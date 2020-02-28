package ml.imvasu.soen6441;

import java.util.ArrayList;

public privileged aspect Authentication {

	private static ArrayList<String> blockAddresses  = new ArrayList<String>();
	
	pointcut blacklisting(Client c):
		call( void Server.getClients()) && this(c);
	
	void around(Client c): blacklisting(c) {
		
		if(!(c.server.isClient(c) && blockAddresses.contains(c.address)))
		{	
			blockAddresses.add(c.address);
			System.out.println("WARNING >>> Suspicious call from "+c.address+": "+thisJoinPoint);
			c.disconnect(c.server);
		}
		
	}
	
}
