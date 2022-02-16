//
//  ViewController.swift
//  WKDemo
//
//  Created by zjx on 2/16/22.
//

import UIKit
import WebKit
class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var myLabel: UILabel!
    let isAllowZoom: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let url = URL(string: "https://loginproxy.jyyun.com/login-proxy-v3/loginProxy/v3/tyzx-zhixue-h5/001?round=1&access_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8yMjIuMjQzLjE1Ni44Mzo4MVwvY3VycmVudFwvcHVibGljXC9pbmRleC5waHBcL3BhdGFwaVwvVjFcL2xvZ2luIiwiaWF0IjoxNjQ0OTk4ODk0LCJleHAiOjE2NDUwMTY4OTQsIm5iZiI6MTY0NDk5ODg5NCwianRpIjoiTWF2OVRoSzBsbjNMQXU4ViIsInN1YiI6MzExLCJwcnYiOiI3YTVkZDhiZTg1YzIwZTA3YTI5YTQzYmY2MGIxMjlhMjUwZjQ2NjUwIiwicm9sZSI6InBhdHJpYXJjaCIsInNjaG9vbF9pZCI6NzksImNhbXB1c19pZCI6MSwieWVhcl9pZCI6MSwic2VtZXN0ZXJfaWQiOjQsInRlYWNoZXJfaWQiOjUsInRlYWNoZXJfbmFtZSI6Ilx1OTY0OFx1NTIxYSIsInVuaXF1ZV9jb2RlIjoiMGI2YmphZHRocGI0ajdnNWhybDlwdnV0OTIiLCJzdHVkZW50X2lkIjo1MDMsInN0dWRlbnRfbmFtZSI6Ilx1OWE2Y1x1NmM4MVx1NWZjMyIsInBhdHJpYXJjaF9pZCI6MzA5LCJwYXRyaWFyY2hfbmFtZSI6IiIsInBhdHJpYXJjaF9zdHVkZW50X2lkIjo1MTB9.GVM1L7EaqyVvRBG3L9LGW-z7JRYQvcuJEHOZvsXm_2k&user_type=2")
    
        let request = URLRequest(url: url!)
        //加载请求
        webView.load(request)
        webView.navigationDelegate = self
        
    }

    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if isAllowZoom {
            let javascript = "var meta = document.createElement('meta');meta.setAttribute('name', 'viewport');meta.setAttribute('content', 'width=device-width, initial-scale=1.0, maximum-scale=10.0, user-scalable=yes');document.getElementsByTagName('head')[0].appendChild(meta);"
            webView.evaluateJavaScript(javascript, completionHandler: nil)
        } else {
            let javascript = "var meta = document.createElement('meta');meta.setAttribute('name', 'viewport');meta.setAttribute('content', 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no');document.getElementsByTagName('head')[0].appendChild(meta);"
            webView.evaluateJavaScript(javascript, completionHandler: nil)
        }
    }

}

