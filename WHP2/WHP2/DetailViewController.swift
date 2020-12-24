//
//  DetailViewController.swift
//  WHP2
//
//  Created by Mohammad Ashraful Islam Sadi on 8/1/20.
//  Copyright © 2020 Wheels-Corporation. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    var webView: WKWebView!
    var detailItem: Petition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let detailItem = detailItem else {return}
        let html = """
       <html>
       <head>
       <meta name="viewport" content="width=device-width, initial-scale=1">
       <style> body { font-size: 150%; } </style>
       </head>
       <body>
       \(detailItem.body)
       </body>
       </html>
       """
        
        webView.loadHTMLString(html, baseURL: nil)
        
    }
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }

}
