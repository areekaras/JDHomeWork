//
//  AccountViewController.swift
//  JetDevsHomeWork
//
//  Created by Gary.yao on 2021/10/29.
//

import UIKit
import Kingfisher

class AccountViewController: UIViewController {

	@IBOutlet weak var nonLoginView: UIView!
	@IBOutlet weak var loginView: UIView!
	@IBOutlet weak var daysLabel: UILabel!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var headImageView: UIImageView!
    
    var viewModel = AccountsViewViewModel()
    
	override func viewDidLoad() {
        super.viewDidLoad()

		self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        initView()
    }
    
    private func initView() {
        viewModel.loadUser { [weak self] user in
            guard let self = self else {
                return
            }
            
            if let user = user {
                self.show(login: false)
            } else {
                self.show(login: true)
            }
        }
    }
    
    private func show(login: Bool) {
        nonLoginView.isHidden = !login
        loginView.isHidden = login
    }
	
	@IBAction func loginButtonTap(_ sender: UIButton) {
        if let loginVC = UIStoryboard.loginScreen() {
            navigationController?.present(loginVC, animated: true)
        }
	}
	
}
