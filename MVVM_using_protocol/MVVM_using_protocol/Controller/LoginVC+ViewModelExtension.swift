//
//  LoginVC+ViewModelExtension.swift
//  MVVM_using_protocol
//
//  Created by Harsh Jaiswal on 30/08/21.
//

import Foundation
import UIKit

extension LoginVC: LoginViewModelDelegate {
    func didReceiveLoginResponse(loginResponse: LoginResponse?) {
        if (loginResponse?.errorMessage == nil && loginResponse?.data != nil) {
            // Go to New Controller
        } else {
            showAlert(alertMessage: (loginResponse?.errorMessage)!)
        }
    }
}
