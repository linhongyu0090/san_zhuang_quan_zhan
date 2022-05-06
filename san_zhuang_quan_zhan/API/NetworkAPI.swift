//
//  NetworkAPI.swift
//  san_zhuang_quan_zhan
//
//  Created by 林宏宇 on 2022/4/11.
//

import Foundation
import Alamofire

private let BaseUrl = "https://raw.githubusercontent.com/linhongyu0090/san_zhuang_quan_zhan_API/master/"
//class NetworkAPI{
//    static func homeProductList(completion:@escaping(Result<[Product],Error>)->Void){
//        AF.request(BaseUrl + "products.json").responseData { response in
//            switch response.result{
//            case let .success(data):
//                if let list = try?JSONDecoder().decode([Product].self, from: data){
//                    completion(.success(list))
//                }else{
//                    let error = NSError(domain: "NetworkAPIDomain", code: 0, userInfo: [NSLocalizedDescriptionKey:"Decode error"])
//                    completion(.failure(error))
//                }
//            case let.failure(error):
//                completion(.failure(error))
//            }
//        }
//    }
//}

