//
//  File.swift
//  
//
//  Created by 김건우 on 6/26/24.
//

/// CodingKey를 바꿉니다.
///
/// 이 매크로를 적용한 멤버의 CodingKey를 바꾸어 CodingKeys 코드를 전개합니다.
///
/// - Parameters:
///     - name: CodingKey를 입력합니다.
/// - Warning: @Codable 매크로없이 단독으로 적용할 수 없습니다.
///
/// - Author: 김소월
///
@attached(peer)
public macro CodableKey(name: String) = #externalMacro(
    module: "MacrosImplementation",
    type: "CodableKeyMacro"
)
