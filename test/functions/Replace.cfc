component extends="org.lucee.cfml.test.LuceeTestCase" {

	function testReplaceUDFOnce() localMode="modern" {
    	text="abcd123efgh123ijklm123nop";
    	res=replace(text,"123",function(find,index,input){
    		return "-#index#-";
    		});
    
    	assertEquals("abcd-4-efgh123ijklm123nop",res);
	}
	function testReplaceUDFAll() localMode="modern" {
    	text="abcd123efgh123ijklm123nop";
    	res=replace(text,"123",function(find,index,input){
    		return "-#index#-";
    		},'all');
    
    	assertEquals("abcd-4-efgh-11-ijklm-19-nop",res);
	}

	function testReplace() localMode="modern" {
		assertEquals("xxdefxxabcxx","#replace("xxabcxxabcxx","abc","def")#");
		assertEquals("xxdefxxdefxx","#replace("xxabcxxabcxx","abc","def","All")#");
		assertEquals("xxdefxxabcxx","#replace("xxabcxxabcxx","abc","def","hans")#");
		assertEquals("bbc","#replace("abc","a","b","all")#");
		assertEquals("a-b-c-d","#replace("a.b.c.d",".","-","all")#");

		src = "camelcase CaMeLcAsE CAMELCASE";
		dest = Replace(src, "camelcase", "CamelCase", "all");
		assertEquals("CamelCase CaMeLcAsE CAMELCASE","#dest#");
	}
}