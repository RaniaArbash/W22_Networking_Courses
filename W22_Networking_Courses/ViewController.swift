//
//  ViewController.swift
//  W22_Networking_Courses
//
//  Created by Rania Arbash on 2022-03-17.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let Stringurl = "https://raw.githubusercontent.com/RaniaArbash/Networking_IOS/main/courses_dat.json"
        NetworkingService.shared.fetchDataFromURL(url: Stringurl) { studentInfo in
            
            print(studentInfo.student)
        }
    
    }


}

