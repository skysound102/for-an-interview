//
//  ViewController.swift
//  LikePhoto
//
//  Created by Артем on 16.06.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
var person = ""

    
    func find(value searchValue: String, searchValue2: String , in array: [Base.DatesNew])  {
        
        
        for ( _, value) in array.enumerated() {

            
            if value.name == searchValue && value.password == searchValue2  {
                person = searchValue
                UserDefaults.standard.set(person, forKey: "person")
                self.navigationController?.pushViewController(GeneralView(), animated: true)

                return
            }
   

        }

            let alert = UIAlertController(title: "Внимание!", message: "Неверный логин или пароль", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
    
  
    }
 
    lazy var nameField : UITextField = {
        let field = UITextField()
        field.textColor = .blue
        field.placeholder = "Enter to name"
        field.backgroundColor = .white
        field.layer.cornerRadius = 10
        return field
    }()
    
    lazy var passwordField : UITextField = {
        let field = UITextField()
        field.textColor = .blue
        field.placeholder = "Enter to password"
        field.backgroundColor = .white
        field.layer.cornerRadius = 10
        return field
    }()
    
    lazy var buttonLogIn : UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.magenta, for: .normal)
        button.setTitle("Войти", for: .normal)
        button.layer.cornerRadius = 10
       
        button.addAction(UIAction(handler: { [weak self] _ in
            
            self!.find(value: self!.nameField.text!, searchValue2: self!.passwordField.text!, in: Base.shared.baseArray)
 
        }), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonRegistration : UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("Регистрация", for: .normal)
        button.layer.cornerRadius = 10
        button.addAction(UIAction(handler: { [weak self] _ in self?.navigationController?.pushViewController(RegistrationView(), animated: true)}), for: .touchUpInside)
        return button
    }()


    override func viewDidLoad() {
        print("massiv\(Base.shared.baseArray)")
//        UserDefaults.standard.value(forKey: "logins")
        if let data = UserDefaults.standard.object(forKey: "value") as? Data,
           let category = try? JSONDecoder().decode(Result.self, from: data) {
            
         print("")
        }
        

       
        super.viewDidLoad()
        let backImage = UIImage(named: "backgroundRegistration")  ?? UIImage()
        view.backgroundColor = UIColor(patternImage: backImage)
        view.addSubview(nameField)
        view.addSubview(passwordField)
        view.addSubview(buttonRegistration)
        view.addSubview(buttonLogIn)
        inicialize()
        
    }
    
    
    private func inicialize() {
        nameField.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(50)
            make.right.equalToSuperview().inset(50)
            make.top.equalToSuperview().inset(250)
            make.height.equalTo(30)
            make.width.equalTo(200)
        }
        passwordField.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(50)
            make.right.equalToSuperview().inset(50)
            make.top.equalToSuperview().inset(310)
            make.height.equalTo(30)
            make.width.equalTo(200)
        }
        
        buttonLogIn.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(50)
            make.right.equalToSuperview().inset(50)
            make.top.equalToSuperview().inset(400)
            make.height.equalTo(30)
            make.width.equalTo(200)
        }
        
        buttonRegistration.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(50)
            make.right.equalToSuperview().inset(50)
            make.top.equalToSuperview().inset(700)
            make.height.equalTo(30)
            make.width.equalTo(200)
        }
   

    }
    
}

