import Foundation

struct PackagesByCountryResponseModel: Codable {
    let status: Bool?
    let meta: Meta?
    let data: [Datum]?
    
    internal struct Datum: Codable {
        let id, name, price: String?
        let dataQuantity: Double?
        let dataUnit: String?
        let voiceQuantity: Double?
        let voiceUnit: String?
        let smsQuantity, packageValidity: Double?
        let packageValidityUnit, packageType: String?
        
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
    
    internal struct Meta: Codable {
        let total, perPage, currentPage, lastPage: Int?
    }
    
}
