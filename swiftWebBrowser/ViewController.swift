//
//  ViewController.swift
//  swiftWebBrowser
//
//  Created by Vinicius Fugulin Barbosa on 2015-05-22.
//  Copyright (c) 2015 Vinicius Fugulin Barbosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate, UITextFieldDelegate {
    
    @IBOutlet var webView:UIWebView!
    @IBOutlet var textField:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let myURL = NSURL(string:"http://globo.com")
        let request = NSURLRequest(URL: myURL!)
        webView.loadRequest(request)
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func textDone(){
        let typedURL = textField.text
        if(typedURL.isEmpty){
            return
        }
        let newURL = NSURL(string: typedURL)
        let request = NSURLRequest(URL: newURL!)
        webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

