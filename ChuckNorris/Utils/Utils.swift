//
//  Utils.swift
//  ChuckNorris
//
//  Created by Thiago Cavalcante de Oliveira on 01/12/2018.
//  Copyright © 2018 Thiago Cavalcante de Oliveira. All rights reserved.
//

import Foundation
import Alamofire

class Utils {
    class func isConnected() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
