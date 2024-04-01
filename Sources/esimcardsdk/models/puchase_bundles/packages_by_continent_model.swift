import Foundation

public struct PackagesByContinentResponseModel: Codable {
    public let status: Bool?
    public let meta: Meta?
    public let data: [Datum]?
    
    public struct Datum: Codable {
        public let id, name, price: String?
        public let dataQuantity: Double?
        public let dataUnit: String?
        public let voiceQuantity: Double?
        public let voiceUnit: String?
        public let smsQuantity, packageValidity: Double?
        public let packageValidityUnit, packageType: String?
        
        enum CodingKeys: String, CodingKey {
            case id, name, price
            case dataQuantity = "data_quantity"
            case dataUnit = "data_unit"
            case voiceQuantity = "voice_quantity"
            case voiceUnit = "voice_unit"
            case smsQuantity = "sms_quantity"
            case packageValidity = "package_validity"
            case packageValidityUnit = "package_validity_unit"
            case packageType = "package_type"
        }
    }
    
    public struct Meta: Codable {
        public let total, perPage, currentPage, lastPage: Int?
    }
    
}

