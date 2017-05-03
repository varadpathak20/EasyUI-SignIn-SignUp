//
//  ViewController.swift
//  SignUpSignInUI
//
//  Created by Varad on 20/04/17.
//  Copyright © 2017 MobileFirst. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Outlets and Declarations
    @IBOutlet weak var mainContainerView: UIView!
    @IBOutlet weak var mainViewVerticalCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var backgroundImageBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var viewLogIn: UIView!
    @IBOutlet weak var viewSignUp: UIView!

    
    @IBOutlet weak var logInViewTapRecogniser: UIView!
    @IBOutlet weak var signUpViewTapRecogniser: UIView!
    
    
    @IBOutlet weak var lblLogIn: UILabel!
    @IBOutlet weak var lblLogInCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var lblLogInBottomMarginConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var lblSignUp: UILabel!
    @IBOutlet weak var lblSignUpCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var lblSignUpBottomMarginConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var imgLogoCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var imgLogoTopMarginConstraint: NSLayoutConstraint!
    @IBOutlet weak var imgLogoHeightConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var txtLogInEmail: UITextField!
    @IBOutlet weak var txtLoginPassword: UITextField!
    
    
    @IBOutlet weak var txtSignUpEmail: UITextField!
    @IBOutlet weak var txtSignUpPassword: UITextField!
    @IBOutlet weak var txtSignUpRePassword: UITextField!
    
    
    @IBOutlet weak var lblLogInEmail: UILabel!
    @IBOutlet weak var lblLogInEmailLeft: NSLayoutConstraint!
    @IBOutlet weak var logInLblEmailCenter: NSLayoutConstraint!
    
    
    @IBOutlet weak var signUpEmailView: UIView!
    @IBOutlet weak var signUpEmailViewHeigntConstraint: NSLayoutConstraint!
    @IBOutlet weak var signUpEmailViewCenterConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var signUpPasswordView: UIView!
    @IBOutlet weak var signUpPasswordViewHeigntConstraint: NSLayoutConstraint!
    @IBOutlet weak var signUpPasswordViewCenterConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var signUpRePasswordView: UIView!
    @IBOutlet weak var signUpRePasswordViewHeigntConstraint: NSLayoutConstraint!
    @IBOutlet weak var signUpRePasswordViewCenterConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var logInEmailView: UIView!
    @IBOutlet weak var logInemailViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var logInemailViewCenterConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var lblLogInPassword: UILabel!
    @IBOutlet weak var lblLogInPasswordLeft: NSLayoutConstraint!
    @IBOutlet weak var logInLblPasswordCenter: NSLayoutConstraint!
    
    
    @IBOutlet weak var logInPasswordView: UIView!
    @IBOutlet weak var logInpasswordViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var logInpasswordViewCenterConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var lblSignUpEmail: UILabel!
    @IBOutlet weak var lblSignUpEmailLeft: NSLayoutConstraint!
    @IBOutlet weak var lblSignUpEmailCenter: NSLayoutConstraint!
    
    
    @IBOutlet weak var lblSignUpPassword: UILabel!
    @IBOutlet weak var lblSignUpPasswordLeft: NSLayoutConstraint!
    @IBOutlet weak var lblSignUpPasswordCenter: NSLayoutConstraint!
    
    
    @IBOutlet weak var lblSignUpRePassword: UILabel!
    @IBOutlet weak var lblSignUpRePasswordLeft: NSLayoutConstraint!
    @IBOutlet weak var lblSignUpRePasswordCenter: NSLayoutConstraint!
    
    
    @IBOutlet weak var textFieldsTopMarginConstraint: NSLayoutConstraint!
    @IBOutlet weak var textFieldsTopMarginConstraintSignUp: NSLayoutConstraint!
    
    
    @IBOutlet weak var viewSocial: UIView!
    @IBOutlet weak var viewSocialCenterConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var imgBackGround: UIImageView!
    
    var isLogInView: Bool = false
    var activeTextField : UITextField = UITextField()
    
    let  playerController = AVPlayerViewController()
    var player:AVPlayer!
    
    var isBackgroundVideo = false
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set Video / Image for Background
        isBackgroundVideo = false
        setBackGroundGraphics()
        
        // Set the default flag to True (Important for Animation in the LogIn View)
        isLogInView = true
        
        // Set the Main Container View's position
        mainViewVerticalCenterConstraint.constant = -(CGFloat)(defaultMainContainerViewCenterConstraint)
        
        // Default LogIn Button Positioning & Settings
        lblSignUp.alpha = 1.0
        lblLogIn.alpha = CGFloat(defaultLogInSignUpAlphaSetting)
    
        lblLogInCenterConstraint.constant = 0
        lblLogInBottomMarginConstraint.constant = CGFloat(defaultLogInSignUpBottomMarginConstraint)
        
        // Default SignUp Button Positioning & Settings
        lblSignUp.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        lblSignUp.transform = self.lblSignUp.transform.scaledBy(x: 0.6, y: 0.6)
        lblSignUp.isUserInteractionEnabled = false
        
        lblSignUpCenterConstraint.constant = CGFloat(defaultLogInSignUpCenterConstraint)
        lblSignUpBottomMarginConstraint.constant = view.frame.size.height / 2

        
        // For Logo / Social View
        view.bringSubview(toFront: imgLogo)
        view.bringSubview(toFront: viewSocial)
        
        // For the Top Logo
        imgLogoCenterConstraint.constant = CGFloat(defaultImageLogoCenterConstraint)
        
        // For the Social Buttons container
        viewSocialCenterConstraint.constant = CGFloat(defaultViewSocialCenterConstraint)
        
        // Bind TextField Delegates
        txtLogInEmail.delegate = self
        txtLoginPassword.delegate = self
        txtSignUpEmail.delegate = self
        txtSignUpPassword.delegate = self
        txtSignUpRePassword.delegate = self
        
        // Set Corner Radius'
        logInEmailView.setCornerRadius4Views(sender: logInEmailView, cornerRadius: 4.0)
        logInPasswordView.setCornerRadius4Views(sender: logInPasswordView, cornerRadius: 4.0)
        signUpEmailView.setCornerRadius4Views(sender: signUpEmailView, cornerRadius: 4.0)
        signUpPasswordView.setCornerRadius4Views(sender: signUpPasswordView, cornerRadius: 4.0)
        signUpRePasswordView.setCornerRadius4Views(sender: signUpRePasswordView, cornerRadius: 4.0)
        
        // Add keyboard notification
        NotificationCenter.default.addObserver(self, selector: #selector(keyboarFrameChange(notification:)), name: .UIKeyboardWillChangeFrame, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: - Other Methods and IBActions
    @IBAction func didTapLogInView(_ sender: Any) {
        
        activeTextField.resignFirstResponder()
        
        isLogInView = true
        lblLogIn.isUserInteractionEnabled = true
        lblSignUp.isUserInteractionEnabled = false
        
        if isLogInView == true {
            UIView.animate(withDuration: 0.25, animations: {
                
                self.mainViewVerticalCenterConstraint.constant = -(CGFloat)(defaultMainContainerViewCenterConstraint)
                
                // For Sign Up Label
                self.lblSignUp.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
                self.lblSignUp.transform = self.lblSignUp.transform.scaledBy(x: 0.6, y: 0.6)
                self.lblSignUpCenterConstraint.constant = CGFloat(defaultLogInSignUpCenterConstraint)
                self.lblSignUpBottomMarginConstraint.constant = self.view.frame.size.height / 2
                
                // For Log In Label
                self.lblLogIn.transform = CGAffineTransform.identity
                self.lblLogInCenterConstraint.constant = 0
                self.lblLogInBottomMarginConstraint.constant = CGFloat(defaultLogInSignUpBottomMarginConstraint)
                
                self.lblSignUp.alpha = 1.0
                
                if self.txtLogInEmail.text?.isEmpty == false && self.txtLoginPassword.text?.isEmpty == false {
                    self.lblLogIn.alpha = 1.0
                }
                else {
                    self.lblLogIn.alpha = CGFloat(defaultLogInSignUpAlphaSetting)
                }
                
                // For Logo Image
                self.imgLogoCenterConstraint.constant = CGFloat(defaultImageLogoCenterConstraint)
                
                // For Social View
                self.viewSocialCenterConstraint.constant = CGFloat(defaultViewSocialCenterConstraint)
                
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @IBAction func didTapSignUpView(_ sender: Any) {
        
        activeTextField.resignFirstResponder()
        
        isLogInView = false
        lblLogIn.isUserInteractionEnabled = false
        lblSignUp.isUserInteractionEnabled = true
        
        if isLogInView == false {
            UIView.animate(withDuration: 0.25, animations: {
                
                self.mainViewVerticalCenterConstraint.constant = CGFloat(defaultMainContainerViewCenterConstraint)
                
                // For Sign Up Label
                self.lblSignUp.transform = CGAffineTransform.identity
                self.lblSignUpCenterConstraint.constant = 0
                self.lblSignUpBottomMarginConstraint.constant = CGFloat(defaultLogInSignUpBottomMarginConstraint)
                
                // For Log In Label
                self.lblLogIn.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
                self.lblLogIn.transform = self.lblLogIn.transform.scaledBy(x: 0.6, y: 0.6)
                self.lblLogInCenterConstraint.constant = -(CGFloat)(defaultLogInSignUpCenterConstraint)
                self.lblLogInBottomMarginConstraint.constant = self.view.frame.size.height / 2
                
                self.lblLogIn.alpha = 1.0
                
                if self.txtSignUpEmail.text?.isEmpty == false && self.txtSignUpPassword.text?.isEmpty == false && self.txtSignUpRePassword.text?.isEmpty == false {
                    
                    self.lblSignUp.alpha = 1.0
                }
                else {
                    self.lblSignUp.alpha = CGFloat(defaultLogInSignUpAlphaSetting)
                }
                
                // For Logo Image
                self.imgLogoCenterConstraint.constant = -(CGFloat)(defaultImageLogoCenterConstraint)
                
                // For Social View
                self.viewSocialCenterConstraint.constant = -(CGFloat)(defaultViewSocialCenterConstraint)
                
                self.view.layoutIfNeeded()
                
            })
        }
    }
    
    func playVideoInBackGround() {
        
        let bundle: Bundle = Bundle.main
        let moviePath: String = bundle.path(forResource: "Pacific Ocean", ofType: "mov")!
        let movieURL: NSURL = NSURL.fileURL(withPath: moviePath) as NSURL
        player = AVPlayer(url: movieURL as URL)
        
        player.isMuted = true
        playerController.player = player
        
        playerController.view.frame = self.mainContainerView.frame
        
        playerController.showsPlaybackControls = false
        playerController.videoGravity = AVLayerVideoGravityResizeAspectFill
        
        self.mainContainerView.insertSubview(playerController.view, at: 0)
        player.play()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerController.player!.currentItem)
    }
    
    func playerItemDidReachEnd(notification: NSNotification) {
        self.player.seek(to: kCMTimeZero)
        self.player.play()
    }
    
    func setBackGroundGraphics() {
        
        if isBackgroundVideo == true {
            imgBackGround.isHidden = true
            playVideoInBackGround()
        }
        else {
            imgBackGround.isHidden = false
        }
    }
    
    // For Showing and Removing Errors
    func showEmailError() {
        if isLogInView == true {
            showError(senderLabel: lblLogInEmail, senderView: logInEmailView, senderView2: UIView(), senderLabelText: "Invalid Email")
        }
        else {
            showError(senderLabel: lblSignUpEmail, senderView: signUpEmailView, senderView2: UIView(), senderLabelText: "Invalid Email")
        }
    }
    
    func removeEmailError() {
        if isLogInView == true {
            removeError(senderLabel: lblLogInEmail, senderView: logInEmailView, senderView2: UIView(), senderLabelText: "Email")
        }
        else {
            removeError(senderLabel: lblSignUpEmail, senderView: signUpEmailView, senderView2: UIView(), senderLabelText: "Email")
        }
    }
    
    func showPasswordMatchError() {
        if isLogInView == true {
        }
        else {
            showError(senderLabel: lblSignUpPassword, senderView: signUpPasswordView, senderView2: UIView(), senderLabelText: "Passwords - No Match")
            
            showError(senderLabel: lblSignUpRePassword, senderView: signUpRePasswordView, senderView2: UIView(), senderLabelText: "Passwords - No Match")
        }
    }
    
    func removePasswordMatchError() {
        if isLogInView == true {
        }
        else {
            removeError(senderLabel: lblSignUpPassword, senderView: signUpPasswordView, senderView2: UIView(), senderLabelText: "Password")
            
            removeError(senderLabel: lblSignUpRePassword, senderView: signUpRePasswordView, senderView2: UIView(), senderLabelText: "Re-enter password")
        }
    }
    
    // MARK: - TextField Delegate Methods
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        textField.keyboardAppearance = .dark
        textField.spellCheckingType = .no
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        
        activeTextField = textField
        
        if textField == txtLogInEmail {
            textField.keyboardType = .emailAddress
            
            if textField.text?.isEmpty == false {
            }
            else {
                animateTextFieldViews2UnderLine(senderView: logInEmailView, heightConstraint: logInemailViewHeightConstraint, centerConstraint: logInemailViewCenterConstraint, senderLabel: lblLogInEmail, labelLeftConstraint: lblLogInEmailLeft, labelCenterConstraint: logInLblEmailCenter)
            }
        }
            
        else if textField == txtLoginPassword {
            textField.isSecureTextEntry = true
            textField.keyboardType = .default
            
            if textField.text?.isEmpty == false {
            }
            else {
                animateTextFieldViews2UnderLine(senderView: logInPasswordView, heightConstraint: logInpasswordViewHeightConstraint, centerConstraint: logInpasswordViewCenterConstraint, senderLabel: lblLogInPassword, labelLeftConstraint: lblLogInPasswordLeft, labelCenterConstraint: logInLblPasswordCenter)
            }
        }
            
        else if textField == txtSignUpEmail {
            textField.keyboardType = .emailAddress
            
            if textField.text?.isEmpty == false {
            }
            else {
                animateTextFieldViews2UnderLine(senderView: signUpEmailView, heightConstraint: signUpEmailViewHeigntConstraint, centerConstraint: signUpEmailViewCenterConstraint, senderLabel: lblSignUpEmail, labelLeftConstraint: lblSignUpEmailLeft, labelCenterConstraint: lblSignUpEmailCenter)
            }
        }
            
        else if textField == txtSignUpPassword {
            textField.isSecureTextEntry = true
            textField.keyboardType = .default
            
            if textField.text?.isEmpty == false {
            }
            else {
                animateTextFieldViews2UnderLine(senderView: signUpPasswordView, heightConstraint: signUpPasswordViewHeigntConstraint, centerConstraint: signUpPasswordViewCenterConstraint, senderLabel: lblSignUpPassword, labelLeftConstraint: lblSignUpPasswordLeft, labelCenterConstraint: lblSignUpPasswordCenter)
            }
        }
            
        else if textField == txtSignUpRePassword {
            textField.isSecureTextEntry = true
            textField.keyboardType = .default
            
            if textField.text?.isEmpty == false {
            }
            else {
                animateTextFieldViews2UnderLine(senderView: signUpRePasswordView, heightConstraint: signUpRePasswordViewHeigntConstraint, centerConstraint: signUpRePasswordViewCenterConstraint, senderLabel: lblSignUpRePassword, labelLeftConstraint: lblSignUpRePasswordLeft, labelCenterConstraint: lblSignUpRePasswordCenter)
            }
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == txtLogInEmail {
            if textField.text?.isEmpty == true {
                
                animateTextFieldViewsBack2Normal(senderView: logInEmailView, heightConstraint: logInemailViewHeightConstraint, centerConstraint: logInemailViewCenterConstraint, senderLabel: lblLogInEmail, labelLeftConstraint: lblLogInEmailLeft, labelCenterConstraint: logInLblEmailCenter)
                
                removeEmailError()
            }
            else {
                //checkForTheButton()
                removeEmailError()
            }
        }
            
        else if textField == txtLoginPassword {
            
            if textField.text?.isEmpty == true {
                
                animateTextFieldViewsBack2Normal(senderView: logInPasswordView, heightConstraint: logInpasswordViewHeightConstraint, centerConstraint: logInpasswordViewCenterConstraint, senderLabel: lblLogInPassword, labelLeftConstraint: lblLogInPasswordLeft, labelCenterConstraint: logInLblPasswordCenter)
            }
            else {
                //checkForTheButton()
            }
        }
        
        else if textField == txtSignUpEmail {
            
            if textField.text?.isEmpty == true {
                
                animateTextFieldViewsBack2Normal(senderView: signUpEmailView, heightConstraint: signUpEmailViewHeigntConstraint, centerConstraint: signUpEmailViewCenterConstraint, senderLabel: lblSignUpEmail, labelLeftConstraint: lblSignUpEmailLeft, labelCenterConstraint: lblSignUpEmailCenter)
                
                removeEmailError()
            }
            else {
                //checkForTheButton()
                removeEmailError()
            }
        }
        
        else if textField == txtSignUpPassword {
            
            if textField.text?.isEmpty == true {
                
                animateTextFieldViewsBack2Normal(senderView: signUpPasswordView, heightConstraint: signUpPasswordViewHeigntConstraint, centerConstraint: signUpPasswordViewCenterConstraint, senderLabel: lblSignUpPassword, labelLeftConstraint: lblSignUpPasswordLeft, labelCenterConstraint: lblSignUpPasswordCenter)
                
                removePasswordMatchError()
            }
            else {
                //checkForTheButton()
                removePasswordMatchError()
            }
        }
        
        else if textField == txtSignUpRePassword {
            
            if textField.text?.isEmpty == true {
                
                animateTextFieldViewsBack2Normal(senderView: signUpRePasswordView, heightConstraint: signUpRePasswordViewHeigntConstraint, centerConstraint: signUpRePasswordViewCenterConstraint, senderLabel: lblSignUpRePassword, labelLeftConstraint: lblSignUpRePasswordLeft, labelCenterConstraint: lblSignUpRePasswordCenter)
                
                removePasswordMatchError()
            }
            else {
                //checkForTheButton()
                removePasswordMatchError()
            }
        }
    }
    
    // MARK: - Animations
    
    private func animateTextFieldViews2UnderLine(senderView: UIView, heightConstraint: NSLayoutConstraint, centerConstraint: NSLayoutConstraint, senderLabel: UILabel, labelLeftConstraint:  NSLayoutConstraint, labelCenterConstraint: NSLayoutConstraint) {
        
        senderLabel.setNeedsLayout()
        self.view.setNeedsLayout()
        
        UIView.animate(withDuration: 0.2, animations: {
            // For Views
            senderView.alpha = 1.0
            heightConstraint.constant = 1.0
            centerConstraint.constant = 20.0
            
            // For Labels
            labelLeftConstraint.constant = -38.0
            labelCenterConstraint.constant = -25.0
            senderLabel.transform = senderLabel.transform.scaledBy(x: 0.6, y: 0.6)
            
            self.view.layoutIfNeeded()
        })
    }
    
    private func animateTextFieldViewsBack2Normal(senderView: UIView, heightConstraint: NSLayoutConstraint, centerConstraint: NSLayoutConstraint, senderLabel: UILabel, labelLeftConstraint:  NSLayoutConstraint, labelCenterConstraint: NSLayoutConstraint) {
        
        senderLabel.setNeedsLayout()
        self.view.setNeedsLayout()
        
        UIView.animate(withDuration: 0.2, animations: {
            
            // For Views
            senderView.alpha = 0.3
            heightConstraint.constant = 50.0
            centerConstraint.constant = 0.0
            
            // For Labels
            senderLabel.alpha = CGFloat(defaultLogInSignUpAlphaSetting)
            senderLabel.transform = CGAffineTransform.identity
            labelLeftConstraint.constant = 8.0
            labelCenterConstraint.constant = 0.0
    
            self.view.layoutIfNeeded()
        })
    }
    
    private func checkForTheButton() {
        if isLogInView == true {
            if txtLogInEmail.text?.isEmpty == false && txtLoginPassword.text?.isEmpty == false {
                lblLogIn.alpha = 1.0
            }
            else {
                lblLogIn.alpha = CGFloat(defaultLogInSignUpAlphaSetting)
            }
        }
        else {
            if txtSignUpEmail.text?.isEmpty == false && txtSignUpPassword.text?.isEmpty == false && txtSignUpRePassword.text?.isEmpty == false {
                lblSignUp.alpha = 1.0
            }
            else {
                lblSignUp.alpha = CGFloat(defaultLogInSignUpAlphaSetting)
            }
        }
    }
    
    // MARK: - Gesture Recogniser Actions
    
    @IBAction func didTapTheLogInView(_ sender: Any) {

        activeTextField.resignFirstResponder()
        
        if txtLogInEmail.text?.isEmpty == false && txtLoginPassword.text?.isEmpty == false {
            lblLogIn.alpha = 1.0
        }
        else {
            lblLogIn.alpha = CGFloat(defaultLogInSignUpAlphaSetting)
        }
    }
    
    @IBAction func didTapTheSignUpView(_ sender: Any) {
        
        activeTextField.resignFirstResponder()
        
        if txtSignUpEmail.text?.isEmpty == false && txtSignUpEmail.text?.isEmpty == false && txtSignUpEmail.text?.isEmpty == false {
            lblSignUp.alpha = 1.0
        }
        else {
            lblSignUp.alpha = CGFloat(defaultLogInSignUpAlphaSetting)
        }
    }
    
    // MARK: - KEYBOARD
    
    func keyboarFrameChange(notification:NSNotification){
        
        let userInfo = notification.userInfo as! [String:AnyObject]
        
        // Get top of keyboard in view
        let topOfKeyboard = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue .origin.y
        
        // Check keyboard is showing
        let keyboardShow = topOfKeyboard != self.view.frame.size.height
        
        UIView.animate(withDuration: 0.35, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.3, options: .curveEaseOut, animations: {
            
            self.backgroundImageBottomConstraint.constant = (self.view.frame.size.height - 35) - topOfKeyboard
            
            // For TextFields
            if self.isLogInView == true {
                self.textFieldsTopMarginConstraint.constant = keyboardShow ? CGFloat(animatedTextFieldsTopMarginConstraints):CGFloat(defaultTextFieldsTopMarginConstraints)
            }
            else {
                self.textFieldsTopMarginConstraintSignUp.constant = keyboardShow ? CGFloat(animatedTextFieldsTopMarginConstraints):CGFloat(defaultTextFieldsTopMarginConstraints)
            }
            
            // For Logo Image
            self.imgLogoTopMarginConstraint.constant = keyboardShow ? 20:70
            self.imgLogoHeightConstraint.constant = keyboardShow ? CGFloat(animationImageLogoHeightConstraint):CGFloat(defaultImageLogoHeightConstraint)
            
            self.view.layoutIfNeeded()
            
        }, completion: nil)
        
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.3, options: UIViewAnimationOptions.curveEaseIn, animations: {
          
            // For LogIn Button
            if self.isLogInView == true {
                self.lblLogIn.alpha = keyboardShow ? 1.0:CGFloat(defaultLogInSignUpAlphaSetting)
                self.lblLogInBottomMarginConstraint.constant = keyboardShow ? CGFloat(animationLogInSignUpBottomMarginConstraint):CGFloat(defaultLogInSignUpBottomMarginConstraint)
            }
                
                // For SignUp Button
            else {
                self.lblSignUp.alpha = keyboardShow ? 1.0:CGFloat(defaultLogInSignUpAlphaSetting)
                self.lblSignUpBottomMarginConstraint.constant = keyboardShow ? CGFloat(animationLogInSignUpBottomMarginConstraint):CGFloat(defaultLogInSignUpBottomMarginConstraint)
            }
            keyboardShow ? self.makeButtonBorders():self.removeButtonBorders()
            self.view.layoutIfNeeded()
        })
    }
    
    func makeButtonBorders() {
        
        if isLogInView == true {
                self.lblLogIn.makeBordersOfLabels(sender: self.lblLogIn, broderWidth: 1.0, borderColor: UIColor.white, cornerRadius: 4.0)
                self.lblLogIn.alpha = 1.0
        }
        else {
                self.lblSignUp.makeBordersOfLabels(sender: self.lblSignUp, broderWidth: 1.0, borderColor: UIColor.white, cornerRadius: 4.0)
                self.lblSignUp.alpha = 1.0
        }
    }
    func removeButtonBorders() {
        if isLogInView == true {
            if (self.txtLogInEmail.text?.isEmpty)! || (self.txtLoginPassword.text?.isEmpty)! {
                self.lblLogIn.removeBordersOfLabels(sender: self.lblLogIn)
                self.lblLogIn.alpha = CGFloat(defaultLogInSignUpAlphaSetting)
            }
            else {}
        }
        else {
            if (self.txtSignUpEmail.text?.isEmpty)! || (self.txtSignUpPassword.text?.isEmpty)! || (self.txtSignUpRePassword.text?.isEmpty)! {
                self.lblSignUp.removeBordersOfLabels(sender: self.lblSignUp)
                self.lblSignUp.alpha = CGFloat(defaultLogInSignUpAlphaSetting)
            }
            else {}
        }
    }
    
    // MARK: - DO YOUR STUFF HERE...
    
    @IBAction func didTapLoginLabel(_ sender: Any) {
        
        let checkValidFills = checkLogInTextFields(email: txtLogInEmail, password: txtLoginPassword)
        
        if checkValidFills == true {
            
            let emailCheck = String.validateEmail(email: txtLogInEmail.text!)
            if emailCheck == true {
                
                // DO YOUR STUFF HERE!!
            }
            else {
                // Email not valid
                showEmailError()
            }
        }
        else {
            // One or More Fields are empty
        }
    }
    
    @IBAction func didTapSignUpLabel(_ sender: Any) {
        
        let checkValidFills = checkSignUpTextFields(email: txtSignUpEmail, password: txtSignUpPassword, rePassword: txtSignUpRePassword)
        
        if checkValidFills == true {
         
            let emailCheck = String.validateEmail(email: txtSignUpEmail.text!)
            if emailCheck == true {
                
                removeEmailError()
                
                if txtSignUpPassword.text?.characters.count == txtSignUpRePassword.text?.characters.count {
                    if txtSignUpPassword.text! == txtSignUpRePassword.text! {
                        
                        removePasswordMatchError()
                    }
                    else {
                        // Passwords do not match
                        showPasswordMatchError()
                    }
                }
                else {
                    // Password counts do not match
                    showPasswordMatchError()
                }
            }
            else {
                // Email Not Valid
                showEmailError()
            }
        }
        else {
            // One or More Fields are empty
        }
    }
    
    @IBAction func didTapForgotPassword(_ sender: Any) {
        
        // Your code here...
    }
}
