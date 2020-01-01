//
//	Soap:Envelope.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper
import XMLMapper


class SoapEnvelope : NSObject, NSCoding, Mappable{
    required init?(map: Map) {
        
    }
    

	var xmlnsxsi : String?
    var xmlnssoap : String?
    var xmlnsxsd : String?
	var soapBody : SoapBody?
	var soapHeader : SoapHeader?


//    class func newInstance(map: Map) -> Mappable?{
//        return SoapEnvelope(soapHeader: soapHead, soapBody: SoapBody)
//    }

    func mapping(map: Map)
    {
        xmlnssoap <- map["@xmlns:soap"]
        xmlnsxsd <- map["@xmlns:xsd"]
        xmlnsxsi <- map["@xmlns:xsi"]
        soapBody <- map["soap:Body"]
        soapHeader <- map["soap:Header"]
    }
    
    init(soapHeader : SoapHeader,soapBody : SoapBody){
        self.xmlnsxsd = "http://www.w3.org/2001/XMLSchema"
        self.xmlnssoap = "http://schemas.xmlsoap.org/soap/envelope/"
        self.soapHeader = soapHeader
        self.soapBody = soapBody
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
        xmlnsxsi = aDecoder.decodeObject(forKey: "@xmlns:xsi") as? String
        xmlnsxsd = aDecoder.decodeObject(forKey: "@xmlns:xsd") as? String
        xmlnssoap = aDecoder.decodeObject(forKey: "@xmlns:soap") as? String
        soapHeader = aDecoder.decodeObject(forKey: "soap:Header") as? SoapHeader
        soapBody = aDecoder.decodeObject(forKey: "soap:Body") as? SoapBody
	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if xmlnssoap != nil{
			aCoder.encode(xmlnssoap, forKey: "@xmlns:soap")
		}
		if xmlnsxsd != nil{
			aCoder.encode(xmlnsxsd, forKey: "@xmlns:xsd")
		}
		if xmlnsxsi != nil{
			aCoder.encode(xmlnsxsi, forKey: "@xmlns:xsi")
		}
		if soapBody != nil{
			aCoder.encode(soapBody, forKey: "soap:Body")
		}
		if soapHeader != nil{
			aCoder.encode(soapHeader, forKey: "soap:Header")
		}

	}

}
