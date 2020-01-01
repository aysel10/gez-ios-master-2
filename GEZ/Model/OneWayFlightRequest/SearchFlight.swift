//
//	SearchFlight.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper
import XMLMapper


class SearchFlight : NSObject, NSCoding, Mappable{
   

	var xmlns : String?
	var oTAAirLowFareSearchRQ : OTAAirLowFareSearchRQ?


    class func newInstance(map: Map) -> Mappable?{
        return SearchFlight()
    }
    required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		xmlns <- map["@xmlns"]
		oTAAirLowFareSearchRQ <- map["OTA_AirLowFareSearchRQ"]
		
	}
    init(oTAAirLowFareSearchRQ : OTAAirLowFareSearchRQ){
        self.xmlns = "http://epowerv5.amadeus.com.tr/WS"
        self.oTAAirLowFareSearchRQ = oTAAirLowFareSearchRQ
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         xmlns = aDecoder.decodeObject(forKey: "@xmlns") as? String
         oTAAirLowFareSearchRQ = aDecoder.decodeObject(forKey: "OTA_AirLowFareSearchRQ") as? OTAAirLowFareSearchRQ

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
		if oTAAirLowFareSearchRQ != nil{
			aCoder.encode(oTAAirLowFareSearchRQ, forKey: "OTA_AirLowFareSearchRQ")
		}

	}

}
