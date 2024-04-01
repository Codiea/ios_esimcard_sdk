import Foundation

class OtherClass : OtherProtocol{
    
    internal   func fetchBalance(newApiUrl: String, token: String, completion: @escaping (BalanceResponseModel?, Error?) -> Void) {
        
        commonApiService(url: ApiUrl.getBalanceUrl(baseURL: newApiUrl), apiMethod: ApiRequestType.get_, token:token) { result  in
            switch result {
                
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let modelObject = try decoder.decode(BalanceResponseModel.self, from: data)
                    completion(modelObject,nil)
                    return
                } catch {
                    completion(nil, ApiError.jsonDecodingFailed())
                    return
                }
                
            case .failure(let error):
                
                completion(nil,error)
                return
            }
            
        }
        
    }
    
    internal  func fetchNetworkCoverage(newApiUrl: String, token: String, completion: @escaping (NetworkCoverageResponseModel?, Error?) -> Void) {
        
        commonApiService(url: ApiUrl.getNetworkCoveragesUrl(baseURL: newApiUrl), apiMethod: ApiRequestType.get_, token:token) { result  in
            switch result {
                
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let modelObject = try decoder.decode(NetworkCoverageResponseModel.self, from: data)
                    completion(modelObject,nil)
                    return
                } catch {
                    completion(nil, ApiError.jsonDecodingFailed())
                    return
                }
                
            case .failure(let error):
                
                completion(nil,error)
                return
            }
            
        }
        
    }
    
    internal  func refill(newApiUrl: String, token: String, amount: String, cvv: String, cardNo: String, country: String, name: String, expiryDate: String, completion: @escaping (RefillResponseModel?, Error?) -> Void) {
        
        let body: [String: Any] = [
            "name": name,
            "amount":amount,
            "card_no": cardNo,
            "cvv": cvv,
            "country": country,
            "expiry": expiryDate
        ]
        
        commonApiService(url: ApiUrl.getRefillUrl(baseURL: newApiUrl), apiMethod: ApiRequestType.post, token:token, bodyParam: body
        ) { result  in
            switch result {
                
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let modelObject = try decoder.decode(RefillResponseModel.self, from: data)
                    completion(modelObject,nil)
                    return
                } catch {
                    completion(nil, ApiError.jsonDecodingFailed())
                    return
                }
                
            case .failure(let error):
                
                completion(nil,error)
                return
            }
            
        }
        
    }
}
