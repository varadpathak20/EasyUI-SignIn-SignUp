//
//  Constants and Extensions.swift
//  SignUpSignInUI
//
//  Created by Varad on 20/04/17.
//  Copyright © 2017 MobileFirst. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Constants
let defaultMainContainerViewCenterConstraint = 137.5
let defaultLogInSignUpBottomMarginConstraint = 150.0
let animationLogInSignUpBottomMarginConstraint = 250
let defaultLogInSignUpCenterConstraint = 138.0
let defaultImageLogoCenterConstraint = 20
let defaultImageLogoTopMarginConstraint = 70
let animationImageLogoTopMarginConstraint = 20
let defaultImageLogoHeightConstraint = 100
let animationImageLogoHeightConstraint = 80
let defaultLogInSignUpAlphaSetting = 0.7
let defaultViewSocialCenterConstraint = 25.0
let defaultTextFieldsTopMarginConstraints = 220
let animatedTextFieldsTopMarginConstraints = 120


// MARK: - Extensions
extension UIView {
    
    func makeBordersOfLabels(sender: UILabel, broderWidth: CGFloat, borderColor: UIColor, cornerRadius : CGFloat) {
        
        sender.layer.borderWidth = broderWidth
        sender.layer.borderColor = borderColor.cgColor
        sender.layer.cornerRadius = cornerRadius
    }
    
    func removeBordersOfLabels(sender: UILabel) {
        sender.layer.borderWidth = 0.0
    }
    
    func setCornerRadius4Views(sender: UIView, cornerRadius: CGFloat) {
        sender.layer.cornerRadius = cornerRadius
    }
    
    func findAndResignFirstResponder() -> Bool {
        if isFirstResponder {
            resignFirstResponder()
            return true
        }
        for subView: UIView in subviews {
            if subView.findAndResignFirstResponder() {
                return true
            }
        }
        return false
    }
}

extension String {
    
    // VALIDATE EMAIL
    static func validateEmail(email: String) -> Bool {
        
        let EMAIL_REGEX = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", EMAIL_REGEX)
        return emailTest.evaluate(with: email)
    }
}

extension UIViewController {
    
    func checkLogInTextFields(email: UITextField, password: UITextField) -> Bool {
        if email.text?.isEmpty == false && password.text?.isEmpty == false {
            return true
        }
        return false
    }
    
    func checkSignUpTextFields(email: UITextField, password: UITextField, rePassword: UITextField) -> Bool {
        if email.text?.isEmpty == false && password.text?.isEmpty == false && rePassword.text?.isEmpty == false {
            return true
        }
        return false
    }
    
    func showError(senderLabel: UILabel, senderView: UIView, senderView2: UIView, senderLabelText: String) {
        senderLabel.text = senderLabelText
        senderView.backgroundColor = UIColor(colorLiteralRed: 175/255, green: 40/255, blue: 30/255, alpha: 1.0)
        senderView2.backgroundColor = UIColor(colorLiteralRed: 175/255, green: 40/255, blue: 30/255, alpha: 1.0)
    }
    
    func removeError(senderLabel: UILabel, senderView: UIView, senderView2: UIView, senderLabelText: String) {
        senderLabel.text = senderLabelText
        senderView.backgroundColor = UIColor.white
        senderView2.backgroundColor = UIColor.white
    }
}
// MARK:
