package ml.imvasu.soen6441;

public class Main {
	
	public static void main(String[] args) {
		
		Server host = new Server("My Server");

		Client jack   = new Client("Jack", "evil.net");
		Client jill   = new Client("Jill", "evil.net");
		Client jekyll = new Client("Jekyll", "student.net");
		Client hyde   = new Client("Hyde", "evil.net");

		// Task 1
		jack.connect(host);   // accommodate
		jill.connect(host);   // accommodate
		jekyll.connect(host); // accommodate
		
		// Task 2
		jekyll.disconnect(host); // accommodate
		
		// TASK 3 (A)
		jack.getAllClients(); // suspicious: Do not accommodate, blacklist and disconnect
		
		// TASK 3 (B)
		jill.getAllClients();  // already blacklisted; Do not accommodate and disconnect
		jill.getAllClients();  // not accommodated
		jill.disconnect(host); // not accommodated
	
		// TASK 4
		jill.connect(host); // recorded, but not accommodated
		hyde.connect(host); // recorded, but not accommodated
		host.getClients();
	}

}
