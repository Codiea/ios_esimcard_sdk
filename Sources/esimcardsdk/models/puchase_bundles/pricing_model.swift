import Foundation

public struct PricingResponseModel: Codable {
    public let status: Bool?
    public let data: DataClass?
    
    public struct DataClass: Codable {
        public let countries: [Country]?
    }
    
    public struct Country: Codable {
        public let name, code: String?
        public let packages: [Package]?
    }
    
    public struct Package: Codable {
        public let id, name, price: String?
        public let dataQuantity: Double?
        public let dataUnit: DataUnit?
        public let packageValidity: Double?
        public let packageValidityUnit: PackageValidityUnit?
        
        enum CodingKeys: String, CodingKey {
            case id, name, price
            case dataQuantity = "data_quantity"
            case dataUnit = "data_unit"
            case packageValidity = "package_validity"
            case packageValidityUnit = "package_validity_unit"
        }
    }
    
    public enum DataUnit: String, Codable {
        case gb = "GB"
    }
    
    public enum PackageValidityUnit: String, Codable {
        case day = "Day"
    }
    
}


