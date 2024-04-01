
import Foundation

struct ApiUrl{
    static let baseUrl =  "https://esimcard.com/api/developer/"
    static let fetchInitUrl = "https://esimcard.com/api/developer/check-token"
    //static let checkUser =  "https://esimcard.com/api/user"

    
    // MARK:  Purchase Bundles Api
    
    static func getPricingUrl(baseURL: String)->String{
        return baseURL + "/pricing"
    }
    
    static func getPackagesUrl(baseURL: String)->String{
        return baseURL + "/packages"
    }
    
    static func getCountriesUrl(baseURL: String)->String{
        return baseURL + "/packages/country"
    }
    
    static func getPackByCountryIDUrl(baseURL: String, id: String)->String{
        return baseURL + "/packages/country/\(id)"
    }
    
    static func getContinentsUrl(baseURL: String)->String{
        return baseURL + "/packages/continent"
    }
    
    static func getPackByContinentIDUrl(baseURL: String, id: String)->String{
        return baseURL + "/packages/continent/\(id)"
    }
    
    static func getGlobalPackagesUrl(baseURL: String)->String{
        return baseURL + "/packages/global"
    }
    
    static func getPuchaseDataOnlyUrl(baseURL: String)->String{
        //aslam
        return baseURL + "/package/purchase?test=true"
     //return baseURL + "/package/purchase"
    }
    
    static func getPuchaseDataVoiceSmsUrl(baseURL: String)->String{
        return baseURL + "/package/date_voice_sms/purchase"
    }
    
    // MARK:  My Bundles Api
    
    static func getMyBundlesUrl(baseURL: String)->String{
        return baseURL + "/my-bundles"
    }
    
    static func getMyBundlesByIdUrl(baseURL: String, id: String)->String{
        return baseURL + "/bundles/\(id)"
    }
    
    static func getMyEsimsUrl(baseURL: String)->String{
        return baseURL + "/my-esims"
    }
    
    static func getMyEsimByIDUrl(baseURL: String, id: String)->String{
        return baseURL + "/my-esims/\(id)"
    }
    
    static func getMyEsimUsageByIDUrl(baseURL: String, id: String)->String{
        return baseURL + "/my-sim/\(id)/usage"
    }
    
    static func getPackageDetailUrl(baseURL: String, id: String)->String{
        return baseURL + "/package/detail/\(id)"
    }
    
    // MARK:  Other Api
    
    static func getBalanceUrl(baseURL: String)->String{
        return baseURL + "/balance"
    }
    
    static func getNetworkCoveragesUrl(baseURL: String)->String{
        return baseURL + "/network-coverages"
    }
    
    static func getRefillUrl(baseURL: String)->String{
        return baseURL + "/refill"
    }
    
}
