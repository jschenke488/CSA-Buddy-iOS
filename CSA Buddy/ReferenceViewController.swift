//
//  ReferenceViewController.swift
//  CSA Buddy
//
//  Created by Ken Schenke on 2/27/19.
//  Copyright © 2019 Ken Schenke. All rights reserved.
//

import UIKit
@preconcurrency import WebKit

class ReferenceViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = Bundle.main.url(forResource: "reference", withExtension: "html", subdirectory: "html")!
        webView.navigationDelegate = self
        webView.loadFileURL(url, allowingReadAccessTo: url)
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let urlscheme = navigationAction.request.url?.scheme {
            if let urlString = navigationAction.request.url?.absoluteString {
                if urlscheme != "file" {
                    decisionHandler(.cancel)
                    if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url)
                    }
                    return
                } else {
                    decisionHandler(.allow)
                    return
                }
            } else {
                decisionHandler(.allow)
                return
            }
        }

        decisionHandler(.cancel)
    }
}
