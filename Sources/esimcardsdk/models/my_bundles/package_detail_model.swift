import Foundation

public struct PackageDetailResponseModel: Codable {
    public let status: Bool?
    public let data: DataClass?
    
    public struct DataClass: Codable {
        public let id, name, price: String?
        public let dataQuantity: Double?
        public let dataUnit: String?
        public let voiceQuantity: Double?
        public let voiceUnit: String?
        public let smsQuantity, packageValidity: Double?
        public let packageValidityUnit: String?
        public let romaingCountries, countries: [Country]?
        
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
    
    public struct Country: Codable {
        public let id: Int?
        public let name: String?
        public let imageURL: String?
        public let networkCoverage: [NetworkCoverage]?
        
        enum CodingKeys: String, CodingKey {
            case id, name
            case imageURL = "image_url"
            case networkCoverage = "network_coverage"
        }
    }
    
    public struct NetworkCoverage: Codable {
        public let networkName, networkCode: String?
        public let twoG, threeG, fourG, fiveG: Bool?
        
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

