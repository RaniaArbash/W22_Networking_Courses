//
//  StudentModel.swift
//  W22_Networking_Courses
//
//  Created by Rania Arbash on 2022-03-17.
//

import Foundation

class Course : Codable {
    var id : Int = 0
    var courseCode : String = ""
    var courseName : String = ""
}

class StudentInfo : Codable{
    var student: String = ""
    var version : String = ""
    var count : Int = 0
    var data : [Course] = [Course]()
    
}
