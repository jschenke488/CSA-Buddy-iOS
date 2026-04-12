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

        _ = UserSettings.shared.accessibilityModeEnabled
        
        webView.customUserAgent = "CSABuddy"
        webView.navigationDelegate = self
        loadReferencePage()
        NotificationCenter.default.addObserver(self, selector: #selector(accessibilityModeChanged), name: AppConstants.Notifications.accessibilityModeChanged, object: nil)
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

    private func loadReferencePage() {
        let fileName = UserSettings.shared.accessibilityModeEnabled ? "reference-accessible" : "reference"
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "html", subdirectory: "html") else { return }
        webView.loadFileURL(url, allowingReadAccessTo: url)
        let request = URLRequest(url: url)
        webView.load(request)
    }

    @objc private func accessibilityModeChanged() {
        loadReferencePage()
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: AppConstants.Notifications.accessibilityModeChanged, object: nil)
    }
}
