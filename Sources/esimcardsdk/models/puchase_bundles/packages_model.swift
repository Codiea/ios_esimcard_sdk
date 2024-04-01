import Foundation

public struct PackagesResponseModel: Codable {
    public let status: Bool?
    public let meta: Meta?
    public let data: [PackagesModel]?
    
    public struct Meta: Codable {
        public   let total, perPage, currentPage, lastPage: Int?
    }
    
    public enum DataUnit: String, Codable {
        case gb = "GB"
    }
    
    public enum PackageValidityUnit: String, Codable {
        case day = "Day"
    }
    
    public enum VoiceUnit: String, Codable {
        case minutes = "Minutes"
    }
    
    public enum PackageType: String, Codable {
        case dataOnly = "DATA-ONLY"
    }
    
    public struct PackagesModel: Codable {
        public let id, name, price: String?
        public let dataQuantity: Double?
        public let dataUnit: DataUnit?
        public let voiceQuantity: Double?
        public let voiceUnit: VoiceUnit?
        public let smsQuantity, packageValidity: Double?
        public let packageValidityUnit: PackageValidityUnit?
        public let packageType: PackageType?
        
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
    
    
}


