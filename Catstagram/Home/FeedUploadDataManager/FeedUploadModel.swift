//
//  FeedUploadModel.swift
//  Catstagram
//
//  Created by 선가연 on 7/5/24.
//

struct FeedUploadModel : Decodable {
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : FeedUploadResult?
}

struct FeedUploadResult : Decodable {
    var postIdx : Int?
}
