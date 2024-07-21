//
//  EndPoints.swift
//
//  Created by Alaa Mohamed
//

import Foundation

struct EndPoints {
    static let BASE_URL = "https://portal-test.rxmaxreturns.com/rxmax/"
}

//MARK: - AUTHORIZATION

extension EndPoints {
    struct Authorization {
        static let LOGIN = "auth"
        static let PHARMACIES = "pharmacies/management"
        static let RETURN_REQUEST = "pharmacies/"
    }
}
