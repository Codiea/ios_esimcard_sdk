import Foundation

class PurchaseBundles : PurchaseBundlesProtocol{
    
   internal func fetchPackages(newApiUrl:String, token: String, page: String, packageType: EnumPackageType, completion: @escaping (PackagesResponseModel?, Error?) -> Void) {
        let queryParams: [String: String] = [
            "package_type": packageType == EnumPackageType.dataOnly ? "DATA-ONLY" : "DATA-ONLY-SMS",
            "page": page
        ]
        
        commonApiService(url: ApiUrl.getPackagesUrl(baseURL: newApiUrl), apiMethod: ApiRequestType.get_, token:token, queryParam: queryParams) { result  in
            switch result {
                
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let modelObject = try decoder.decode(PackagesResponseModel.self, from: data)
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
    
    internal  func fetchPackagePricing(newApiUrl:String, token: String, completion: @escaping (PricingResponseModel?, Error?) -> Void) {
        
        commonApiService(url: ApiUrl.getPricingUrl(baseURL: newApiUrl), apiMethod: ApiRequestType.get_, token:token) { result  in
            switch result {
                
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let modelObject = try decoder.decode(PricingResponseModel.self, from: data)
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
    
    internal  func fetchCountries(newApiUrl:String, token: String, completion: @escaping (CountriesResponseModel?, Error?) -> Void) {
        
        commonApiService(url: ApiUrl.getCountriesUrl(baseURL: newApiUrl), apiMethod: ApiRequestType.get_, token:token) { result  in
            switch result {
                
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let modelObject = try decoder.decode(CountriesResponseModel.self, from: data)
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
    
    internal func fetchPackagesByCountry(newApiUrl:String, token: String, countryID: String, completion: @escaping (PackagesByCountryResponseModel?, Error?) -> Void) {
        
        commonApiService(url: ApiUrl.getPackByCountryIDUrl(baseURL: newApiUrl, id: countryID), apiMethod: ApiRequestType.get_, token:token) { result  in
            switch result {
                
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let modelObject = try decoder.decode(PackagesByCountryResponseModel.self, from: data)
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
    
    internal func fetchContinent(newApiUrl:String, token: String, completion: @escaping (ContinentsResponseModel?, Error?) -> Void) {
        
        commonApiService(url: ApiUrl.getContinentsUrl(baseURL: newApiUrl), apiMethod: ApiRequestType.get_, token:token) { result  in
            switch result {
                
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let modelObject = try decoder.decode(ContinentsResponseModel.self, from: data)
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
    
    internal func fetchPackagesByContinent(newApiUrl:String, token: String, continentID: String, completion: @escaping (PackagesByContinentResponseModel?, Error?) -> Void) {
        
        commonApiService(url: ApiUrl.getPackByContinentIDUrl(baseURL: newApiUrl, id: continentID), apiMethod: ApiRequestType.get_, token:token) { result  in
            switch result {
                
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let modelObject = try decoder.decode(PackagesByContinentResponseModel.self, from: data)
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
    
    internal func fetchGlobalPackages(newApiUrl:String, token: String, completion: @escaping (GlobalPackagesResponseModel?, Error?) -> Void) {
        
        commonApiService(url: ApiUrl.getGlobalPackagesUrl(baseURL: newApiUrl), apiMethod: ApiRequestType.get_, token:token) { result  in
            switch result {
                
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let modelObject = try decoder.decode(GlobalPackagesResponseModel.self, from: data)
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
    
    internal  func purchaseDataOnly(newApiUrl: String, token: String, packageTypeId: String, iccid: String?, completion: @escaping (PurchaseDataOnlyResponseModel?, Error?) -> Void) {
        
        let body: [String: Any?]!
        
        if(iccid == nil){
            body = ["package_type_id": packageTypeId, "iccid" : nil]
        }
        else{
            body = ["package_type_id": packageTypeId, "iccid":iccid!]
        }
        
        
        commonApiService(url: ApiUrl.getPuchaseDataOnlyUrl(baseURL: newApiUrl), apiMethod: ApiRequestType.post, token: token, bodyParam: body
        ) { result  in
            switch result {
                
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    MyStyle.printm("..................")
                    let modelObject = try decoder.decode(PurchaseDataOnlyResponseModel.self, from: data)
                    completion(modelObject,nil)
                    return
                } catch {
                    MyStyle.printm("..................catch jsonDecodingFailed")
                    completion(nil, ApiError.jsonDecodingFailed())
                    return
                }
                
            case .failure(let error):
                
                completion(nil,error)
                return
            }
            
        }
        
    }
    
    internal  func purchaseDataVoiceSms(newApiUrl: String, token: String, packageTypeId: String, imei: String, firstName: String, lastName: String, zipcode: String, state: String, city: String, address1: String, address2: String, completion: @escaping (PurchaseDataVoiceSmsResponseModel?, Error?) -> Void) {
        
        let body: [String: Any] = ["package_type_id": packageTypeId, "imei":imei, "first_name":firstName, "last_name":lastName, "zipcode":zipcode, "state":state, "city":city, "address1":address1, "address2":address2]
        
        commonApiService(url: ApiUrl.getPuchaseDataVoiceSmsUrl(baseURL: newApiUrl), apiMethod: ApiRequestType.post, token: token, bodyParam: body
        ) { result  in
            switch result {
                
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let modelObject = try decoder.decode(PurchaseDataVoiceSmsResponseModel.self, from: data)
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
