//
//  ViewController.swift
//  ParseSwift2XCode7.2
//
//  Created by LeandroLee on 1/22/16.
//  Copyright © 2016 goldhandsapp4u. All rights reserved.
//

import UIKit
import Parse
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    // MARK: - override -
    override func viewDidLoad() {
        super.viewDidLoad()
        // parseLoginSDK()
        fbLoginSDK()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.logUserData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Parse SDK Teste -
    func parseLoginSDK() {
        let user = PFUser()
        user.username = "my name"
        user.password = "my pass"
        user.email = "email@example.com"
        
        // other fields can be set if you want to save more information
        user["phone"] = "650-555-0000"
        
        user.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if error == nil {
                // Hooray! Let them use the app now.
            } else {
                // Examine the error object and inform the user.
            }
        }
    }
    

    // MARK: - Facebook SDK Teste 1 -
    func fbLoginSDK() {
        let loginButton = FBSDKLoginButton()
        loginButton.center = self.view.center
        loginButton.readPermissions = ["email"]
        self.view.addSubview(loginButton)
        loginButton.delegate = self
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("logged in")
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("logged out")
    }
    
    func logUserData() {
        let graphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler { (connection: FBSDKGraphRequestConnection!, result: AnyObject!, error: NSError!) -> Void in
            
            if error != nil {
                print(error)
            } else {
                print(result)
            }
        }
    }
    @IBAction func fbLoginSDK2Btn(sender: UIButton) {
        fbLoginSDK2()
    }
    
    // MARK: - Facebook SDK Teste 2 -
    func fbLoginSDK2() {
        print(fbLoginSDK2)
        let permissions = ["public_profile"]
        PFFacebookUtils.logInInBackgroundWithReadPermissions(permissions) { (user: PFUser?, error: NSError?) -> Void in
            if let error = error {
                print(error)
            } else {
                if let user = user {
                    print(user)
                }
            }
            
        }
        
    }

}

