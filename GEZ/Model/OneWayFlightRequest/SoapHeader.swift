//
//	Soap:Header.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper
import XMLMapper

class SoapHeader : NSObject, NSCoding, Mappable{

    

	var authenticationSoapHeader : AuthenticationSoapHeader?


//    class func newInstance(map: Map) -> Mappable?{
//        return SoapHeader()
//    }
	required init?(map: Map){}

	func mapping(map: Map)
	{
		authenticationSoapHeader <- map["AuthenticationSoapHeader"]
		
	}
    init(authenticationSoapHeader : AuthenticationSoapHeader){
        self.authenticationSoapHeader = authenticationSoapHeader
    }
    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         authenticationSoapHeader = aDecoder.decodeObject(forKey: "AuthenticationSoapHeader") as? AuthenticationSoapHeader

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if authenticationSoapHeader != nil{
			aCoder.encode(authenticationSoapHeader, forKey: "AuthenticationSoapHeader")
		}

	}

}
