//
//  AuthVC.swift
//  Aston CryptoWallet
//
//  Created by Semyon Semyonov on 3/19/23.
//

import UIKit
import SnapKit

final class AuthVC: UIViewController {
    
    //MARK: - UI Setting
    
    private let logoView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        imageView.image = UIImage(named: Constants.appLogo)
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let usernameTextField: UITextField = {
        let textField = UITextField()
        let leftGap = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.size.height))
        let placeholderAttributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        textField.attributedPlaceholder = NSAttributedString(string: Constants.usernamePlaceholder, attributes: placeholderAttributes)
        textField.textColor = .white
        textField.backgroundColor = UIColor(named: Constants.textFieldColor)
        textField.leftView = leftGap
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 20
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        let leftGap = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.size.height))
        let placeholderAttributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        textField.attributedPlaceholder = NSAttributedString(string: Constants.passwordPlaceholder, attributes: placeholderAttributes)
        textField.textColor = .white
        textField.backgroundColor = UIColor(named: Constants.textFieldColor)
        textField.leftView = leftGap
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 20
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.loginButtonName, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 35/2
        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .red
        label.text = Constants.errorStatus
        label.isHidden = true
        return label
    }()
    
    private func setupView() {
        view.backgroundColor = .black
        
        view.addSubview(logoView)
        logoView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(100)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        
        view.addSubview(usernameTextField)
        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(logoView.snp.bottom).offset(40)
            make.height.equalTo(40)
            make.left.equalTo(30)
            make.right.equalTo(-30)
        }
        
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(20)
            make.height.equalTo(40)
            make.left.equalTo(30)
            make.right.equalTo(-30)
        }
        
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
            make.height.equalTo(35)
            make.width.equalTo(80)
        }
        
        view.addSubview(statusLabel)
        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(35)
        }
    }
    
    //MARK: - UI Logic
    
    var viewModel: (AuthProtocolOut & AuthProtocolIn)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
        setupView()
        listenViewModel()
    }
    
    @objc private func loginButtonPressed() {
        viewModel?.getData(usernameTextField.text, passwordTextField.text)
    }
    
    private func listenViewModel() {
        guard var viewModel = viewModel else { return }
        
        viewModel.updateView = { [weak self] check in
            guard let self = self else { return }
            
            switch check {
            case false:
                self.statusLabel.isHidden = false
            default:
                let navController = UINavigationController(rootViewController: VCBuilder.buildCoinTableVC())
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                   let sceneDelegate = windowScene.delegate as? SceneDelegate,
                   let window = sceneDelegate.window {
                    window.rootViewController = navController
                }
            }
        }
    }
    
}

//MARK: - UITextFieldDelegate

extension AuthVC: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        statusLabel.isHidden = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        viewModel?.getData(usernameTextField.text, passwordTextField.text)
        return true
    }
    
}
