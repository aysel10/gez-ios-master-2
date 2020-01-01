//
//	PassengerTypeQuantity.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper
import XMLMapper

class PassengerTypeQuantity : NSObject, NSCoding, Mappable{


	var code : String?


    class func newInstance(map: Map) -> Mappable?{
        return PassengerTypeQuantity()
    }
    required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		code <- map["@Code"]
		
	}
    init(code:String){
        self.code = code
    }
    

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         code = aDecoder.decodeObject(forKey: "@Code") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if code != nil{
			aCoder.encode(code, forKey: "@Code")
		}

	}

}
