import Foundation

public enum ApiResult<T,Error>{
    case success(T)
    case failure(Error)
}

public enum ApiError: Error {
    case custom(description: String, comment: String? = nil)
    case sdkNotInitialized(comment: String? = nil)
    
    case networkError(comment: String? = nil)
    case serverError(comment: String? = nil)
    case invalidResponseFromApi(comment: String? = nil)
    case jsonDecodingFailed(comment: String? = nil)
    case jsonParsingFailed(comment: String? = nil)
    
    case notFound(comment: String? = nil)
    
    case invalidUrl(comment: String? = nil)
}

extension  ApiError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .custom(let description,let comment):
            return NSLocalizedString(description, comment: comment ?? "")
            
        case .networkError(let comment):
            return NSLocalizedString("Network error occurred.", comment: comment ?? "")
            
        case .serverError(let comment):
            return NSLocalizedString("Server error occurred.", comment: comment ?? "")
            
        case .invalidResponseFromApi(let comment):
            return NSLocalizedString("Invalid response received.", comment: comment ?? "")
            
        case .jsonDecodingFailed(let comment):
            return NSLocalizedString("JSON decoding failed", comment: comment ?? "")
            
        case .sdkNotInitialized(let comment):
            return NSLocalizedString("Initialize SDK first, before continuing", comment: comment ?? "")
            
        case .jsonParsingFailed(let comment):
            return NSLocalizedString("JSON parsing failed", comment: comment ?? "")
            
        case .notFound(let comment):
            return NSLocalizedString("404 not found", comment: comment ?? "")
            
        case .invalidUrl(let comment):
            return NSLocalizedString("Invalid url", comment: comment ?? "")
        }
        
    }
}

enum ApiRequestType{
    case get_
    case post
    case update
    case delete
}

public enum EnumPackageType{
    case dataOnly
    case dataVoiceSms
}

struct MyStyle{
    static func printm(_ val: Any){
        print(val)
    }
}

