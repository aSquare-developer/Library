//
//  RegistrationViewController.swift
//  Library
//
//  Created by Artur Anissimov on 21.11.2021.
//

import UIKit

class RegistrationViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - Public properties
    var delegate: RegistrationViewControllerDelegate!
    
    // MARK: - IB Actions
    @IBAction func registrateButtonTapped() {
        checkTextFieldsValue(usernameTextField, passwordTextField)
        
        if registrateNewUser(usernameTextField, passwordTextField) {
            showAlert(title: "Поздравляю!", password: "Вы создали нового пользователя!")
        } else {
            showAlert(title: "Ошибка!", password: "В системе уже есть такой пользователь!")
        }
    }
}

// MARK: - RegistrationViewController Extension
extension RegistrationViewController {
    private func registrateNewUser(_ login: UITextField, _ password: UITextField) -> Bool {
        guard let login = login.text, !login.isEmpty else { return false }
        guard let password = password.text, !password.isEmpty else { return false }
        
        let user = User(login: login, password: password)
        
        if delegate.checkIsTheUserPresentInList(user) {
            return false
        } else {
            delegate.updateUsersList(user)
        }
            
        return true
    }
}

// MARK: - UITextFieldDelegate
extension RegistrationViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            registrateButtonTapped()
        }
        return true
    }
}

