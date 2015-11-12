//
//  NetWorkTool.swift
//  SwiftPractise
//
//  Created by cjfire on 15/11/12.
//  Copyright © 2015年 Cjfire. All rights reserved.
//

import UIKit
import Alamofire

protocol NetWorkDelegate {
    
    mutating func success(task task: NSURLSessionTask, ressult: [String : Any])
    
    mutating func failed(task task: NSURLSessionTask, error: NSError)
}

class NetWorkTool {
    
    var baseUrlStr: String?
    var delegate: NetWorkDelegate?
    
    init(baseUrlStr: String?) {
        
        self.baseUrlStr = baseUrlStr
    }
    
    func requestGet(requestUrl requestUrl:String, parameters:[String: String]?) -> NSURLSessionTask {
        
        var task: NSURLSessionTask;
        
        var fullUrlStr: String
        
        if let baseUrl = baseUrlStr {
            fullUrlStr = baseUrl + requestUrl
        } else {
            fullUrlStr = requestUrl
        }
        
        task = Alamofire.request(.GET, fullUrlStr, parameters:parameters).validate().responseJSON(completionHandler: { (response) -> Void in
            
            print(response)
            
            switch response.result {
                
            case .Success:
                print(response)
                self.delegate?.success(task: NSURLSessionTask(), ressult: ["res" : "res"])
            case .Failure:
                print(response)
                self.delegate?.failed(task: NSURLSessionTask(), error: response.result.error!)
            }
        }).task
        
        return task
    }
}
