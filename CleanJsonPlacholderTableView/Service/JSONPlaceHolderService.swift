//
//  Service.swift
//  CleanJsonPlacholderTableView
//
//  Created by aykut ipek on 2.05.2023.
//

import Foundation
import Alamofire

protocol JSONPlaceholderServiceProtocol{
    func fetchAllPosts(onSuccess: @escaping([PostModel])->Void, onFail: @escaping(String?)-> Void)
}

struct JSONPlaceHolderService: JSONPlaceholderServiceProtocol{
    func fetchAllPosts(onSuccess: @escaping ([PostModel]) -> Void, onFail: @escaping (String?) -> Void) {
        AF.request(JSONPlaceholderServicePath.POSTS.withBaseURL(), method: .get).validate().responseDecodable(of: [PostModel].self) { response in
            guard let items = response.value else {
                onFail(response.debugDescription)
                return
            }
            onSuccess(items)
        }
    }
}
