//
//  File.swift
//  
//
//  Created by 김건우 on 6/5/24.
//

import ReactorKit

// MARK: - Reactor Extension

/// 타입이 Reactor 프로토콜을 준수하게 합니다.
/// - Author: 김소월
@attached(extension, conformances: Reactor)
public macro Reactor() = #externalMacro(
    module: "MacrosImplementation",
    type: "ReactorMacro"
)
