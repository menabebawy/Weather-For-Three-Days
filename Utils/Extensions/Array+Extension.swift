//
//  Array+Extension.swift
//  Utils
//
//  Created by Mena Bebawy on 2/8/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Foundation

public extension Array {

    mutating func mutateEach(by transform: (inout Element) throws -> Void) rethrows {
        self = try map { el in
            var el = el
            try transform(&el)
            return el
        }
     }

}
