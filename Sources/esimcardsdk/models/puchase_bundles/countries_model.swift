import Foundation

public struct CountriesResponseModel: Codable {
    public let status: Bool?
    public let data: [CountryModel]?
    
    public struct CountryModel: Codable {
        public let id: Int?
        public let name: String?
        public let imageURL: String?
        
        enum CodingKeys: String, CodingKey {
            case id, name
            case imageURL = "image_url"
        }
    }
    
    
}


