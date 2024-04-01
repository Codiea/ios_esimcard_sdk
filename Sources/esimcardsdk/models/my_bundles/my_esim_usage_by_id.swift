import Foundation

public struct MyEsimUsageByIDResponseModel: Codable {
    public let status: Bool?
    public let data: DataClass?
    
    public struct DataClass: Codable {
        public let initialDataQuantity: Double?
        public let initialDataUnit: String?
        public let remDataQuantity: Double?
        public let remDataUnit: String?
        
        enum CodingKeys: String, CodingKey {
            case initialDataQuantity = "initial_data_quantity"
            case initialDataUnit = "initial_data_unit"
            case remDataQuantity = "rem_data_quantity"
            case remDataUnit = "rem_data_unit"
        }
    }
}

