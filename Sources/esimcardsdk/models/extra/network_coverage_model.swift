import Foundation

public struct NetworkCoverageResponseModel: Codable {
    public let status: Bool?
    public let data: [Datum]?
    
    public struct Datum: Codable {
        public let id: Int?
        public let name: String?
        public let imageURL: String?
        public let networkCoverage: [NetworkCoverage]?
        
        enum CodingKeys: String, CodingKey {
            case id, name
            case imageURL = "image_url"
            case networkCoverage = "network_coverage"
        }
    }
    
    public struct NetworkCoverage: Codable {
        public let networkName, networkCode: String?
        public let twoG, threeG, fourG, fiveG: Bool?
        
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

