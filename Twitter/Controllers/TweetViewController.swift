//
//  TweetViewController.swift
//  Twitter
//
//  Created by Anthony Pena on 7/30/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {
    
    @IBOutlet weak var tweetBody: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetBody.becomeFirstResponder()
    }

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func onTweet(_ sender: Any) {
        if(!tweetBody.text.isEmpty){
            TwitterAPICaller.client?.postTweet(tweetString: tweetBody.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print("Error posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        }else{
            self.dismiss(animated: true, completion: nil)
        }
    }
}
