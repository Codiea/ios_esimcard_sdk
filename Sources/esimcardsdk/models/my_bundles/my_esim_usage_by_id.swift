import Foundation

struct MyEsimUsageByIDResponseModel: Codable {
    let status: Bool?
    let data: DataClass?
    
    internal struct DataClass: Codable {
        let initialDataQuantity: Double?
        let initialDataUnit: String?
        let remDataQuantity: Double?
        let remDataUnit: String?
        
        enum CodingKeys: String, CodingKey {
            case initialDataQuantity = "initial_data_quantity"
            case initialDataUnit = "initial_data_unit"
            case remDataQuantity = "rem_data_quantity"
            case remDataUnit = "rem_data_unit"
        }
    }
}

