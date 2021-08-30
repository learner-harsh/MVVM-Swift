//
//  LoginVC.swift
//  MVVM_using_protocol
//
//  Created by Harsh Jaiswal on 30/08/21.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!

    private var viewModel: LoginViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LoginViewModel(delegate: self)
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        let request = LoginRequest(email: txtFieldEmail.text!, password: txtFieldPassword.text!)
        viewModel.userLogin(request)
    }
}

extension LoginVC: AlertProtocol {}
