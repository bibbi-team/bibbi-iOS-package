//
//  File.swift
//  
//
//  Created by 김건우 on 5/25/24.
//

// MARK: - MemberDeprecated MemberAttribute

@attached(memberAttribute)
public macro Deprecated() = #externalMacro(
    module: "MacrosImplementation",
    type: "DeprecatedMacro"
)
