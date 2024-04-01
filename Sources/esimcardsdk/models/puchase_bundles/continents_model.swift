import Foundation

struct ContinentsResponseModel: Codable {
    let status: Bool?
    let data: [Datum]?
    
    internal struct Datum: Codable {
        let id: Int?
        let name, code: String?
        let createdAt, updatedAt: String?
        let imageURL: String?
        
        enum CodingKeys: String, CodingKey {
            case id, name, code
            case createdAt = "created_at"
            case updatedAt = "updated_at"
            case imageURL = "image_url"
        }
    }
}


