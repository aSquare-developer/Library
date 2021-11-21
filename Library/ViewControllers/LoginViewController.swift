//
//  ViewController.swift
//  Library
//
//  Created by Artur Anissimov on 20.11.2021.
//

import UIKit

protocol RegistrationViewControllerDelegate {
    func updateUsersList(_ user: User)
    func checkIsTheUserPresentInList(_ user: User) -> Bool
}

class LoginViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - Public privates
    private var users = UserDataManager().users
    
    // MARK: - Ovveride Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let registrationVC = segue.destination as? RegistrationViewController else { return }
        registrationVC.delegate = self
    }
    
    // MARK: - IB Actions
    @IBAction func loginButtonTapped() {
        
        checkTextFieldsValue(usernameTextField, passwordTextField)
        
        if checkAuthorization(usernameTextField, passwordTextField) {
            performSegue(withIdentifier: "mainPageSegue", sender: nil)
        } else {
            showAlert(title: "Ошибка!", password: "Введены неверные данные!")
        }
    }
    
    @IBAction func promptButtonTapped(_ sender: UIBarButtonItem) {
        guard let login = users.first?.login else { return }
        guard let password = users.first?.password else { return }
        
        showAlert(
            title: "Подсказка!",
            password: "Имя пользователя: \(login)\nПароль: \(password)"
        )
        
    }
    
}

// MARK: - LoginViewController Extension
extension LoginViewController {
    private func checkAuthorization(_ login: UITextField, _ password: UITextField) -> Bool {
        guard let login = login.text else { return false }
        guard let password = password.text else { return false }
        
        let user = User(login: login, password: password)
        
        if users.contains(user) {
            return true
        }
        return false
    }
}

// MARK: - RegistrationViewControllerDelegate
extension LoginViewController: RegistrationViewControllerDelegate {
    func updateUsersList(_ user: User) {
        users.append(user)
    }
    
    func checkIsTheUserPresentInList(_ user: User) -> Bool {
        users.contains(user)
    }
    
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            loginButtonTapped()
        }
        return true
    }
}

// MARK: - UIViewController Extension
extension UIViewController {
    func showAlert(title: String, password: String) {
        let alertController = UIAlertController(title: title, message: password, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    func checkTextFieldsValue(_ textfields: UITextField...) {
        textfields.forEach { textfield in
            guard let textfield = textfield.text, !textfield.isEmpty else { return }
            if textfield.isEmpty {
                showAlert(title: "Ошибка!", password: "Текстовое поле НЕ может быть пустым!")
            }
        }
    }
}
