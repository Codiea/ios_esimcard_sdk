import Foundation

struct PurchaseDataOnlyResponseModel: Codable {
    let status: Bool?
    let data: DataClass?
    
    
    internal struct DataClass: Codable {
        let sim: Sim?
        let package: Package?
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

        internal enum CodingKeys: String, CodingKey {
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
        let id: Int
        let qrCodeText, smdpAddress: String?
        let matchingID, createdAt, lastBundle, status: String?
        let totalBundles: Double?

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
