//
//  File.swift
//  
//
//  Created by 김건우 on 5/31/24.
//

import Dependencies

// MARK: - DependecyValue Accessor

/// 의존성 주입을 위한 getter/setter 코드를 전개합니다.
///
/// 아래는 전개되기 전과 후의 코드를 보여줍니다.
/// ```swift
/// extension DependencyValues {
///     @DependencyValue(for: LinkRepositoryKey.self)
///     var linkRepository: LinkRepositoryProtocol
///     // Begin expansion of "@DependencyValue"
///     {
///         get { self[LinkRepositoryKey.self] }
///         set { self[LinkRepositoryKey.self] = newValue }
///     }
///     // End expansion of "@DependencyValue"
/// }
///```
///
/// - Parameters:
///     - key: DependencyKey 프르토콜 준수 객체의 메타 타입
///
/// - NOTE: 의존성 주입에 관한 내용은 [여기](https://swiftpackageindex.com/pointfreeco/swift-dependencies/main/documentation/dependencies)를 참조하세요.
///
/// Author: - 김소월
///
@attached(accessor)
public macro DependencyValue(for: any DependencyKey.Type) = #externalMacro(
    module: "MacrosImplementation",
    type: "DependencyValueMacro"
)
