import Foundation

struct PackageDetailResponseModel: Codable {
    let status: Bool?
    let data: DataClass?
    
    internal struct DataClass: Codable {
        let id, name, price: String?
        let dataQuantity: Double?
        let dataUnit: String?
        let voiceQuantity: Double?
        let voiceUnit: String?
        let smsQuantity, packageValidity: Double?
        let packageValidityUnit: String?
        let romaingCountries, countries: [Country]?
        
        enum CodingKeys: String, CodingKey {
            case id, name, price
            case dataQuantity = "data_quantity"
            case dataUnit = "data_unit"
            case voiceQuantity = "voice_quantity"
            case voiceUnit = "voice_unit"
            case smsQuantity = "sms_quantity"
            case packageValidity = "package_validity"
            case packageValidityUnit = "package_validity_unit"
            case romaingCountries = "romaing_countries"
            case countries
        }
    }
    
    internal struct Country: Codable {
        let id: Int?
        let name: String?
        let imageURL: String?
        let networkCoverage: [NetworkCoverage]?
        
        enum CodingKeys: String, CodingKey {
            case id, name
            case imageURL = "image_url"
            case networkCoverage = "network_coverage"
        }
    }
    
    internal struct NetworkCoverage: Codable {
        let networkName, networkCode: String?
        let twoG, threeG, fourG, fiveG: Bool?
        
        enum CodingKeys: String, CodingKey {
            case networkName = "network_name"
            case networkCode = "network_code"
            case twoG = "two_g"
            case threeG = "three_g"
            case fourG = "four_G"
            case fiveG = "five_G"
        }
    }
}

