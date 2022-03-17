//
//  ViewController.swift
//  W22_Networking_Courses
//
//  Created by Rania Arbash on 2022-03-17.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    var studentFromURL : StudentInfo = StudentInfo()
    override func viewDidLoad() {
        super.viewDidLoad()

        let Stringurl = "https://raw.githubusercontent.com/RaniaArbash/Networking_IOS/main/courses_data.json"
        NetworkingService.shared.fetchDataFromURL(url: Stringurl) { result in
            switch (result){
            case .success(let studentInfor) :
                self.studentFromURL = studentInfor
                DispatchQueue.main.async {
                    self.table.reloadData()
                }
            case .failure(let error) :
                print (error)
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentFromURL.data.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = studentFromURL.data[indexPath.row].courseCode
        cell?.detailTextLabel?.text = studentFromURL.data[indexPath.row].courseName
        
        return cell!
    }

}

