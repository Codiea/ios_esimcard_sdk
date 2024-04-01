import Foundation

struct PricingResponseModel: Codable {
    let status: Bool?
    let data: DataClass?
    
    internal struct DataClass: Codable {
        let countries: [Country]?
    }
    
    internal struct Country: Codable {
        let name, code: String?
        let packages: [Package]?
    }
    
    internal struct Package: Codable {
        let id, name, price: String?
        let dataQuantity: Double?
        let dataUnit: DataUnit?
        let packageValidity: Double?
        let packageValidityUnit: PackageValidityUnit?
        
        enum CodingKeys: String, CodingKey {
            case id, name, price
            case dataQuantity = "data_quantity"
            case dataUnit = "data_unit"
            case packageValidity = "package_validity"
            case packageValidityUnit = "package_validity_unit"
        }
    }
    
    internal enum DataUnit: String, Codable {
        case gb = "GB"
    }
    
    internal enum PackageValidityUnit: String, Codable {
        case day = "Day"
    }
    
}


