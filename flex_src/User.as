package
{
	[Bindalbe]
	
	[RemoteClass(alias="com.lewoo.bean.Users")]
	
	public class User
		
	{		
		public var UName : String;
		public var UPwd : String;
		public var UId : int;
		public var Md5Pwd : String;
		public var Salt : String;	
		public function User()
		{	
		}		
	}
}