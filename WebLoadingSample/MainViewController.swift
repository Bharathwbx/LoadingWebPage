//
//  MainViewController.swift
//  WebLoadingSample
//
//  Created by Bharatraj Rai on 4/14/20.
//  Copyright © 2020 Bharatraj Rai. All rights reserved.
//

import Cocoa
import WebKit

class MainViewController: NSViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    var defaultSelectingOptionKey = "0"
    var htmlContent = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        getDefaultPopupKeyValue()
        webView?.navigationDelegate = self
        loadURLData()
    }
    
    func getDefaultPopupKeyValue() {
        if let configFilePath = Bundle.main.path(forResource: "Config", ofType: "plist") {
            let configDict = NSDictionary(contentsOfFile: configFilePath)
            defaultSelectingOptionKey = configDict?.value(forKey: "defaultPopupKeyValue") as? String ?? "0"
        }
    }
    
    func loadURLData() {
        guard let url = URL(string: "https://mdbootstrap.com/docs/angular/forms/select/") else { return }
        let request = URLRequest(url: url)
        webView?.load(request)
        webView?.navigationDelegate = self
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let js = "document.getElementsByClassName('browser-default custom-select')[0].value = \(defaultSelectingOptionKey)"
        webView.evaluateJavaScript(js, completionHandler: { (result, error) in
            if let error = error {
                print(error)
            } else if let result = result {
                print(result)
            }
        })
    }
}
