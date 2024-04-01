import Foundation

struct MyEsimsResponseModel: Codable {
    let status: Bool?
    let meta: Meta?
    let data: [Datum]?
    
    internal struct Datum: Codable {
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
    
    internal struct Meta: Codable {
        let total, perPage, currentPage, lastPage: Int?
    }
}



