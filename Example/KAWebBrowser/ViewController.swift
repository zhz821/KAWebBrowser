//
//  ViewController.swift
//  KAWebBrowser
//
//  Created by zhihuazhang on 06/14/2016.
//  Copyright (c) 2016 Kapps Inc. All rights reserved.
//

import UIKit
import KAWebBrowser

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pushBtnTapped(sender: AnyObject) {
        let browser = KAWebBrowser()
        show(browser, sender: nil)
        
        browser.loadURLString("https://github.com")
    }
    
    @IBAction func modalBtnTapped(sender: AnyObject) {
        let navigationController = KAWebBrowser.navigationControllerWithBrowser()
        show(navigationController, sender: nil)
        
        navigationController.webBrowser()?.loadURLString("https://github.com")
    }
}

