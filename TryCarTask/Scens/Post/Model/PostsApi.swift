//
//  Posts.swift
//  TryCarTask
//
//  Created by UPS Apple on 08/04/2021.
//

import Foundation
import Moya
import RxSwift

enum TryCarApi {
    case getPosts
    case getComments(id :Int)
}

extension TryCarApi : TargetType  {
    
    private var requestURL: URL {
        return (URL(string: APIConstants.BaseURL))!
    }
    
    var baseURL: URL {
        return requestURL
    }
    
    var path: String {
        switch self {
        case .getPosts:
            return APIConstants.URLpath.posts
        case .getComments(let id ):
            return "/posts/\(id)/comments"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    var task: Task {
        
        switch self {
            
        case .getPosts , .getComments:
            return .requestPlain
            
        }
        
    }
    
    var headers: [String : String]? {
        
        
        return [:]
            
        }
        
    }
    

