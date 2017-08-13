//
//  DetailViewController.swift
//  jambase
//
//  Created by Alex Beattie on 2/20/16.
//  Copyright © 2016 Alex Beattie. All rights reserved.
//

import UIKit

class JamDetailViewController: UIViewController, UIWebViewDelegate {

    


    
    @IBOutlet weak var webView: UIWebView!
    var webSite: String? = ""
    
    @IBOutlet weak var refresher: UIActivityIndicatorView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let webSite = webSite {
            webView.frame = self.view.frame
            webView.scalesPageToFit = true
            let webURL = NSURL(string: webSite)
            let urlRequest = NSURLRequest(URL: webURL!)
            webView.loadRequest(urlRequest)
        }
//        counterLabel.text = "The counter was tapped \(numberToDisplay) times."
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func webViewDidFinishLoad(webView : UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        refresher.stopAnimating()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
