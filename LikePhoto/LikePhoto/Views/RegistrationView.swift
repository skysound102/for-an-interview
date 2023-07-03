//
//  RegistrationView.swift
//  LikePhoto
//
//  Created by Артем on 16.06.2023.
//

import Foundation
import UIKit
import SnapKit

class RegistrationView : UIViewController , UITextFieldDelegate {

    var dates1 = Dates()
    var dates = [(name: String , pass: String , age: Int)]()
    
    lazy var nameFieldRegistration: UITextField = {
        let field = UITextField()
        field.textColor = .blue
        field.placeholder = "Enter to name"
        field.backgroundColor = .white
        field.layer.cornerRadius = 10
        return field
    }()
    
    lazy var  passwordFieldRegistration : UITextField = {
        let field = UITextField()
        field.textColor = .blue
        field.placeholder = "Enter to password"
        field.backgroundColor = .white
        field.layer.cornerRadius = 10
        return field
    }()
    
    lazy var ageFieldRegistration: UITextField = {
        let field = UITextField()
        field.textColor = .blue
        field.keyboardType = .numberPad
        field.placeholder = "Enter to age"
        field.backgroundColor = .white
        field.layer.cornerRadius = 10
        
        return field
    }()
    lazy var buttonRegistration2 : UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("Зарегистрироваться", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(registrationClick), for: .touchUpInside)
        return button
    }()
    lazy var alert : UIAlertController = {
        let alert = UIAlertController(title: "Внимание!", message: "Лицам, менее 18 лет, регистрация запрещена.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
       
        
        return alert
    }()
    
    override func viewDidLoad() {
 
        
        if let data = UserDefaults.standard.object(forKey: "value") as? Data,
           let category = try? JSONDecoder().decode(Result.self, from: data) {
            
      print("")
        }

        super.viewDidLoad()
        
        let backImage = UIImage(named: "backgroundRegistration2")  ?? UIImage()
        view.backgroundColor = UIColor(patternImage: backImage)
        view.addSubview(nameFieldRegistration)
        view.addSubview(passwordFieldRegistration)
        view.addSubview(ageFieldRegistration)
        view.addSubview(buttonRegistration2)
        inicialize()
        ageFieldRegistration.delegate = self

   
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //For mobile numer validation
        if textField == ageFieldRegistration {
            let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")//Here change this characters based on your requirement
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }
    
    
    private func inicialize() {
        
        self.navigationItem.leftBarButtonItem?.isEnabled = false
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        nameFieldRegistration.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(50)
            make.right.equalToSuperview().inset(50)
            make.top.equalToSuperview().inset(250)
            make.height.equalTo(30)
            make.width.equalTo(200)
        }
        passwordFieldRegistration.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(50)
            make.right.equalToSuperview().inset(50)
            make.top.equalToSuperview().inset(310)
            make.height.equalTo(30)
            make.width.equalTo(200)
        }
        
        ageFieldRegistration.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(50)
            make.right.equalToSuperview().inset(50)
            make.top.equalToSuperview().inset(400)
            make.height.equalTo(30)
            make.width.equalTo(200)
        }
        
        buttonRegistration2.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(50)
            make.right.equalToSuperview().inset(50)
            make.top.equalToSuperview().inset(700)
            make.height.equalTo(30)
            make.width.equalTo(200)
        }
        
        
        
    }
    
 
    @objc private func registrationClick() {
        guard nameFieldRegistration.text != "" else {
            
            let alert = UIAlertController(title: "Внимание!", message: "Введите имя", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        guard passwordFieldRegistration.text != "" else {
            let alert = UIAlertController(title: "Внимание!", message: "Введите пароль", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
            
        }
        guard ageFieldRegistration.text != "" else {
            let alert = UIAlertController(title: "Внимание!", message: "Введите Возраст", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
            
        }
        let age = Int(ageFieldRegistration.text!)
        guard (age ?? 0) > 18 else {
            self.present(alert, animated: true, completion: nil)
            return
        }
        let alert = UIAlertController(title: "Поздравляем!", message: "Регистрация завершена!", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { UIAlertAction in
          
            
            
            self.navigationController?.pushViewController(ViewController(), animated: true)
            
            
        }))
        self.present(alert, animated: true, completion: nil)
        
        
        Base.shared.saveBase(name: nameFieldRegistration.text!, password: passwordFieldRegistration.text!, age: age!)
        
        
        dates.append((name: nameFieldRegistration.text!, pass: passwordFieldRegistration.text!, age: age!))
        print(dates)
        dates1.dates.append((name: nameFieldRegistration.text!, pass: passwordFieldRegistration.text!, age: age!))
        print(dates1.dates[0].name)
        let category = Result(result2: [Dates1(name: nameFieldRegistration.text!, password: passwordFieldRegistration.text!, age: age!)])
    
        if let encoded = try? JSONEncoder().encode(category) {
            UserDefaults.standard.set(encoded, forKey: "value")
        }
      
    }
    func isCommaInput(text: String) -> Double? {
            var convertDouble: [String] = []
            for i in text {
                if i == "," {
                    convertDouble += ["."]
                } else {
                    convertDouble += [String(i)]
                }
            }
            var convertedNumber = ""
            for i in convertDouble {
                convertedNumber.append(i)
            }
            let convertedDouble = Double(convertedNumber)
            return convertedDouble
        }

}


    
 

