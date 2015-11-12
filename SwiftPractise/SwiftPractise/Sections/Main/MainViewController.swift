//
//  MainViewController.swift
//  SwiftPractise
//
//  Created by cjfire on 15/11/12.
//  Copyright © 2015年 Cjfire. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, NetWorkDelegate {

    var tasks: [NSURLSessionTask] = [NSURLSessionTask]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let network = NetWorkTool(baseUrlStr: nil)
        network.delegate = self
        
        let task = network.requestGet(requestUrl: "https://developer.apple.com/services-account/download?path=/Developer_Tools/Xcode_7.2_beta_3/Xcode_7.2_beta_3.dmg", parameters: nil)
        
        tasks.append(task)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        for t in tasks {
            
            t.cancel()
        }
    }
    
    
    func success(task task: NSURLSessionTask, ressult: [String : Any]) {
        print("123")
        // 此处应该得到task 并从tasks移除
    }
    
    func failed(task task: NSURLSessionTask, error: NSError) {
        print("456")
        // 此处应该得到task 并从tasks移除
    }
    
    
    deinit {
    
        print("deinit")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
