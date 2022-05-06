//
//  Product.swift
//  Shopping
//
//  Created by 林宏宇 on 2022/4/8.
//

import Foundation

class Product:Codable{
    var id :Int
    var name:String
    var tradename:String
    var cover:String
    var images:[String]
    var rating:Int
    var price:Double
    var category:String
}
