import Foundation

internal func commonApiService(url urlString: String, apiMethod: ApiRequestType, token: String? = nil, queryParam: [String:String]? = nil, bodyParam: [String:Any?]? = nil, completion: @escaping (ApiResult<Data, Error>) -> Void) {
    
    guard var urlComponents = URLComponents(string: urlString) else {
        completion(.failure(ApiError.invalidUrl()))
        return
    }
    
    if let queryParam = queryParam {
        urlComponents.queryItems = queryParam.map{ URLQueryItem(name: $0.key, value: $0.value) }
    }
    
    guard let url = urlComponents.url else {
        completion(.failure(ApiError.invalidUrl()))
        return
    }
    
    var request = URLRequest(url: url)
    
    if(apiMethod==ApiRequestType.post){
        request.httpMethod = "POST"
    }
    else if(apiMethod==ApiRequestType.delete){
        request.httpMethod = "DELETE"
    }
    else if(apiMethod==ApiRequestType.update){
        request.httpMethod = "UPDATE"
    }
    else{
        request.httpMethod = "GET"
    }
    
    
    if let token = token {
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
    }
    
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.setValue("Content-Type", forHTTPHeaderField: "Accept")
    
    if let body = bodyParam {
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
        } catch {
            MyStyle.printm("commonApiService: Error in request body:")
            completion(.failure(ApiError.jsonParsingFailed(comment: "Error in request body")))
            return
        }
    }
    
    //    MyStyle.printm(request.url!)
    //    MyStyle.printm(request.allHTTPHeaderFields!)
    //    MyStyle.printm(String(data: request.httpBody ?? Data(), encoding: .utf8) ?? "Data not available")
    
    let session = URLSession.shared
    let task = session.dataTask(with: request) { data, response, error in
        if let error = error {
            // INTERNET ERROR
            completion(.failure(ApiError.networkError()))
            MyStyle.printm("commonApiService: Error 1:")
            return
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
            // INVALID RESPONSE
            completion(.failure(ApiError.invalidResponseFromApi()))
            MyStyle.printm("commonApiService: Error 2:")
            return
        }
        
        
        guard (200...299).contains(httpResponse.statusCode) else {
            // SERVER ERROR
            
            if(httpResponse.statusCode == 400){
                completion(.failure(ApiError.notFound(comment: "status code: \(httpResponse.statusCode)")))
                MyStyle.printm("commonApiService: Error 404:")
                return
            }
            
            else if(httpResponse.statusCode == 422){
                completion(.failure(ApiError.custom(description: "The server can not process your request", comment: "status code: \(httpResponse.statusCode)")))
                MyStyle.printm("commonApiService: Error 422:")
                
                return
            }
            
            completion(.failure(ApiError.serverError()))
            MyStyle.printm("commonApiService: Error 3:")
            MyStyle.printm(httpResponse.statusCode)
            return
        }
        
        
        guard let data = data else {
            // NO DATA RECEIVED
            MyStyle.printm("commonApiService: Error 5:")
            completion(.failure(ApiError.invalidResponseFromApi(comment: "No response received")))
            
            return
        }
        
        //MyStyle.printm(String(data: data, encoding: .utf8) ?? "Data not available")
        
        do {
            if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                if let status = jsonObject["status"] as? Bool {
                    if(status == true){
                        completion(.success(data))
                        MyStyle.printm("commonApiService: ok 1")
                        return;
                    }
                    else{
                        MyStyle.printm("error 1")
                        completion(.failure(ApiError.custom(description:jsonObject["message"] as? String ?? "something went wrong")))
                        return;
                    }
                } else{
                    MyStyle.printm("error 2")
                    completion(.failure(ApiError.invalidResponseFromApi()))
                    return;
                }
            }
            else {
                MyStyle.printm("error 3")
                completion(.failure(ApiError.jsonParsingFailed()))
                return;
            }
        } catch {
            MyStyle.printm("error 4")
            completion(.failure(ApiError.jsonDecodingFailed()))
            return
        }
        
    }
    
    task.resume()
}

