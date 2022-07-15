//
//  ServiceModel.swift
//  VK Service
//
//  Created by SergeyK on 14.07.2022.
//

import Foundation


struct ServiceModel: Codable{
    let body: BodyModel
    let status: Int
}
struct BodyModel: Codable{
    let services: [ServicesModels]
}

struct ServicesModels: Codable{
    let name: String
    let description: String
    let link: String
    let icon_url: String
}
