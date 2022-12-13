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
    
    var viewModel = LoginViewViewModel(authenticator: RemoteJDAuthenticator(networking: HTTPNetworking()))

    override func viewDidLoad() {
        super.viewDidLoad()

        setupEmailTF()
        setupPasswordTF()
        setupLoginButton()
    }
    
    @IBAction func closeButtonTap(_ sender: AnyObject) {
        self.dismiss(animated: true)
    }
    
    @IBAction func loginButtonTap(_ sender: AnyObject) {
        viewModel.authenticate { error in
            DispatchQueue.main.async {
                if let error = error {
                    UIAlertController.alert(message: error.localizedDescription)
                } else {
                    UIAlertController.alert(message: "Success")
                }
            }
        }
    }
    
    private func setupEmailTF() {
        emailTF.setTextFieldLabel(with: "Email")
        emailTF.setTextField(placeholder: "Email",
                             keyboardType: .emailAddress)
    }
    
    private func setupPasswordTF() {
        passwordTF.setTextFieldLabel(with: "Password")
        passwordTF.setTextField(placeholder: "Password",
                                returnKeyType: .done,
                                secureEntry: true)
    }
    
    private func setupLoginButton() {
        loginButton.initUI()
        loginButton.isButtonEnabled = true
    }
}
