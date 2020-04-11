//
//  ViewController.swift
//  Covid-19 Training
//
//  Created by Pedro Solís García on 10/04/2020.
//  Copyright © 2020 Pedro Solís García. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    @IBOutlet var webView: WKWebView!
    @IBOutlet var bottomView: UIView!
    
    var url: String = "https://xray.covid.ifca.es/"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webView.scrollView.bounces = false
        let covidUrl = URLRequest(url: URL(string: url)!)
        webView.load(covidUrl)
    }
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
            if let frame = navigationAction.targetFrame,
                frame.isMainFrame {
                return nil
            }
            if let url = navigationAction.request.url {
                UIApplication.shared.open(url)
            }
            return nil
    }
}
