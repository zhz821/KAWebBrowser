//
//  KAWebBrowser.swift
//  KAWebBrowser
// 
//  Created by zhihuazhang on 2016/06/08.
//  Copyright © 2016年 Kapps Inc. All rights reserved.
//

import UIKit
import WebKit

public class KAWebBrowser: UIViewController {

    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: CGRectZero)
        return webView
    }()
    
    private lazy var progressBar: UIProgressView = {
        let progressBar = UIProgressView()
        progressBar.alpha = 0
        return progressBar
    }()
    
    public class func navigationControllerWithBrowser() -> UINavigationController {
        let browser = KAWebBrowser()
        
        let closeBtn = UIBarButtonItem(barButtonSystemItem: .Stop, target: browser, action: #selector(closeButtonPressed))
        browser.navigationItem.leftBarButtonItem = closeBtn

        return UINavigationController(rootViewController: browser)
    }
    
    public func loadURLString(urlString: String) {
        guard let url = NSURL(string: urlString) else {
            return
        }
        
        loadURL(url)
    }
    
    public func loadURL(url: NSURL) {
        let request = NSURLRequest(URL: url)
        loadRequest(request)
    }
    
    public func loadRequest(request: NSURLRequest) {
        webView.loadRequest(request)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[webView]|", options: .AlignAllLeft, metrics: nil, views: ["webView": webView]))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[webView]|", options: .AlignAllTop, metrics: nil, views: ["webView": webView]))
        
        guard let _ = navigationController else {
            print("need UINavigationController to show progressbar")
            return
        }
        
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .New, context: nil)

        view.addSubview(progressBar)
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraint(NSLayoutConstraint(item: progressBar, attribute: .Top, relatedBy: .Equal, toItem: topLayoutGuide, attribute: .Bottom, multiplier: 1, constant: 0))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[progressBar]|", options: .AlignAllLeft, metrics: nil, views: ["progressBar": progressBar]))
    }

    private func updateProgressBar(progress: Float) {
        if progress == 1.0 {
            self.progressBar.setProgress(progress, animated: true)
            UIView.animateWithDuration(1.5, animations: {
                self.progressBar.alpha = 0.0
                }, completion: { finished in
                    if finished {
                        self.progressBar.setProgress(0.0, animated: false)
                    }
            })
        } else {
            if self.progressBar.alpha < 1.0 {
                self.progressBar.alpha = 1.0
            }
            self.progressBar.setProgress(progress, animated: (progress > progressBar.progress) && true)
        }
    }
    
    func closeButtonPressed() {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    deinit{
        webView.removeObserver(self, forKeyPath: "estimatedProgress")
    }

    // MARK: - KVO
    
    override public func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath == "estimatedProgress" {
            updateProgressBar(Float(webView.estimatedProgress))
        }
    }

}

extension UINavigationController {
    
    public func webBrowser() -> KAWebBrowser? {
        return viewControllers.first as? KAWebBrowser
    }
}
