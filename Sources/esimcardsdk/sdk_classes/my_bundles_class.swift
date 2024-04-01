import Foundation

class MyBundlesClass : MyBundlesProtocol{
    internal func fetchMyBundles(newApiUrl: String, token: String, page: String, completion: @escaping (MyBundlesResponseModel?, Error?) -> Void) {
        
        let queryParams: [String: String] = [
            "page": page
        ]
        
        commonApiService(url: ApiUrl.getMyBundlesUrl(baseURL: newApiUrl), apiMethod: ApiRequestType.get_, token:token, queryParam: queryParams) { result  in
            switch result {
                
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let modelObject = try decoder.decode(MyBundlesResponseModel.self, from: data)
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
    
    internal func fetchMyBundleByID(newApiUrl: String, token: String, id: String, completion: @escaping (MyBundlesByIDResponseModel?, Error?) -> Void) {
        commonApiService(url: ApiUrl.getMyBundlesByIdUrl(baseURL: newApiUrl, id: id), apiMethod: ApiRequestType.get_, token:token) { result  in
            switch result {
                
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let modelObject = try decoder.decode(MyBundlesByIDResponseModel.self, from: data)
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
    
    internal func fetchMyEsims(newApiUrl: String, token: String, page: String, completion: @escaping (MyEsimsResponseModel?, Error?) -> Void) {
        
        let queryParams: [String: String] = [
            "page": page
        ]
        
        commonApiService(url: ApiUrl.getMyEsimsUrl(baseURL: newApiUrl), apiMethod: ApiRequestType.get_, token:token, queryParam: queryParams) { result  in
            switch result {
                
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let modelObject = try decoder.decode(MyEsimsResponseModel.self, from: data)
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
    
    internal func fetchMyEsimByID(newApiUrl: String, token: String, id: String, completion: @escaping (MyEsimByIDResponseModel?, Error?) -> Void) {
        
        commonApiService(url: ApiUrl.getMyEsimByIDUrl(baseURL: newApiUrl, id: id), apiMethod: ApiRequestType.get_, token:token) { result  in
            switch result {
                
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let modelObject = try decoder.decode(MyEsimByIDResponseModel.self, from: data)
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
    
    internal func fetchMyEsimUsageByID(newApiUrl: String, token: String, id: String, completion: @escaping (MyEsimUsageByIDResponseModel?, Error?) -> Void) {
        
        commonApiService(url: ApiUrl.getMyEsimUsageByIDUrl(baseURL: newApiUrl, id: id), apiMethod: ApiRequestType.get_, token:token) { result  in
            switch result {
                
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let modelObject = try decoder.decode(MyEsimUsageByIDResponseModel.self, from: data)
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
    
    internal  func fetchPackageDetail(newApiUrl: String, token: String, id: String, completion: @escaping (PackageDetailResponseModel?, Error?) -> Void) {
        
        commonApiService(url: ApiUrl.getPackageDetailUrl(baseURL: newApiUrl, id: id), apiMethod: ApiRequestType.get_, token:token) { result  in
            switch result {
                
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let modelObject = try decoder.decode(PackageDetailResponseModel.self, from: data)
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

