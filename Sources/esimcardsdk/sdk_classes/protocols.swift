import Foundation

internal protocol PurchaseBundlesProtocol {
    func fetchPackages(newApiUrl:String, token: String, page: String, packageType: EnumPackageType, completion: @escaping (PackagesResponseModel?, Error?) -> Void)
    
    func fetchPackagePricing(newApiUrl:String, token: String, completion: @escaping (PricingResponseModel?, Error?) -> Void)
    
    func fetchCountries(newApiUrl:String, token: String, completion: @escaping (CountriesResponseModel?, Error?) -> Void)
    
    func fetchPackagesByCountry(newApiUrl:String, token: String, countryID: String, completion: @escaping (PackagesByCountryResponseModel?, Error?) -> Void)
    
    func fetchContinent(newApiUrl:String, token: String, completion: @escaping (ContinentsResponseModel?, Error?) -> Void)
    
    func fetchPackagesByContinent(newApiUrl:String, token: String, continentID: String, completion: @escaping (PackagesByContinentResponseModel?, Error?) -> Void)
    
    func fetchGlobalPackages(newApiUrl:String, token: String, completion: @escaping (GlobalPackagesResponseModel?, Error?) -> Void)
    
    func purchaseDataOnly(newApiUrl:String, token: String, packageTypeId: String, iccid: String?, completion: @escaping (PurchaseDataOnlyResponseModel?, Error?) -> Void)
    
    func purchaseDataVoiceSms(newApiUrl:String, token: String, packageTypeId: String, imei: String, firstName: String, lastName: String, zipcode: String, state: String, city: String, address1: String, address2: String, completion: @escaping (PurchaseDataVoiceSmsResponseModel?, Error?) -> Void)
}

internal protocol MyBundlesProtocol {
    func fetchMyBundles(newApiUrl:String, token: String, page: String, completion: @escaping (MyBundlesResponseModel?, Error?) -> Void)
    
    func fetchMyBundleByID(newApiUrl:String, token: String, id: String, completion: @escaping (MyBundlesByIDResponseModel?, Error?) -> Void)
    
    func fetchMyEsims(newApiUrl:String, token: String, page: String, completion: @escaping (MyEsimsResponseModel?, Error?) -> Void)
    
    func fetchMyEsimByID(newApiUrl:String, token: String, id: String, completion: @escaping (MyEsimByIDResponseModel?, Error?) -> Void)
    
    func fetchMyEsimUsageByID(newApiUrl:String, token: String, id: String, completion: @escaping (MyEsimUsageByIDResponseModel?, Error?) -> Void)
    
    func fetchPackageDetail(newApiUrl:String, token: String, id: String, completion: @escaping (PackageDetailResponseModel?, Error?) -> Void)
}

internal protocol OtherProtocol {
    func fetchBalance(newApiUrl:String, token: String, completion: @escaping (BalanceResponseModel?, Error?) -> Void)
    
    func fetchNetworkCoverage(newApiUrl:String, token: String, completion: @escaping (NetworkCoverageResponseModel?, Error?) -> Void)
    
    func refill(newApiUrl:String, token: String,
                amount: String, cvv: String, cardNo: String, country: String, name: String, expiryDate: String, completion: @escaping (RefillResponseModel?, Error?) -> Void)
}
