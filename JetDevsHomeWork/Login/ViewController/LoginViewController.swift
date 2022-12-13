//
//  LoginViewController.swift
//  JetDevsHomeWork
//
//  Created by Shibili Areekara on 12/12/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet private(set) weak var emailTF: JDTextField!
    @IBOutlet private(set) weak var passwordTF: JDTextField!
    @IBOutlet private(set) weak var loginButton: JDButton!
    
    var loaderView: UIActivityIndicatorView!
    
    var viewModel = LoginViewViewModel(authenticator: RemoteJDAuthenticator(networking: HTTPNetworking()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupEmailTF()
        setupPasswordTF()
        setupLoginButton()
        
        setIndicatorView()
    }
    
    @IBAction func closeButtonTap(_ sender: AnyObject) {
        self.dismiss(animated: true)
    }
    
    @IBAction func loginButtonTap(_ sender: AnyObject) {
        authenticate()
    }
    
    private func authenticate() {
        startLoading()
        
        viewModel.authenticate { [weak self] error in
            DispatchQueue.main.async {
                self?.stopLoading()
                
                if let error = error {
                    UIAlertController.alert(message: error.localizedDescription)
                } else {
                    self?.dismiss(animated: true)
                }
            }
        }
    }
    
    private func setupEmailTF() {
        emailTF.setTextFieldLabel(with: "Email")
        emailTF.setTextField(placeholder: "Email",
                             keyboardType: .emailAddress)
        
        emailTF.textFieldDidChange = setEmail(with:)
        emailTF.textFieldShouldReturn = dismissKeyBoard
    }
    
    private func setupPasswordTF() {
        passwordTF.setTextFieldLabel(with: "Password")
        passwordTF.setTextField(placeholder: "Password",
                                secureEntry: true)
        
        passwordTF.textFieldDidChange = setPassword(with:)
        passwordTF.textFieldShouldReturn = dismissKeyBoard
    }
    
    private func setupLoginButton() {
        loginButton.initUI()
        hanldeLoginButton()
    }
    
    private func hanldeLoginButton() {
        loginButton.isButtonEnabled = viewModel.isValid
    }
    
    private func setEmail(with text: String) {
        viewModel.setEmail(with: text)
        hanldeLoginButton()
    }
    
    private func setPassword(with text: String) {
        viewModel.setPassword(with: text)
        hanldeLoginButton()
    }
    
    private func setIndicatorView() {
        loaderView = UIActivityIndicatorView.activityIndicator(center: self.view.center)
        self.view.addSubview(loaderView)
    }
    
    private func startLoading() {
        loaderView.startAnimating()
        view.isUserInteractionEnabled = false
    }
    
    private func stopLoading() {
        loaderView.stopAnimating()
        view.isUserInteractionEnabled = true
    }
    
    private func dismissKeyBoard() {
        view.endEditing(true)
    }
}
