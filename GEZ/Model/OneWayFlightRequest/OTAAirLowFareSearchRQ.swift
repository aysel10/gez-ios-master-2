//
//	OTAAirLowFareSearchRQ.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper
import XMLMapper

class OTAAirLowFareSearchRQ : NSObject, NSCoding, Mappable{
    required init?(map: Map) {
       
    }
    
	var maxPrice : String?
	var providerType : String?
	var refundableType : String?
	var version : String?
	var xmlnsxsd : String?
	var xmlnsxsi : String?
	var originDestinationInformation : OriginDestinationInformation?
	var travelerInfoSummary : TravelerInfoSummary?


    class func newInstance(map: Map) -> Mappable?{
        return OTAAirLowFareSearchRQ()
    }
	private override init(){}

    init(maxPrice : String, originDestinationInformation : OriginDestinationInformation,travelerInfoSummary : TravelerInfoSummary){
        self.providerType = "OnlyAmadeus"
        self.refundableType = "AllFlights"
        self.xmlnsxsi = "http://www.w3.org/2001/XMLSchema-instance"
        self.xmlnsxsd = "http://www.w3.org/2001/XMLSchema-instance"
        self.version = "0"
        self.maxPrice = maxPrice
        self.originDestinationInformation = originDestinationInformation
    }

	func mapping(map: Map)
	{
		providerType <- map["@ProviderType"]
		refundableType <- map["@RefundableType"]
        xmlnsxsi <- map["@xmlns:xsi"]
		xmlnsxsd <- map["@xmlns:xsd"]
        version <- map["@Version"]
        maxPrice <- map["@MaxPrice"]
		originDestinationInformation <- map["OriginDestinationInformation"]
		travelerInfoSummary <- map["TravelerInfoSummary"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         maxPrice = aDecoder.decodeObject(forKey: "@MaxPrice") as? String
         providerType = aDecoder.decodeObject(forKey: "@ProviderType") as? String
         refundableType = aDecoder.decodeObject(forKey: "@RefundableType") as? String
         version = aDecoder.decodeObject(forKey: "@Version") as? String
         xmlnsxsd = aDecoder.decodeObject(forKey: "@xmlns:xsd") as? String
         xmlnsxsi = aDecoder.decodeObject(forKey: "@xmlns:xsi") as? String
         originDestinationInformation = aDecoder.decodeObject(forKey: "OriginDestinationInformation") as? OriginDestinationInformation
         travelerInfoSummary = aDecoder.decodeObject(forKey: "TravelerInfoSummary") as? TravelerInfoSummary

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if maxPrice != nil{
			aCoder.encode(maxPrice, forKey: "@MaxPrice")
		}
		if providerType != nil{
			aCoder.encode(providerType, forKey: "@ProviderType")
		}
		if refundableType != nil{
			aCoder.encode(refundableType, forKey: "@RefundableType")
		}
		if version != nil{
			aCoder.encode(version, forKey: "@Version")
		}
		if xmlnsxsd != nil{
			aCoder.encode(xmlnsxsd, forKey: "@xmlns:xsd")
		}
		if xmlnsxsi != nil{
			aCoder.encode(xmlnsxsi, forKey: "@xmlns:xsi")
		}
		if originDestinationInformation != nil{
			aCoder.encode(originDestinationInformation, forKey: "OriginDestinationInformation")
		}
		if travelerInfoSummary != nil{
			aCoder.encode(travelerInfoSummary, forKey: "TravelerInfoSummary")
		}

	}

}
