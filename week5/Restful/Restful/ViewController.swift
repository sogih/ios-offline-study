//
//  ViewController.swift
//  Restful
//
//  Created by sogih on 17/07/2019.
//  Copyright © 2019 sogih. All rights reserved.
//

import UIKit
import Alamofire
import SnapKit


class ViewController: UIViewController {
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1")
//    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
//    let url = URL(string: "https://jsonplaceholder.typicode.com/users")
    
    let requestButton: UIButton = {
        let button = UIButton()
        button.setTitle("Request", for: .normal)
        button.addTarget(self, action: #selector(tappedRequestButton), for: .touchUpInside)
        button.backgroundColor = .red
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(requestButton)
        requestButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(100)
        }
        
    }
    
    @objc func tappedRequestButton() {

        AF.request(self.url!).responseJSON { (respon) in
            switch respon.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
                    let newModel = try decoder.decode(User.self, from: jsonData)
                    print(newModel.body)
                    print(newModel.id)
                } catch {
                }
//                print(data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

    }
    
    
//    @objc func tappedRequestButton() {
//        AF.request(self.url!).responseJSON { (respon) in
//            switch respon.result {
//            case .success(let data):
//
//                if let obj = data as? [String:Any] { // 타입 캐스팅 성공하면 if 구문 실행
//
//                    var myUserId: Int = 0
//                    var myId: Int = 0
//                    var myTitle: String = ""
//                    var myBody: String = ""
//
//                    if let userId = obj["userId"] as? Int {
//                        myUserId = userId
//                    }
//
//                    if let id = obj["id"] as? Int {
//                        myId = id
//                    }
//
//                    if let title = obj["title"] as? String {
//                        myTitle = title
//                    }
//
//                    if let body = obj["body"] as? String {
//                        myBody = body
//                    }
//
//                    let user = User(body: myBody, id: myId, title: myTitle, userId: myUserId)
//                    print(user)
//
//                }
//
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    
//    @objc func tappedRequestButton() {
//        AF.request(self.url!).responseJSON { (respon) in
//            var user = [User]()
//
//            switch respon.result {
//            case .success(let data):
//                if let obj = data as? [[String:Any]] {
//                    for i in 0..<obj.count {
//
//                        var myUserId: Int = 0
//                        var myId: Int = 0
//                        var myTitle: String = ""
//                        var myBody: String = ""
//
//                        if let userId = obj[i]["userId"] as? Int {
//                            myUserId = userId
//                        }
//
//                        if let id = obj[i]["id"] as? Int {
//                            myId = id
//                        }
//
//                        if let title = obj[i]["title"] as? String {
//                            myTitle = title
//                        }
//
//                        if let body = obj[i]["body"] as? String {
//                            myBody = body
//                        }
//
//                        user.append(User(body: myBody, id: myId, title: myTitle, userId: myUserId))
//                    }
//                }
//                print(user)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    
//    @objc func tappedRequestButton() {
//        AF.request(self.url!).responseJSON { (rp) in
//            var user = [User]()
//
//            switch rp.result {
//            case .success(let data):
//                if let obj = data as? [[String:Any]] {
//                    for i in 0..<obj.count {
//
//                        var myId: Int = 0
//                        var myName: String = ""
//                        var myUserName: String = ""
//                        var myEmail: String = ""
//
//
//                        var myAddress: Address = Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: ""))
//                        var myStreet: String = ""
//                        var mySuite: String = ""
//                        var myCity: String = ""
//                        var myZipcode: String = ""
//                        var myGeo: Geo = Geo(lat: "", lng: "")
//                        var myLat: String = ""
//                        var myLng: String = ""
//
//                        var myPhone: String = ""
//                        var myWebsite: String = ""
//
//                        var myCompany: Company = Company(name: "", catchPhrase: "", bs: "")
//                        var myCompanyName: String = ""
//                        var myCatchPhrase: String = ""
//                        var myBs: String = ""
//
//
//                        if let id = obj[i]["id"] as? Int { myId = id }
//                        if let name = obj[i]["name"] as? String { myName = name }
//                        if let userName = obj[i]["username"] as? String { myUserName = userName }
//                        if let email = obj[i]["email"] as? String { myEmail = email }
//
//                        if let address = obj[i]["address"] as? [String:Any] {
//                            if let street = address["street"] as? String { myStreet = street }
//                            if let suite = address["suite"] as? String { mySuite = suite }
//                            if let city = address["city"] as? String { myCity = city }
//                            if let zipcode = address["zipcode"] as? String { myZipcode = zipcode }
//                            if let geo = address["geo"] as? [String:String] {
//                                if let lat = geo["lat"] { myLat = lat }
//                                if let lng = geo["lng"] { myLng = lng }
//                                myGeo = Geo(lat: myLat, lng: myLng)
//                            }
//                            myAddress = Address(street: myStreet, suite: mySuite, city: myCity, zipcode: myZipcode, geo: myGeo)
//                        }
//
//
//                        if let company = obj[i]["company"] as? [String:String] {
//                            if let name = company["name"] { myCompanyName = name }
//                            if let catchPhrase = company["catchPhrase"] { myCatchPhrase = catchPhrase }
//                            if let bs = company["bs"] { myBs = bs}
//                            myCompany = Company(name: myCompanyName, catchPhrase: myCatchPhrase, bs: myBs)
//                        }
//
//                        user.append(User(id: myId, name: myName, username: myUserName, email: myEmail, address: myAddress, phone: myPhone, website: myWebsite, company: myCompany))
//                    }
//                }
//                print(user)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }


}
