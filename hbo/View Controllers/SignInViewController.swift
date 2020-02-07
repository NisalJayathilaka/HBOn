//
//  SignInViewController.swift
//  hbo
//
//  Created by nisal jayathilaka on 1/26/20.
//  Copyright © 2020 nisal jayathilaka. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {

  
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var errorLable: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupelments()
        // Do any additional setup after loading the view.
    }
    func setupelments() {
        errorLable.alpha=0
        Utilities.styleFirstName(emailAddressTextField)
        Utilities.styleLastName(passwordTextField)
        Utilities.styleSignInbutton(signInButton)
    }
    

    @IBAction func singInTapped(_ sender: Any) {
        
        let email = emailAddressTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil{
                self.errorLable.text = error!.localizedDescription
                self.errorLable.alpha = 1
            }
            else
            {
                let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: Constans.Storyboard.homeviewController) as? HomeViewController
                
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
    
    
    
}
