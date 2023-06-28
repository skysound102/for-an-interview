//
//  ViewController.swift
//  M19
//
//  Created by Артем on 02.02.2023.
//
import Foundation
//import UIKit
//import Alamofire
//var titleString = ""
//var titleInt = 0
//class ViewController: UIViewController, UITextFieldDelegate {
//
//
//
//    private lazy var imageView: UILabel = {
//        let view = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 200))
//        view.contentMode = .scaleAspectFit
//        return view
//    }()
//
//    private lazy var imageView2: UILabel = {
//        let view = UILabel(frame: CGRect(x: 20, y: 105, width: 200, height: 200))
//        view.contentMode = .scaleAspectFit
//        view.text = "Enter occupation"
//        return view
//    } ()
//    private lazy var imageView3: UILabel = {
//        let view = UILabel(frame: CGRect(x: 20, y: 300, width: 200, height: 200))
//        view.contentMode = .scaleAspectFit
//        view.text = "Enter occupation"
//        return view
//    } ()
//
//    private lazy var button: UIButton = {
//        let view = UIButton(frame: CGRect(x: 20, y: 650, width: 200, height: 50))
//        view.backgroundColor = .blue
//        view.setTitle("Enter URLSession", for: .normal)
//        view.layer.cornerRadius = 12
//        view.layer.masksToBounds = true
//        view.addTarget(self, action: #selector(onClick), for: .touchUpInside)
//
//        return view
//    }()
//    // передача URLSession
//    @objc func onClick() {
//        //создал модель
//        let model1 = Json4Swift_Base(birth: 1987, occupation: "Artist", name: "Kiyohara", lastname: "Yukinobu", country: "Russia")
//        //превращаю в JSON
//        let jsonData = try? JSONSerialization.data(withJSONObject: [model1.dictionaryRepresentation()])
//        //настраиваю запрос
//        var request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpBody = jsonData
//        // делаю запрос и обрабатываю ответ
//        URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
//            guard let data = data, error == nil else {
//                DispatchQueue.main.async {
//                    let alert = self?.displayFailure() ?? UIAlertController()
//                    self?.present(alert, animated: true, completion: nil)
//                    return
//                }
//                return
//            }
//            DispatchQueue.main.async {
//                let alert = self?.displaySucces() ?? UIAlertController()
//                self?.present(alert, animated: true, completion: nil)
//                return
//            }
//            let responseJSON = try? JSONSerialization.jsonObject(with: data , options: [])
//            if let responseJSON = responseJSON as? [String: Any] {
//                print(responseJSON)
//            }
//        }.resume()
//    }
//
//    @objc func onClickAlamofire() {
//        let item = Item(birth: titleString, occupation: titleString, name: titleString, lastname: titleString, country: titleString)
//
//        AF.request(
//            "https://jsonplaceholder.typicode.com/posts",
//            method: .post,
//            parameters: item,
//            encoder: JSONParameterEncoder.default
//        ).response { [weak self] response in
//            guard response.error == nil else {
//                let alert = self?.displayFailure() ?? UIAlertController()
//                self?.present(alert, animated: true, completion: nil)
//                return
//            }
//            let alert = self?.displaySucces() ?? UIAlertController()
//            self?.present(alert, animated: true, completion: nil)
//            print(titleString)
//            debugPrint(response)
//
//        }
//
//
//    }
//
//    private lazy var button2: UIButton = {
//        let view = UIButton(frame: CGRect(x: 20, y: 750, width: 200, height: 50))
//        view.backgroundColor = .red
//        view.setTitle("Enter Alamofire", for: .normal)
//        view.layer.cornerRadius = 12
//        view.layer.masksToBounds = true
//        view.addTarget(self, action: #selector(onClickAlamofire), for: .touchUpInside)
//        return view
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.addSubview(imageView)
//        view.addSubview(imageView2)
//        view.addSubview(imageView3)
//        view.addSubview(button)
//        view.addSubview(button2)
//
//        view.addSubview(samp)
//        view.addSubview(samp1)
//        pips(textField: samp)
//        text(sender: samp)
//        print(titleString)
//        let sampleTextField =  UITextField(frame: CGRect(x: 20, y: 130, width: 300, height: 40))
//
//        sampleTextField.placeholder = "Enter birth here"
//        sampleTextField.font = UIFont.systemFont(ofSize: 15)
//        sampleTextField.borderStyle = UITextField.BorderStyle.roundedRect
//        sampleTextField.autocorrectionType = UITextAutocorrectionType.yes
//        sampleTextField.keyboardType = UIKeyboardType.phonePad
//        sampleTextField.returnKeyType = UIReturnKeyType.done
//        sampleTextField.clearButtonMode = UITextField.ViewMode.whileEditing
//        sampleTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
//        sampleTextField.delegate = self
//
//
//
//        view.addSubview(sampleTextField)
//
//        let sampleTextField2 =  UITextField(frame: CGRect(x: 20, y: 220, width: 300, height: 40))
//        sampleTextField2.placeholder = "Enter text here"
//        sampleTextField2.font = UIFont.systemFont(ofSize: 15)
//        sampleTextField2.borderStyle = UITextField.BorderStyle.roundedRect
//        sampleTextField2.autocorrectionType = UITextAutocorrectionType.no
//        sampleTextField2.keyboardType = UIKeyboardType.default
//        sampleTextField2.returnKeyType = UIReturnKeyType.done
//        sampleTextField2.clearButtonMode = UITextField.ViewMode.whileEditing
//        sampleTextField2.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
//        sampleTextField2.delegate = self
//        self.view.addSubview(sampleTextField2)
//
//        let sampleTextField3 =  UITextField(frame: CGRect(x: 20, y: 320, width: 300, height: 40))
//        sampleTextField3.placeholder = "Enter text here"
//        sampleTextField3.font = UIFont.systemFont(ofSize: 15)
//        sampleTextField3.borderStyle = UITextField.BorderStyle.roundedRect
//        sampleTextField3.autocorrectionType = UITextAutocorrectionType.no
//        sampleTextField3.keyboardType = UIKeyboardType.default
//        sampleTextField3.returnKeyType = UIReturnKeyType.done
//        sampleTextField3.clearButtonMode = UITextField.ViewMode.whileEditing
//        sampleTextField3.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
//        sampleTextField3.delegate = self
//
//        self.view.addSubview(sampleTextField3)
//
//    }
//
//    private lazy var samp: UITextField = {
//        let sampleTextField =  UITextField(frame: CGRect(x: 20, y: 400, width: 300, height: 40))
//
//        sampleTextField.placeholder = "Enter birth here"
//        sampleTextField.font = UIFont.systemFont(ofSize: 15)
//        sampleTextField.borderStyle = UITextField.BorderStyle.roundedRect
//        sampleTextField.autocorrectionType = UITextAutocorrectionType.yes
//        sampleTextField.keyboardType = UIKeyboardType.phonePad
//        sampleTextField.returnKeyType = UIReturnKeyType.done
//        sampleTextField.clearButtonMode = UITextField.ViewMode.whileEditing
//        sampleTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
//        sampleTextField.delegate = self
//        return sampleTextField
//
//    }()
//    private lazy var samp1: UITextField = {
//        let sampleTextField =  UITextField(frame: CGRect(x: 20, y: 550, width: 300, height: 40))
//
//        sampleTextField.placeholder = "Enter birth here"
//        sampleTextField.font = UIFont.systemFont(ofSize: 15)
//        sampleTextField.borderStyle = UITextField.BorderStyle.roundedRect
//        sampleTextField.autocorrectionType = UITextAutocorrectionType.yes
//        sampleTextField.keyboardType = UIKeyboardType.phonePad
//        sampleTextField.returnKeyType = UIReturnKeyType.done
//        sampleTextField.clearButtonMode = UITextField.ViewMode.whileEditing
//        sampleTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
//        sampleTextField.delegate = self
//        return sampleTextField
//
//    }()
//    func text (sender:UITextField) {
//        titleString = sender.text ?? ""
//        print(titleString)
//
//    }
//  @objc  func pips(textField: UITextField) {
//        titleString = textField.text!
//        print(titleString)
//    }
//
//
//
//
//    private func displaySucces() -> UIAlertController {
//        let alert = UIAlertController(title: "Уважаемый пользователь!", message: "Ваш запрос успешно обработан", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        //        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
//        return alert
//    }
//
//    private func displayFailure() -> UIAlertController {
//        let alert = UIAlertController(title: "Уважаемый пользователь!", message: "При запросе произошла ошибка", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        //        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
//        return alert
//    }
//
//
//}
//
//


//let names = ["Ford", "Arthur", "Trillian", "Zaphod", "Marvin", "Deep Thought", "Eddie", "Slartibartfast", "Humma Kuvula"]
//
//let index = find(value: "Eddie", in: names)
//print(index)


class Person {
    let name : String
    var phone : Int
    
    init (name : String , phone : Int ) {
        self.name = name
        self.phone = phone
    }
}


var tim = Person(name: "Tim", phone: 2999)
let tim2 = Person(name: "Glist", phone: 33333333)
tim = tim2
tim
tim2.name
tim.name
tim.phone = 0
tim2.phone
struct User {
    let name : String
    var phone : Int
}


var user = User(name: "Mikle", phone: 3444444)
let user2 = User(name: "Olga", phone: 6555555)


