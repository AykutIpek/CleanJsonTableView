//
//  ServicePath.swift
//  CleanJsonPlacholderTableView
//
//  Created by aykut ipek on 2.05.2023.
//

import Foundation

enum JSONPlaceholderServicePath: String{
    case POSTS = "/posts"
}

extension JSONPlaceholderServicePath{
    func withBaseURL()-> String{
        return "https://jsonplaceholder.typicode.com\(self.rawValue)"
    }
}
