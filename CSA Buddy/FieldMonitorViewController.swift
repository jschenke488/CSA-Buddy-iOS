//
//  FirstViewController.swift
//  CSA Buddy
//
//  Created by Ken Schenke on 2/26/19.
//  Copyright © 2019 Ken Schenke. All rights reserved.
//

import UIKit
import WebKit
import FontAwesome_swift

class FieldMonitorViewController: UIViewController {
    
    var welcomeUrl = URL(fileURLWithPath: "")
    var errorUrl = URL(fileURLWithPath: "")

    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var urlTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urlTextField.delegate = self
        
        webView.navigationDelegate = self
        
        refreshButton.titleLabel?.font = UIFont.fontAwesome(ofSize: 22, style: .solid)
        refreshButton.setTitle(String.fontAwesomeIcon(name: .redo), for: .normal)
        
        welcomeUrl = Bundle.main.url(forResource: "welcomepage", withExtension: "html", subdirectory: "html")!
        errorUrl = Bundle.main.url(forResource: "errorpage", withExtension: "html", subdirectory: "html")!
        
        if appSettings.fieldMonitor.isEmpty {
            loadWelcomePage()
        } else {
            urlTextField.text = appSettings.fieldMonitor
            loadUrl()
        }
    }
    
    public func loadErrorPage() {
        loadLocalPage(errorUrl)
    }
    
    public func loadLocalPage(_ url : URL) {
        webView.loadFileURL(url, allowingReadAccessTo: url)
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    public func loadWelcomePage() {
        loadLocalPage(welcomeUrl)
    }
    
    public func loadUrl() {
        let urlText = urlTextField.text!
        if !urlText.isEmpty {
            if var components = URLComponents(string: urlText) {
                if let scheme = components.scheme {
                    if scheme.isEmpty {
                        components.scheme = "http"
                    }
                } else {
                    components.scheme = "http"
                }
                webView.load(URLRequest(url: components.url!))
            }
        }
    }

    @IBAction func refreshButtonPressed(_ sender: Any) {
        if urlTextField.isFirstResponder {
            urlTextField.resignFirstResponder()
        }
        
        webView.reload()
    }
}

extension FieldMonitorViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        loadUrl()
        urlTextField.resignFirstResponder()
        return true
    }
    
}

extension FieldMonitorViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if let url = webView.url {
            if url == welcomeUrl {
                urlTextField.text = "Welcome Page"
            } else if url == errorUrl {
                urlTextField.text = "Error Page"
            } else {
                let urlString = url.absoluteString
                appSettings.save(newFieldMonitor: urlString)
                urlTextField.text = urlString
            }
        }
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        loadLocalPage(errorUrl)
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        loadLocalPage(errorUrl)
    }
    
}
