//
//  File.swift
//  
//
//  Created by 김건우 on 6/26/24.
//

/// 타입이 Codable 프로토콜을 준수하게 합니다.
///
/// 이 매크로는 적용한 타입에 Codable 프로토콜을 준수하는 Extension과 CodingKeys 코드를 전개합니다.
///
/// CodingKey를 바꾸고 싶다면 멤버에 @CodableKey(name:) 매크로를 적용해야 합니다. 이 매크로는 단독으로 사용할 수 없으며, 반드시 @Codable 매크로와 함께 작성해야 합니다.
///
/// 아래는 전개되기 전과 후의 코드를 보여줍니다.
/// ```swift
/// @Codable
/// struct MemberDTO {
///     var name: String
///     @CodableKey(name: "day_of_birth") var dayOfBirth: String
///     var age: String
/// }
///
/// struct MemberDTO {
///     var name: String
///     var dayOfBirth: String
///     var age: String
///
///     // Begin expansion of "@Codable"
///     enum CodingKeys: String, CodingKey {
///         case name
///         case dayOfBirth = "day_of_birth"
///         case age
///     }
///     // End expansion of "@Codable"
/// }
///
/// // Begin expansion of "@Codable"
/// extension MemberDTO: Codable { }
/// // End expansion of "@Codable"
/// ```
/// - Warning: 이 매크로는 Struct에만 적용할 수 있습니다.
///
/// - Author: 김소월
///
@attached(member, names: named(CodingKeys))
@attached(extension, conformances: Codable)
public macro Codable() = #externalMacro(
    module: "MacrosImplementation",
    type: "CodableMacro"
)


