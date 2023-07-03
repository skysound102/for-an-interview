//
//  GeneralView.swift
//  LikePhoto
//
//  Created by Артем on 21.06.2023.
//

import UIKit
import SnapKit
class GeneralView: UIViewController {
    
    var hren = ""
    var hren2 = ""
    let pups = Pups()

    var collectionImage :[UIImage] = []
    var collectionImage1 :[String] = [] 
     
    
let namePerson = ViewController()
  let base = Base()
    lazy var imageSearch : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var imagelike : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "likeImage")
        return image
    }()
    lazy var crossImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "crossImage")
        return image
    }()
    
    lazy var name : UILabel = {
        let name = UILabel()
        name.text = "Wellcome , \(namePerson.person)!"
        name.textColor = .black
        name.font = name.font.withSize(30)
        return name
    }()
    
    
    lazy var buttonCollection : UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.orange, for: .normal)
        button.setTitle("Моя коллекция", for: .normal)
        button.backgroundColor = .lightText
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(clicking), for: .touchUpInside)

       return button
    }()
    
    @objc func clicking() {
                self.navigationController?.pushViewController(TableViewController(), animated: true)
    }
    
    override func viewDidLoad() {
        Pups.shared.APIService { UIImageView, url  in
            
            self.imageSearch.image = UIImageView
            self.hren = "\(url!)"
            print(self.collectionImage1)
            self.collectionImage.append(self.imageSearch.image!)
        }
            print(collectionImage1)
        if let data = UserDefaults.standard.value(forKey: "person") as? String {
            namePerson.person = data
            
        }
        
        if let data2 = UserDefaults.standard.object(forKey: "b") as? [String] {
            collectionImage1 = data2
        }
 
      
        let backImage = UIImage(named: "backgroundRegistration")  ?? UIImage()
        view.backgroundColor = UIColor(patternImage: backImage)
        
        super.viewDidLoad()
        
        view.addSubview(imageSearch)
        view.addSubview(name)
        view.addSubview(imagelike)
        view.addSubview(crossImage)
        view.addSubview(buttonCollection)
        initialization()
    }
    

    @objc func tuchLike( _ sender: UITapGestureRecognizer? = nil) {
        
       
        print(collectionImage.count)
        self.imageSearch.alpha = 0.0
        UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseInOut, animations: {
        self.imageSearch.alpha = 0.01
        }) { _ in print("Animation Done") }
        UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseInOut, animations: {
        self.imageSearch.alpha = 1.0
        }) { _ in print("Animation Done") }

        base.APIService  { UIImageView, url  in
            self.hren = "\(url!)"
            
                        self.imageSearch.image = UIImageView

            
//            self.collectionImage1.append(self.urli)
            print(self.collectionImage1)
                 self.collectionImage.append(self.imageSearch.image!)

     
        }
        self.collectionImage1.append(self.hren)
        UserDefaults.standard.set(self.collectionImage1, forKey: "b")
     
    }
    
    @objc func tuchDisLike( _ sender: UITapGestureRecognizer? = nil) {
        UserDefaults.standard.removeObject(forKey: "b")
    
        self.imageSearch.alpha = 0.0
        UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseInOut, animations: {

        self.imageSearch.alpha = 0.01
        }) { _ in print("Animation Done") }
        UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseInOut, animations: {
        self.imageSearch.alpha = 1.0
        }) { _ in print("Animation Done") }
   
        base.APIService { UIImageView, url  in
                    self.imageSearch.image = UIImageView
            self.hren = "\(url!)"
                }

    }

    private func initialization() {
        self.navigationItem.leftBarButtonItem?.isEnabled = false
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(tuchLike(_ :)))
        imagelike.addGestureRecognizer(recognizer)
        imagelike.isUserInteractionEnabled = true
        
        let recognizer2 = UITapGestureRecognizer()
        recognizer2.addTarget(self, action: #selector(tuchDisLike(_ :)))
        crossImage.addGestureRecognizer(recognizer2)
        crossImage.isUserInteractionEnabled = true
        
        
        imageSearch.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(10)
            make.right.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(100)
            make.bottom.equalToSuperview().inset(500)
        }
        imagelike.snp.makeConstraints { make in
             make.left.equalToSuperview().inset(10)
             make.top.equalToSuperview().inset(400)
             make.height.equalTo(100)
             make.width.equalTo(100)
         }
        crossImage.snp.makeConstraints { make in
             make.right.equalToSuperview().inset(10)
             make.top.equalToSuperview().inset(400)
             make.height.equalTo(100)
             make.width.equalTo(100)
         }
        
        buttonCollection.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(50)
            make.right.equalToSuperview().inset(50)
            make.top.equalToSuperview().inset(700)
            make.height.equalTo(30)
            make.width.equalTo(200)
        }
        
       name.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(50)
            make.right.equalToSuperview().inset(50)
            make.top.equalToSuperview().inset(600)
            make.height.equalTo(30)
            make.width.equalTo(200)
        }
    }
}
