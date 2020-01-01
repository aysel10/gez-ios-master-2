//
//	AuthenticationSoapHeader.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper
import XMLMapper

class AuthenticationSoapHeader : NSObject, NSCoding, Mappable{
    required init(map: XMLMap) {
        
    }
    
   // var nodeName: String!
    
//    func mapping(map: XMLMap) {
//        xmlns <- map["@xmlns"]
//        wSPassword <- map["WSPassword"]
//        wSUserName <- map["WSUserName"]
//    }
//

	var xmlns : String?
	var wSPassword : String?
	var wSUserName : String?


//    class func newInstance(map: Map) -> Mappable?{
//        return AuthenticationSoapHeader()
//    }
//
    override init() {
        self.xmlns = "http://epowerv5.amadeus.com.tr/WS"
        self.wSUserName = "wsgezzaz"
        self.wSPassword = "Amadeus1!"
    }
	required init?(map: Map){}

	func mapping(map: Map)
	{
		xmlns <- map["@xmlns"]
		wSPassword <- map["WSPassword"]
		wSUserName <- map["WSUserName"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         xmlns = aDecoder.decodeObject(forKey: "@xmlns") as? String
         wSPassword = aDecoder.decodeObject(forKey: "WSPassword") as? String
         wSUserName = aDecoder.decodeObject(forKey: "WSUserName") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if xmlns != nil{
			aCoder.encode(xmlns, forKey: "@xmlns")
		}
		if wSPassword != nil{
			aCoder.encode(wSPassword, forKey: "WSPassword")
		}
		if wSUserName != nil{
			aCoder.encode(wSUserName, forKey: "WSUserName")
		}

	}

}
