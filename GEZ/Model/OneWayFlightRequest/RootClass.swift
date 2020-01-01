//
//	RootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper
import XMLMapper

class RootClass : NSObject, NSCoding, Mappable{
 
    	var soapEnvelope : SoapEnvelope?


    class func newInstance(map: Map) -> Mappable?{
        return RootClass()
    }
    required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		soapEnvelope <- map["soap:Envelope"]
		
	}
    init(soapEnvelope : SoapEnvelope){
        self.soapEnvelope = soapEnvelope
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
        soapEnvelope = aDecoder.decodeObject(forKey: "soap:Envelope") as? SoapEnvelope

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if soapEnvelope != nil{
			aCoder.encode(soapEnvelope, forKey: "soap:Envelope")
		}

	}

}
