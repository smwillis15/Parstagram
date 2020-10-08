//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Sydney Willis on 10/7/20.
//  Copyright © 2020 Sydney Willis. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passworldField: UITextField!
    
    
    @IBAction func SignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passworldField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password)
        { (user, error) in
            if user != nil
            {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else
            {
                print("Error: \(error?.localizedDescription)")
            }
            
        }
    }
    
    @IBAction func signUp(_ sender: Any) {
    
        var user = PFUser()
        user.username = usernameField.text
        user.password = passworldField.text
        
        user.signUpInBackground{(success, error) in
            if success
            {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else
            {
                print("Error: \(error?.localizedDescription)")
            }
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
