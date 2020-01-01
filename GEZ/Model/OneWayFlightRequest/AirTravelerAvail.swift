//
//	AirTravelerAvail.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper
import XMLMapper


class AirTravelerAvail : NSObject, NSCoding, Mappable{
    required init(map: XMLMap) {

    }
    
    var nodeName: String!
    
//    func mapping(map: XMLMap) {
//        passengerTypeQuantity <- map["PassengerTypeQuantity"]
//    }
    

	var passengerTypeQuantity : PassengerTypeQuantity?


//    class func newInstance(map: Map) -> Mappable?{
//        return AirTravelerAvail()
//    }
    required init?(map: Map){}
	private override init(){}
    
    init(passengerTypeQuantity: PassengerTypeQuantity){
        self.passengerTypeQuantity = passengerTypeQuantity
    }

    func mapping(map: Map)
    {
        passengerTypeQuantity <- map["PassengerTypeQuantity"]

    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         passengerTypeQuantity = aDecoder.decodeObject(forKey: "PassengerTypeQuantity") as? PassengerTypeQuantity

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if passengerTypeQuantity != nil{
			aCoder.encode(passengerTypeQuantity, forKey: "PassengerTypeQuantity")
		}

	}

}
