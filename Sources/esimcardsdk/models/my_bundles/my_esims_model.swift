import Foundation

public struct MyEsimsResponseModel: Codable {
    public let status: Bool?
    public let meta: Meta?
    public let data: [Datum]?
    
    public struct Datum: Codable {
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
    
    public struct Meta: Codable {
        public let total, perPage, currentPage, lastPage: Int?
    }
}



