//
//  WiproTestProtocol.swift
//  WiproTest
//
//  Created by Gyanendra Pathak on 01/10/20.
//  Copyright © 2020 Gyanendra Pathak. All rights reserved.
//

import Foundation
protocol CallServiceProtocol {
    func getApiResponse(_ completion: @escaping ((_ testType:Bool, _ status:Bool, _ message:String?, _ data:PicModel?, _ error:ApiError?) -> Void))
}
