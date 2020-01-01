//
//	TravelerInfoSummary.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper
import XMLMapper

class TravelerInfoSummary : NSObject, NSCoding, Mappable{


	var airTravelerAvail : AirTravelerAvail?


    class func newInstance(map: Map) -> Mappable?{
        return TravelerInfoSummary()
    }
    required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		airTravelerAvail <- map["AirTravelerAvail"]
		
	}
    init(airTravelerAvail : AirTravelerAvail){
        self.airTravelerAvail = airTravelerAvail
    }
    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         airTravelerAvail = aDecoder.decodeObject(forKey: "AirTravelerAvail") as? AirTravelerAvail

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if airTravelerAvail != nil{
			aCoder.encode(airTravelerAvail, forKey: "AirTravelerAvail")
		}

	}

}
