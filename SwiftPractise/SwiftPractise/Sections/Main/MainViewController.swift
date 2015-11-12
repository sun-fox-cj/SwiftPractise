//
//  MainViewController.swift
//  SwiftPractise
//
//  Created by cjfire on 15/11/12.
//  Copyright © 2015年 Cjfire. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let network = NetWorkTool(baseUrlStr: "http://dohko.api.new.chouti.com/")
        network.requestGet(requestUrl: "attente/flow.json?access_token=c40fe2f61bcfd611177be71ec305196bAC6FECEC6D2B58B07DB2CC7F164A434F&count=25&since_time=1446608825159000", parameters: nil)
        
        
        
        // Do any additional setup after loading the view.
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
