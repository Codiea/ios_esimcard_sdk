import Foundation

struct NetworkCoverageResponseModel: Codable {
    let status: Bool?
    let data: [Datum]?
    
    internal struct Datum: Codable {
        let id: Int?
        let name: String?
        let imageURL: String?
        let networkCoverage: [NetworkCoverage]?
        
        enum CodingKeys: String, CodingKey {
            case id, name
            case imageURL = "image_url"
            case networkCoverage = "network_coverage"
        }
    }
    
    internal struct NetworkCoverage: Codable {
        let networkName, networkCode: String?
        let twoG, threeG, fourG, fiveG: Bool?
        
        enum CodingKeys: String, CodingKey {
            case networkName = "network_name"
            case networkCode = "network_code"
            case twoG = "two_g"
            case threeG = "three_g"
            case fourG = "four_G"
            case fiveG = "five_G"
        }
    }
    
}

