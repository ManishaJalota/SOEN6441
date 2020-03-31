package Main;

public class File
{
	public static void main(String args[])
	{
		Server host=new Server("My Server");
		Client jack=new Client("Jack", "evil.net");
		Client jill = new Client("Jill", "evil.net");
		Client jekyll = new Client("Jekyll", "student.net");
		Client hyde = new Client("Hyde", "evil.net");
		jack.connect(host);
		jill.connect(host);
		jekyll.connect(host);
		jekyll.disconnect(host);
		hyde.connect(host);
		jack.getAllClients();
		
	}
}
