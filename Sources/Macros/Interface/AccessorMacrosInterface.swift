//
//  File.swift
//  
//
//  Created by 김건우 on 5/31/24.
//

import Dependencies

// MARK: - DependecyValue Accessor

@attached(accessor)
public macro DependencyValue(for: any DependencyKey.Type) = #externalMacro(
    module: "MacrosImplementation",
    type: "DependencyValueMacro"
)
