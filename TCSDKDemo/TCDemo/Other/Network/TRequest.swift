//
//  Request.swift
//  SmartLED
//
//  Created by Samuel on 2019/11/4.
//  Copyright © 2019 Haogang Chen. All rights reserved.
//

import Alamofire

protocol Requestable: AnyObject {}

let sharedSessionManager: Alamofire.SessionManager = {
     let configuration = URLSessionConfiguration.default
     configuration.timeoutIntervalForRequest = 60
     return Alamofire.SessionManager(configuration: configuration)
 }()

extension Requestable {
    
    @discardableResult
    func request(_ route: Route) -> DataRequest {
        let properties = route.requestProperties
        let serverUrl = URL(string: "http://xksocial-test.xkglow.com")
        let encoding: ParameterEncoding
        switch properties.method {
        case .get: encoding = URLEncoding.queryString
        default: encoding = JSONEncoding.default
        }
        let url = serverUrl!.appendingPathComponent(properties.path)
        return apiRequest(url: url, method: properties.method, parameters: properties.query, encoding: encoding, headers: [:])
    }
    
    @discardableResult
    func apiRequest(url: URL, method: HTTPMethod, parameters: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: HTTPHeaders) -> DataRequest {
        return sharedSessionManager.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).responseJSON { [self] (response) in
            if let error = response.result.error {
                self.getErrorMessage(error)
                return
            }
            guard let json = response.result.value as? [String: Any] else { return }
            if let errorMessage = json["errorMessage"] as? String {
                debugPrint("Server Error Message: \(errorMessage)")
            }
            self.prettyPrintJson(json)
            self.newPrettyPrintJson(url: url,json: json)
        }
    }
    
    private func prettyPrintJson(_ json: [String: Any]) {
        do {
            let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            let text = String(data: data, encoding: .utf8) ?? ""
            debugPrint("JSONObject: \(text)")
        } catch let e {
            debugPrint(e)
        }
    }
    ///
    
    private func newPrettyPrintJson(url: URL, json: [String: Any]) {
        do {
            let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            let text = String(data: data, encoding: .utf8) ?? ""
        } catch let e {
            debugPrint(e)
        }
    }
    
    private func getErrorMessage(_ error:Error) {
        let message = error.localizedDescription
        var enMessage = message
        if message.contains("Could not connect to the server") {
            enMessage = "Network connection failed!"
        }else if message.contains("The request timed out") {
            enMessage = "The request timed out!"
        }else if message.contains("The network connection was lost") {
            enMessage = "Network loss!"
        }else if message.contains("400") {
            enMessage = "Bad Request！400"
        }else if message.contains("401") {
            enMessage = "Unauthorized！401"
        }else if message.contains("402") {
            enMessage = "Payment Required！402"
        }else if message.contains("403") {
            enMessage = "Forbidden！403"
        }else if message.contains("404") {
            enMessage = "Forbidden！404"
        }else if message.contains("405") {
            enMessage = "Method NotAllowed！405"
        }else if message.contains("406") {
            enMessage = "Not Acceptable！406"
        }else if message.contains("407") {
            enMessage = "Proxy AuthenticationRequired！407"
        }else if message.contains("408") {
            enMessage = "Request Time-out！408"
        }else if message.contains("409") {
            enMessage = "Conflict！409"
        }else if message.contains("410") {
            enMessage = "Gone！410"
        }else if message.contains("411") {
            enMessage = "Length Required！411"
        }else if message.contains("412") {
            enMessage = "PreconditionFailed！412"
        }else if message.contains("413") {
            enMessage = "PreconditionFailed！413"
        }else if message.contains("500") {
            enMessage = "Server internal error！500"
        }else if message.contains("502") {
            enMessage = "Network connection failure！502"
        }else if message.contains("505") {
            enMessage = "HTTP Version notsupported！505"
        }else if message.contains("offline") {
            enMessage = "offline！"
        }else if message.contains("A server with the specified hostname could not be found") {
            enMessage = "A server hostname could not be found！"
        }else if message.contains("The data couldn’t be read because it isn’t in the correct format") {
            enMessage = "Server internal error！"
        }
        
        debugPrint("EN Alamofire Error:-->", enMessage)
    }
}

extension DataRequest {
    
    func responseStatus(completion: @escaping ((ok: Bool, message: String?, data: Any?)) -> Void) -> Void {
        responseJSON { (resp: DataResponse<Any>) in
            if let error = resp.result.error {
                completion((false, error.localizedDescription, nil))
                return
            }
            
            guard let json = resp.result.value as? [String: Any] else {
                completion((false, nil, nil))
                return
            }
            
            if let status = json["resultStatus"] as? Bool, status == true {
                completion((true, nil, json["resultData"]))
            } else {
                completion((false, json["errorMessage"] as? String, nil))
            }
        }
    }
}
