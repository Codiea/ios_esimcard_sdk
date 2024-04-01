import Foundation

struct CountriesResponseModel: Codable {
    let status: Bool?
    let data: [CountryModel]?
    
    internal struct CountryModel: Codable {
        let id: Int?
        let name: String?
        let imageURL: String?
        
        enum CodingKeys: String, CodingKey {
            case id, name
            case imageURL = "image_url"
        }
    }
    
    
}


