import Foundation

struct MyEsimByIDResponseModel: Codable {
    let status: Bool?
    let data: DataClass?
    
    internal struct DataClass: Codable {
        let sim: Sim?
        let inUsePackages, assignedPackages, completedPackages, revokedPackages: [Package]?
        let coverage: [Coverage]?
        let overallUsage: OverallUsage?
        
        enum CodingKeys: String, CodingKey {
            case sim
            case inUsePackages = "in_use_packages"
            case assignedPackages = "assigned_packages"
            case completedPackages = "completed_packages"
            case revokedPackages = "revoked_packages"
            case coverage
            case overallUsage = "overall_usage"
        }
    }
    
    internal struct Package: Codable {
        let id, packageTypeID, simID, package: String?
        let initialDataQuantity: Double?
        let initialDataUnit: String?
        let remDataQuantity: Double?
        let remDataUnit, dateCreated, dateActivated, dateExpiry: String?
        let activated: Bool?
        let status: String?
        let sim: Sim?
        
        enum CodingKeys: String, CodingKey {
            case id
            case packageTypeID = "package_type_id"
            case simID = "sim_id"
            case package
            case initialDataQuantity = "initial_data_quantity"
            case initialDataUnit = "initial_data_unit"
            case remDataQuantity = "rem_data_quantity"
            case remDataUnit = "rem_data_unit"
            case dateCreated = "date_created"
            case dateActivated = "date_activated"
            case dateExpiry = "date_expiry"
            case activated, status, sim
        }
    }
    
    internal struct Sim: Codable {
        let id: Int?
        let qrCodeText, smdpAddress, matchingID, createdAt: String?
        let lastBundle, status: String?
        let totalBundles: Int?
        
        enum CodingKeys: String, CodingKey {
            case id
            case qrCodeText = "qr_code_text"
            case smdpAddress = "smdp_address"
            case matchingID = "matching_id"
            case createdAt = "created_at"
            case lastBundle = "last_bundle"
            case status
            case totalBundles = "total_bundles"
        }
    }
    
    internal struct Coverage: Codable {
        let id: Int?
        let countryName, code, iso: String?
        let countryImageURL: String?
        let networkName, networkCode: String?
        let t2G, th3G, for4G, fiv5G: Bool?
        
        enum CodingKeys: String, CodingKey {
            case id
            case countryName = "country_name"
            case code, iso
            case countryImageURL = "country_image_url"
            case networkName = "network_name"
            case networkCode = "network_code"
            case t2G = "t_2G"
            case th3G = "th_3G"
            case for4G = "for-4G"
            case fiv5G = "fiv_5G"
        }
    }
    
    internal struct OverallUsage: Codable {
        let initialDataQuantity: Double?
        let initialDataUnit: String?
        let remDataQuantity: Double?
        let remDataUnit: String?
        
        enum CodingKeys: String, CodingKey {
            case initialDataQuantity = "initial_data_quantity"
            case initialDataUnit = "initial_data_unit"
            case remDataQuantity = "rem_data_quantity"
            case remDataUnit = "rem_data_unit"
        }
    }
    
}
