//
//  File.swift
//  
//
//  Created by 김건우 on 5/25/24.
//

// MARK: - Deprecated MemberAttribute

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


// MARK: - Dependency Values Member Attribute


/// @DependencyValue 매크로를  프로퍼티에 전개합니다.
///
/// 이 매크로를 적용한 확장에 속한 모든 저장 프로퍼티에 @DependencyValue 매크로를 붙입니다. 확장에 속한 프로퍼티가 getter/setter 프로퍼티라면 속성을 붙이지 않습니다.
///
/// 아래는 전개되기 전과 후의 코드를 보여줍니다.
/// ```swift
/// @DependencyValues
/// extension DependencyValues {
///     // Begin expansion of "@DependencyValues"
///     @DependencyValue(for: MeRepositoryKey.self)
///     // End expansion of "@DependencyValues"
///     var meRepository: MeRepositoryProtocol
/// }
/// ```
///
/// 이 매크로는 전개된 매크로를 적용한 프로퍼티에 영향을 받습니다. 매크로는 프로퍼티 이름(identifier)의 첫 글자를 대문자로 바꾸고, 접미사에 `Key` 키워드를 붙여 새로운 매크로의 매개변수에 메타 타입으로 넘겨줍니다.
///
/// 위 예제를 보면 전개된 `@DependencyValue` 매크로의 매개변수로 `MeRepositoryKey.self`라는 메타 타입을 넘겨 줄 수. 있는 건 `meRepository`라는 프로퍼티 이름으로부터 추론했기 때문입니다.
///
/// 그렇기 때문에 코드 작성자는 DepdendencyKey 프로토콜 준수 객체의 이름을 `MeRepositoryKey`처럼 일정한 규칙에 따라 작성해야 합니다.
///
/// 부득이한 경우에는 직접 프로퍼티에 `@DependencyValue` 매크로를 적용해 다른 규칙을 적용할 수 있습니다. 이 매크로가 적용되어도 @DependencyValues 매크로는  여전히 사용가능합니다. 해당 매크로는 @DependencyValue 매크로가 붙은 프로퍼티를 무시합니다.
///
/// - NOTE: 의존성 주입에 관한 내용은 [여기](https://swiftpackageindex.com/pointfreeco/swift-dependencies/main/documentation/dependencies)를 참조하세요.
///
/// - Warning: 이 매크로는 Extension에만 적용할 수 있습니다.
///
@attached(memberAttribute)
public macro DependencyOrganizer() = #externalMacro(
    module: "MacrosImplementation",
    type: "DependencyOrganizerMacro"
)
