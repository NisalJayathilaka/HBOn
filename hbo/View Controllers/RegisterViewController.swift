//
//  RegisterViewController.swift
//  hbo
//
//  Created by nisal jayathilaka on 1/26/20.
//  Copyright © 2020 nisal jayathilaka. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var firstNameTextFiled: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailAddressTextFiled: UITextField!
    @IBOutlet weak var passwordTextFeild: UITextField!
    @IBOutlet weak var confirmPasswordtextField: UITextField!
    @IBOutlet weak var zipCodeTetxField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var errorLable: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    
    
    func setUpElements(){
        errorLable.alpha=0
        Utilities.reFirtName(firstNameTextFiled)
        Utilities.reLastName(lastNameTextField)
        Utilities.reEmail(emailAddressTextFiled)
        Utilities.rePassword(passwordTextFeild)
        Utilities.reConfirmPassword(confirmPasswordtextField)
        Utilities.reButton(registerButton)
            }
    
    
    func validateFields() -> String? {
        
        if firstNameTextFiled.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailAddressTextFiled.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextFeild.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            zipCodeTetxField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "please fill in all fields."
        }
        
        let cleanedPassword = passwordTextFeild.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(cleanedPassword) == false
        {
            return " please make sure your password is at least 8 hcarackers, contains a special character and a number"
        }
        
        return nil
    }
   
    
    @IBAction func registerTapped(_ sender: Any) {
      
        
        let error = validateFields()
        if error != nil
        {
            showError(error!)
        }
        else
        {
            
            let firstName = firstNameTextFiled.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailAddressTextFiled.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextFeild.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let zipcode = zipCodeTetxField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                if err != nil
                {
                    self.showError("error cretaing user")
                }
                else{
                   let db = Firestore.firestore()
                    db.collection("user").addDocument(data: ["fistname" : firstName, "lastname" : lastName, "email" : email, " zipcode" : zipcode,"uid" : result!.user.uid]) { (error) in
                        
                        if error != nil{
                        self.showError("error saving user data")
                        }
                    }
                    self.trnasitionToHome()
                }
                
            }
        }
        }
    
    
    
   
    func showError(_ message:String) {
        errorLable.text = message
        errorLable.alpha = 1
    }
    
    func trnasitionToHome() {
        
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: Constans.Storyboard.homeviewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
}
