//
//  SendMoneyModalViewController.swift
//  TesteNeon
//
//  Created by Gustavo Kin Tanaka Uno on 01/10/19.
//  Copyright © 2019 Gustavo Kin. All rights reserved.
//

import UIKit

internal class SendMoneyModalViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var imageContainer: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var valueTextfield: UITextField!
    @IBOutlet weak var friendShortName: UILabel!
    @IBOutlet weak var friendPhoto: UIImageView!
    @IBOutlet weak var modalContainer: UIView!
    @IBOutlet weak var centerYConstraint: NSLayoutConstraint!
    @IBOutlet weak var sendButton: CornerButton!
    
    let viewModel: SendMoneyModalViewModel
    let navigation: UINavigationController?
    
    init(viewModel: SendMoneyModalViewModel, navigation: UINavigationController?) {
        self.viewModel = viewModel
        self.navigation = navigation
        super.init(nibName: "SendMoneyModalViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bind()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        viewModel.delegate = self
        valueTextfield.delegate = self
        sendButton.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    func setupView() {
        imageContainer.layer.cornerRadius = imageContainer.frame.height / 2
        imageContainer.layer.borderColor = UIColor(named: "PrimaryColor")?.cgColor
        imageContainer.layer.borderWidth = 1
        friendPhoto.layer.cornerRadius = friendPhoto.frame.height / 2
        modalContainer.layer.cornerRadius = 10
    }
    
    func bind() {
        nameLabel.text = viewModel.friend.name
        emailLabel.text = viewModel.friend.email
        friendShortName.text = viewModel.friend.shortName
        if let friendImage = UIImage(named: viewModel.friend.imageName) {
            friendShortName.isHidden = true
            friendPhoto.isHidden = false
            friendPhoto.image = friendImage
        } else {
            friendShortName.isHidden = false
            friendPhoto.isHidden = true
        }
    }
    
    @IBAction func dismissAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if centerYConstraint.constant == 0 {
                centerYConstraint.constant -= keyboardSize.height / 2
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if centerYConstraint.constant != 0 {
            centerYConstraint.constant = 0
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text as NSString? else {
            textField.text = "R$0,00"
            return true
        }
        
        let newText = text.replacingCharacters(in: range, with: string)
        
        let onlyNumbers = (newText as String).onlyNumbers()
        let valueFormatted = onlyNumbers.currencyFormatted()
        textField.text = valueFormatted
        
        if textField.text == "R$0,00" {
            sendButton.isEnabled = false
        } else {
            sendButton.isEnabled = true
        }
        
        return false
    }
    
    @IBAction func sendMoneyAction(_ sender: UIButton) {
        self.viewModel.callAPI(value: getValue())
    }
    
    func getValue() -> Double {
        if let valueInteger = Double(valueTextfield.text!.onlyNumbers()) {
            let value = valueInteger / 100.0
            return value
        }
        return 0.0
    }
}

extension SendMoneyModalViewController: SendMoneyModalViewModelDelegate {
    func onSuccess() {
        let succesViewController = SuccessSentMoneyViewController()
        self.dismiss(animated: false) {
            self.navigation?.show(succesViewController, sender: nil)
        }
    }
    
    func onError() {
        let errorViewController = ErrorViewController {
            self.viewModel.callAPI(value: self.getValue())
            self.sendButton.isEnabled = true
        }
        self.present(errorViewController, animated: true, completion: nil)
    }
    
    func onLoading() {
        self.sendButton.isEnabled = false
    }
    
    
}
