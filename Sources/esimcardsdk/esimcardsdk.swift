import Foundation

public class EsimCardSDK{
    
    public static let shared = EsimCardSDK()
    
    private var appConfigDone: Bool = false
    private var newApiUrl: String?
    private var token: String!
    
    private init() {}
    
    
    // MARK: this function is must before using sdk
    
    
    public func config(token tok: String, completion: @escaping (Error?) -> Void) {
        
        // MARK: if token is already set and has same value, that means sdk is already initialized, and the user is calling config function again.
        
        if(tok == token){
            // MARK: already initialized
            completion(nil)
            return
        }
        
        self.token = tok
        
        fetchInitUrl(self.token) { result in
            
            switch result {
                
            case .success(let str):
                self.appConfigDone = true
                self.newApiUrl = str
                
                completion(nil)
                return
                
                
            case .failure(let error):
                self.resetSDK()
                completion(error)
                return
                
            }
        }
    }
    
    private func resetSDK(){
        self.newApiUrl = nil
        self.appConfigDone = false
        self.token = nil
    }
    
    private func fetchInitUrl(_ token: String, completion: @escaping (ApiResult<String, Error>) -> Void) {
        
        // comment: "SDK initialization failed, intialize SDK before using it"
        commonApiService(url: ApiUrl.fetchInitUrl, apiMethod: ApiRequestType.get_ , token: token) { result  in
            
            switch result {
            case .success(let object):
                
                // MARK: we will extract STRING to be pass in completion from object
                let resp: ApiResult<String, Error> = self.getNewUrl(object, baseURL: ApiUrl.baseUrl)
                
                switch resp {
                case .success(let newUrl):
                    completion(.success(newUrl))
                    return
                    
                case .failure(let e):
                    completion(.failure(e))
                    return
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    private func getNewUrl(_ data: Data, baseURL: String) -> (ApiResult<String, Error>) {
        
        //  MyStyle.printm(String(data: data, encoding: .utf8) ?? "Data not available")
        
        do {
            if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                if let status = jsonObject["status"] as? Bool {
                    if(status == true){
                        let remURL: String = jsonObject["data"] as? String ?? ""
                        return .success(baseURL+remURL);
                    }
                    else{
                        return.failure(ApiError.custom(description:jsonObject["message"] as? String ?? "something went wrong"))
                    }
                } else{
                    return.failure(ApiError.invalidResponseFromApi())
                }
            }
            else {
                return .failure(ApiError.jsonParsingFailed())
            }
        } catch {
            return .failure(ApiError.jsonParsingFailed())
        }
        
    }
    
    
    // MARK: Purchase Bundles Functions
    
    
    public func fetchPackages(_ token: String, page: String = "1", packageType: EnumPackageType, completion: @escaping (PackagesResponseModel?, Error?) -> Void) {
        if(appConfigDone == false){
            completion(nil, ApiError.sdkNotInitialized())
            return
        }
        
        PurchaseBundles().fetchPackages(newApiUrl: self.newApiUrl!, token: token, page: page, packageType: packageType, completion: completion)
    }
    
    public func fetchPricing(_ token: String, completion: @escaping (PricingResponseModel?, Error?) -> Void) {
        if(appConfigDone == false){
            completion(nil, ApiError.sdkNotInitialized())
            return
        }
        
        PurchaseBundles().fetchPackagePricing(newApiUrl: self.newApiUrl!, token: token, completion: completion)
    }
    
    public func fetchCountries(_ token: String, completion: @escaping (CountriesResponseModel?, Error?) -> Void) {
        if(appConfigDone == false){
            completion(nil, ApiError.sdkNotInitialized())
            return
        }
        
        PurchaseBundles().fetchCountries(newApiUrl: self.newApiUrl!, token: token, completion: completion)
    }
    
    public func fetchPackagesByCountry(_ token: String, page: String = "1", countryID: String, completion: @escaping (PackagesByCountryResponseModel?, Error?) -> Void) {
        if(appConfigDone == false){
            completion(nil, ApiError.sdkNotInitialized())
            return
        }
        
        PurchaseBundles().fetchPackagesByCountry(newApiUrl: self.newApiUrl!, token: token, page:page, countryID: countryID, completion: completion)
    }
    
    public func fetchContinent(_ token: String, completion: @escaping (ContinentsResponseModel?, Error?) -> Void) {
        if(appConfigDone == false){
            completion(nil, ApiError.sdkNotInitialized())
            return
        }
        
        PurchaseBundles().fetchContinent(newApiUrl: self.newApiUrl!, token: token, completion: completion)
    }
    
    public func fetchPackagesByContinent(_ token: String, page: String = "1", continentID: String, completion: @escaping (PackagesByContinentResponseModel?, Error?) -> Void) {
        if(appConfigDone == false){
            completion(nil, ApiError.sdkNotInitialized())
            return
        }
        
        PurchaseBundles().fetchPackagesByContinent(newApiUrl: self.newApiUrl!, token: token, page:page, continentID: continentID, completion: completion)
    }
    
    public func fetchGlobalPackages(_ token: String, page: String = "1", completion: @escaping (GlobalPackagesResponseModel?, Error?) -> Void) {
        if(appConfigDone == false){
            completion(nil, ApiError.sdkNotInitialized())
            return
        }
        
        PurchaseBundles().fetchGlobalPackages(newApiUrl: self.newApiUrl!, token: token, page:page, completion: completion)
    }
    
    
    
    // MARK: My Bundles Functions
    
    
    public func fetchMyBundles(_ token: String, page: String = "1", completion: @escaping (MyBundlesResponseModel?, Error?) -> Void) {
        if(appConfigDone == false){
            completion(nil, ApiError.sdkNotInitialized())
            return
        }
        
        MyBundlesClass().fetchMyBundles(newApiUrl: self.newApiUrl!, token: token, page: page, completion: completion)
    }
    
    public func fetchMyBundleByID(_ token: String, id: String, completion: @escaping (MyBundlesByIDResponseModel?, Error?) -> Void) {
        if(appConfigDone == false){
            completion(nil, ApiError.sdkNotInitialized())
            return
        }
        
        MyBundlesClass().fetchMyBundleByID(newApiUrl: self.newApiUrl!, token: token, id: id, completion: completion)
    }
    //10
    public func fetchMyEsims(_ token: String, page: String = "1", completion: @escaping (MyEsimsResponseModel?, Error?) -> Void) {
        if(appConfigDone == false){
            completion(nil, ApiError.sdkNotInitialized())
            return
        }
        
        MyBundlesClass().fetchMyEsims(newApiUrl: self.newApiUrl!, token: token, page: page, completion: completion)
    }
    //11
    public func fetchMyEsimByID(_ token: String, id: String, completion: @escaping (MyEsimByIDResponseModel?, Error?) -> Void) {
        if(appConfigDone == false){
            completion(nil, ApiError.sdkNotInitialized())
            return
        }
        
        MyBundlesClass().fetchMyEsimByID(newApiUrl: self.newApiUrl!, token: token, id: id, completion: completion)
    }
    //12
    public func fetchMyEsimUsageByID(_ token: String, id: String, completion: @escaping (MyEsimUsageByIDResponseModel?, Error?) -> Void) {
        if(appConfigDone == false){
            completion(nil, ApiError.sdkNotInitialized())
            return
        }
        
        MyBundlesClass().fetchMyEsimUsageByID(newApiUrl: self.newApiUrl!, token: token, id: id, completion: completion)
    }
    //13
    public func fetchPackageDetail(_ token: String, id: String, completion: @escaping (PackageDetailResponseModel?, Error?) -> Void) {
        if(appConfigDone == false){
            completion(nil, ApiError.sdkNotInitialized())
            return
        }
        
        MyBundlesClass().fetchPackageDetail(newApiUrl: self.newApiUrl!, token: token, id: id, completion: completion)
    }
    
    
    // MARK: Other Functions
    
    //14
    public func fetchBalance(_ token: String, completion: @escaping (BalanceResponseModel?, Error?) -> Void) {
        if(appConfigDone == false){
            completion(nil, ApiError.sdkNotInitialized())
            return
        }
        
        OtherClass().fetchBalance(newApiUrl: self.newApiUrl!, token: token, completion: completion)
    }
    
    //15
    public func fetchNetworkCoverage(_ token: String, completion: @escaping (NetworkCoverageResponseModel?, Error?) -> Void) {
        if(appConfigDone == false){
            completion(nil, ApiError.sdkNotInitialized())
            return
        }
        
        OtherClass().fetchNetworkCoverage(newApiUrl: self.newApiUrl!, token: token, completion: completion)
    }
    
    //16
    public func purchaseDataOnly(token: String, packageTypeId: String, iccid: String? = nil, completion: @escaping (PurchaseDataOnlyResponseModel?, Error?) -> Void){
        if(appConfigDone == false){
            completion(nil, ApiError.sdkNotInitialized())
            return
        }
        
        PurchaseBundles().purchaseDataOnly(newApiUrl: self.newApiUrl!, token: token, packageTypeId: packageTypeId, iccid: iccid, completion: completion)
        
    }
    
    //17
    public func purchaseDataVoiceSms(token: String, packageTypeId: String, imei: String, firstName: String, lastName: String, zipcode: String, state: String, city: String, address1: String, address2: String, completion: @escaping (PurchaseDataVoiceSmsResponseModel?, Error?) -> Void){
        if(appConfigDone == false){
            completion(nil, ApiError.sdkNotInitialized())
            return
        }
        
        PurchaseBundles().purchaseDataVoiceSms(newApiUrl: self.newApiUrl!, token: token, packageTypeId: packageTypeId, imei: imei, firstName: firstName, lastName: lastName, zipcode: zipcode, state: state, city: city, address1: address1, address2: address2, completion: completion)
        
    }
    
    
    //18
    public func refill(token: String, amount: String, cvv: String, cardNo: String, country: String, name: String, expiryDate: String, completion: @escaping (RefillResponseModel?, Error?) -> Void){
        
        if(appConfigDone == false){
            completion(nil, ApiError.sdkNotInitialized())
            return
        }
        
        OtherClass().refill(newApiUrl: self.newApiUrl!, token: token, amount: amount, cvv: cvv, cardNo: cardNo, country: country,  name: name, expiryDate: expiryDate, completion: completion)
    }
}


