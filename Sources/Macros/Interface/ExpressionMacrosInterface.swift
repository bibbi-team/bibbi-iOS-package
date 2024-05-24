//
//  ExpressionMacrosInterface.swift
//
//
//  Created by 김건우 on 5/24/24.
//

import Foundation

// MARK: - #URL

@freestanding(expression)
public macro URL(_ s: String) -> URL = #externalMacro(
    module: "MacrosImplementation",
    type: "URLMacro"
)
