//
//  LoadingViewController.swift
//  NewsOTG
//
//  Created by Avinash Jain on 1/2/16.
//  Copyright © 2016 Avinash Jain. All rights reserved.
//

import UIKit
import Parse
import Bolts


class LoadingViewController: UIViewController {

    var activityIndicator : UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)


        // Do any additional setup after loading the view.
        
        activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.White
        activityIndicator.color = UIColor.whiteColor()
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: Selector("nextpage"), userInfo: nil, repeats: false)
        print("THis is working")
    }
    
    func nextpage(){
        
        print("THis is working")
        
        var currentUser = PFUser.currentUser()
        if currentUser != nil {
            // Do stuff with the user
            performSegueWithIdentifier("userthere", sender: self)
        } else {
            // Show the signup or login screen
            performSegueWithIdentifier("nouser", sender: self)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
