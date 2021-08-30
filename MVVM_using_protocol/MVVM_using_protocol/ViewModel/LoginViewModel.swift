//
//  LoginViewModel.swift
//  MVVM_using_protocol
//
//  Created by Harsh Jaiswal on 30/08/21.
//

import Foundation

protocol LoginViewModelDelegate {
    func didReceiveLoginResponse(loginResponse: LoginResponse?)
}

struct LoginViewModel {
    private var _delegate: LoginViewModelDelegate?
    
    init(delegate: LoginViewModelDelegate?) {
        _delegate = delegate
    }
    
    func userLogin(_ loginRequest: LoginRequest) {
        let resource = LoginResource()
        let validation = LoginValidation()
        let validationResult = validation.validate(request: loginRequest)
        if validationResult.success {
            resource.loginUser(loginRequest: loginRequest) {(response) in
                DispatchQueue.main.async {
                    self._delegate?.didReceiveLoginResponse(loginResponse: response)
                }
            }
        } else {
            self._delegate?.didReceiveLoginResponse(loginResponse: LoginResponse(errorMessage: validationResult.errorMessage, data: nil))
        }
    }
}
