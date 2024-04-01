import Foundation

public struct MyEsimByIDResponseModel: Codable {
    public let status: Bool?
    public let data: DataClass?
    
    public struct DataClass: Codable {
        public let sim: Sim?
        public let inUsePackages, assignedPackages, completedPackages, revokedPackages: [Package]?
        public let coverage: [Coverage]?
        public let overallUsage: OverallUsage?
        
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
    
    public struct Package: Codable {
        public let id, packageTypeID, simID, package: String?
        public let initialDataQuantity: Double?
        public let initialDataUnit: String?
        public let remDataQuantity: Double?
        public let remDataUnit, dateCreated, dateActivated, dateExpiry: String?
        public let activated: Bool?
        public let status: String?
        public let sim: Sim?
        
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
    
    public struct Sim: Codable {
        public let id: Int?
        public let qrCodeText, smdpAddress, matchingID, createdAt: String?
        public let lastBundle, status: String?
        public let totalBundles: Int?
        
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
    
    public struct Coverage: Codable {
        public let id: Int?
        public let countryName, code, iso: String?
        public let countryImageURL: String?
        public let networkName, networkCode: String?
        public let t2G, th3G, for4G, fiv5G: Bool?
        
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
    
    public struct OverallUsage: Codable {
        public let initialDataQuantity: Double?
        public let initialDataUnit: String?
        public let remDataQuantity: Double?
        public let remDataUnit: String?
        
        enum CodingKeys: String, CodingKey {
            case initialDataQuantity = "initial_data_quantity"
            case initialDataUnit = "initial_data_unit"
            case remDataQuantity = "rem_data_quantity"
            case remDataUnit = "rem_data_unit"
        }
    }
    
}
