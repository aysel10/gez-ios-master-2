//
//	Soap:Body.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper
import XMLMapper

class SoapBody : NSObject, NSCoding, Mappable{

    var searchFlight : SearchFlight?


    class func newInstance(map: Map) -> Mappable?{
        return SoapBody()
    }
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		searchFlight <- map["SearchFlight"]
		
	}
    init(searchFlight : SearchFlight){
        self.searchFlight = searchFlight
    }
    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         searchFlight = aDecoder.decodeObject(forKey: "SearchFlight") as? SearchFlight

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if searchFlight != nil{
			aCoder.encode(searchFlight, forKey: "SearchFlight")
		}

	}

}
