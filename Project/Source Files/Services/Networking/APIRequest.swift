//
//  APIRequest.swift
//  NetguruCollegeApp
//

protocol APIRequest {
    var path: String { get }
    var method: APIMethod { get }
    var parameters: [String: String]? { get }
    var headers: [String: String]? { get }
}

extension APIRequest {
    var parameters: [String: String]? { return nil }
    var headers: [String: String]? { return nil }
}

//struct ReciepiesRequest: APIRequest {
//    var path: String {
//        return"kdkd"
//    }
//
//    var method: APIMethod
//
//
//}
