//
//	DestinationLocation.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper
import XMLMapper

class DestinationLocation : NSObject, NSCoding, Mappable{
    required init?(map: Map) {
        
    }
    
  
//    var nodeName: String!
    
//    func mapping(map: XMLMap) {
//        locationCode <- map["@LocationCode"]
//        multiAirportCityInd <- map["@MultiAirportCityInd"]
//    }
//

	var locationCode : String?
	var multiAirportCityInd : String?

//
//    class func newInstance(map: Map) -> Mappable?{
//        return DestinationLocation()
//    }
//    required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		locationCode <- map["@LocationCode"]
		multiAirportCityInd <- map["@MultiAirportCityInd"]
	}
    
    init(locationCode : String, multiAirportCityInd : String){
        self.locationCode = locationCode
        self.multiAirportCityInd = multiAirportCityInd
    }
    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         locationCode = aDecoder.decodeObject(forKey: "@LocationCode") as? String
         multiAirportCityInd = aDecoder.decodeObject(forKey: "@MultiAirportCityInd") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if locationCode != nil{
			aCoder.encode(locationCode, forKey: "@LocationCode")
		}
		if multiAirportCityInd != nil{
			aCoder.encode(multiAirportCityInd, forKey: "@MultiAirportCityInd")
		}

	}

}
