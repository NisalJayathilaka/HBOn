//
//  Utilities.swift
//  hbo
//
//  Created by nisal jayathilaka on 1/26/20.
//  Copyright © 2020 nisal jayathilaka. All rights reserved.
//

import UIKit

class Utilities {

    
    
    static func styleFirstName(_ textfield:UITextField)
    {
        textfield.layer.cornerRadius = 15.0
        textfield.clipsToBounds = true
        textfield.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    static func styleLastName(_ textfield:UITextField)
    {
        textfield.layer.cornerRadius = 15.0
        textfield.clipsToBounds = true
        textfield.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    static func styleSignInbutton(_ button:UIButton)
    {
        button.layer.cornerRadius = 9.0
        button.clipsToBounds = true
        button.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    
    //////////////////////// register /////////////////////
    
    
    static func reFirtName(_ textfield:UITextField)
    {
        textfield.layer.cornerRadius = 15.0
        textfield.clipsToBounds = true
        textfield.layer.maskedCorners = [.layerMinXMinYCorner]
    }
    
    static func reLastName(_ textfield:UITextField)
    {
        textfield.layer.cornerRadius = 15.0
        textfield.clipsToBounds = true
        textfield.layer.maskedCorners = [.layerMaxXMinYCorner]
    }
    
    static func reEmail(_ textfield:UITextField)
    {
        textfield.layer.cornerRadius = 15.0
        textfield.clipsToBounds = true
        textfield.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    static func rePassword(_ textfield:UITextField)
    {
        textfield.layer.cornerRadius = 15.0
        textfield.clipsToBounds = true
        textfield.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    static func reConfirmPassword(_ textfield:UITextField)
    {
        textfield.layer.cornerRadius = 15.0
        textfield.clipsToBounds = true
        textfield.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    static func reButton(_ button:UIButton)
    {
        button.layer.cornerRadius = 9.0
        button.clipsToBounds = true
        button.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    
    static func isPasswordValid(_ password : String) -> Bool {

        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)


    }

    
    }
    

    





