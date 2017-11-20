//
//  WebViewController.swift
//  jukeboxStream
//
//  Created by Chris Swinson on 11/2/17.
//  Copyright © 2017 Chris Swinson. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet var webView: WKWebView!
    
    @IBAction func backButton(_ sender: UIButton) {
    }
    
    var url: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = url, let urlForRequest = URL(string: url) {
            let request = URLRequest(url: urlForRequest)
            webView.load(request)
        }
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        rightSwipe.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(rightSwipe)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func swipeAction(swipe:UISwipeGestureRecognizer)
    {
        switch swipe.direction.rawValue {
        case 1:
            performSegue(withIdentifier: "iTunes2", sender: self)
        default:
            break
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

