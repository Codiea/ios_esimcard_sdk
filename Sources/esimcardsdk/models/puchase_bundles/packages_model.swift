import Foundation

public struct PackagesResponseModel: Codable {
    let status: Bool?
    let meta: Meta?
    let data: [PackagesModel]?
    
    public struct Meta: Codable {
        let total, perPage, currentPage, lastPage: Int?
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
        let id, name, price: String?
        let dataQuantity: Double?
        let dataUnit: DataUnit?
        let voiceQuantity: Double?
        let voiceUnit: VoiceUnit?
        let smsQuantity, packageValidity: Double?
        let packageValidityUnit: PackageValidityUnit?
        let packageType: PackageType?
        
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


