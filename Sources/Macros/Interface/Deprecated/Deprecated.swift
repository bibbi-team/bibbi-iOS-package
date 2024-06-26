//
//  File.swift
//  
//
//  Created by 김건우 on 6/26/24.
//

/// 모든 멤버(프로퍼티, 함수 등)에 deprecated 기호를 전개합니다.
///
/// 이 매크로를 적용한 타입에 속한 모든 멤버(프로퍼티, 함수, 타입아일리어스 등)에 deprecated 기호를 붙입니다.
///
/// - Author: 김소월
///
@attached(memberAttribute)
public macro Deprecated() = #externalMacro(
    module: "MacrosImplementation",
    type: "DeprecatedMacro"
)
