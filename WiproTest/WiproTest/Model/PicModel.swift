//
//  PicModel.swift
//  PicCollection
//
//  Created by Gyanendra Pathak on 31/08/20.
//  Copyright © 2020 Gyanendra Pathak. All rights reserved.
//

import Foundation

// MARK: - PicModel
struct PicModel: Decodable {
    let title: String?
    let rows: [PicDetail]?
}

// MARK: - PicDetail
struct PicDetail: Decodable {
    let title: String?
    let rowDescription: String?
    let imageHref: String?

    enum CodingKeys: String, CodingKey {
        case title
        case rowDescription = "description"
        case imageHref
    }
}
