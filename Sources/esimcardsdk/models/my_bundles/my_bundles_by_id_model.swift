import Foundation

public struct MyBundlesByIDResponseModel: Codable {
    public let status: Bool?
    public let data: [Datum]?
    
    public struct Datum: Codable {
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
}
