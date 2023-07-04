//
//  TableViewController.swift
//  LikePhoto
//
//  Created by Артем on 24.06.2023.
//

import UIKit
import SnapKit
class TableViewController: UIViewController{
    var collectionArrayImage = [UIImage]()
    let dannye = GeneralView()
    let namePerson = ViewController()

    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero , style:.grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    
    override func viewDidLoad() {
        
        if let data = UserDefaults.standard.value(forKey: "person") as? String {
            namePerson.person = data
            
        }
        DispatchQueue.main.async {
     
            self.tableView.reloadData()
            
        }
        
        
        if let data2 = UserDefaults.standard.object(forKey: "\(namePerson.person)") as? [String] {
            dannye.collectionImage1 = data2
            print(dannye.collectionImage1)
        }
      

 

        super.viewDidLoad()
        tableView.reloadData()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        setupConstrains()
     
    }
    

    func APIService2(){
        for i in dannye.collectionImage1 {
   
                        let url = URL(string: i)
            
      
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url!) {(data , response , error) in
                guard let data = try? Data(contentsOf: url!) , error == nil else { return }
                DispatchQueue.main.async {
                    
                  
                    self.collectionArrayImage.append(UIImage(data: data)!)

               
                    
                }
            }
            
            task.resume()
        }
    }
    
    private func setupConstrains(){
        tableView.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
        }
    }


}

extension TableViewController : UITableViewDataSource , UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
     return dannye.collectionImage1.count
     
 }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
   
 

//        APIService2 { UIImage in
   
        
        for i in self.dannye.collectionImage1 {
//            let url = URL(string: i)
            
            if let url = URL(string: i) {
                
                let task = URLSession.shared.dataTask(with: url) { data, response, url in
                    
                    // Error handling...
                    guard let imageData = data else { return }
                        
                        DispatchQueue.main.async {
                           
                            self.collectionArrayImage.append(UIImage(data: imageData) ?? UIImage())
                            
                            cell.imageView?.image = self.collectionArrayImage[indexPath.row]
                           
                            }
               
                        
                    

                }
               
                task.resume()
            }

        }
                
       
        return cell
            
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  100.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "My Collection"
    }
    
}
