//
//  DetailViewController.swift
//  RebuildShowNote
//
//  Created by JobaraMasashi on 2015/03/05.
//  Copyright (c) 2015年 ProjectJ. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, NSURLConnectionDataDelegate {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    var topUrl = "http://rebuild.fm/"
    var asyncData: NSMutableData = NSMutableData()
    var textEncodingName: String = ""


    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func sendRequest(){
        /**
        // Create default request with no caching
        NSMutableURLRequest *req = [[NSMutableURLRequest alloc] initWithURL:url
        cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
        timeoutInterval:60];
        [req setValue:@"MWFeedParser" forHTTPHeaderField:@"User-Agent"];
**/
        var rebuildTop = NSURL(string: self.topUrl)
        if((rebuildTop) != nil){
            var req = NSMutableURLRequest(URL: rebuildTop!)
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: AnyObject = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//pragma mark -
//pragma mark NSURLConnection Delegate (Async)
    
    /**
    - (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [asyncData setLength:0];
    self.asyncTextEncodingName = [response textEncodingName];
    }
    **/
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
        self.textEncodingName = response.textEncodingName!
        self.asyncData.length = 0
    }
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        self.asyncData.appendData(data)
    }

}

