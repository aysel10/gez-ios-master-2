//
//	OriginDestinationInformation.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper
import XMLMapper

class OriginDestinationInformation : NSObject, NSCoding, Mappable{
    required init(map: XMLMap) {
        
    }
    
    

	var departureDateTime : String?
	var destinationLocation : DestinationLocation?
	var originLocation : DestinationLocation?


//    class func newInstance(map: Map) -> Mappable?{
//        return OriginDestinationInformation()
//    }
	required init?(map: Map){}
    
    init(destinationLocation : DestinationLocation,originLocation : DestinationLocation,departureDateTime : String){
        self.originLocation = originLocation
        self.destinationLocation = destinationLocation
        self.departureDateTime = departureDateTime
    }

    func mapping(map: Map)
    {
        departureDateTime <- map["DepartureDateTime"]
        destinationLocation <- map["DestinationLocation"]
        originLocation <- map["OriginLocation"]

    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         departureDateTime = aDecoder.decodeObject(forKey: "DepartureDateTime") as? String
         destinationLocation = aDecoder.decodeObject(forKey: "DestinationLocation") as? DestinationLocation
         originLocation = aDecoder.decodeObject(forKey: "OriginLocation") as? DestinationLocation

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if departureDateTime != nil{
			aCoder.encode(departureDateTime, forKey: "DepartureDateTime")
		}
		if destinationLocation != nil{
			aCoder.encode(destinationLocation, forKey: "DestinationLocation")
		}
		if originLocation != nil{
			aCoder.encode(originLocation, forKey: "OriginLocation")
		}

	}

}
