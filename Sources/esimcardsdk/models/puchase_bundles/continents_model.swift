import Foundation

public struct ContinentsResponseModel: Codable {
    public let status: Bool?
    public let data: [Datum]?
    
    public struct Datum: Codable {
        public let id: Int?
        public let name, code: String?
        public let createdAt, updatedAt: String?
        public let imageURL: String?
        
        enum CodingKeys: String, CodingKey {
            case id, name, code
            case createdAt = "created_at"
            case updatedAt = "updated_at"
            case imageURL = "image_url"
        }
    }
}


