//
//  File.swift
//  
//
//  Created by 김건우 on 5/25/24.
//

import ReactorKit

// MARK: - Codable Complex

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



// MARK: - Wrapper Complex


/// 타입이 BaseWrapper 프로토콜을 준수하게 합니다.
///
/// 이 매크로를 적용한 타입에 BaseWrapper 프로토콜을 준수하게 하고 make() 메서드 및 viewController, reactor 계산 프로퍼티를 추가합니다.
///
/// 첫 번째 Generic 타입은 Reactor 프로토콜을 준수하는 타입이어야 하고, 두 번째 Generic 타입은 ReactorKit.View 프로토콜을 준수하는 타입이어야 합니다.
///
/// 아래는 전개되기 전과 후의 코드를 보여줍니다.
/// ```swift
/// @Wrapper<HomeReactor, HomeViewController>
/// public class HomeViewControllerWrapper {
///     public func makeReactor() -> R {
///         return HomeReactor()
///     }
///
///     // Begin expansion of "@Wrapper"
///     public typealias R = HomeReactor
///     public typealias V = ViewController
///
///     public func makeViewController() -> V {
///          return HomeViewController(reactor: makeReactor())
///     }
///
///     public var viewController: V {
///         return makeViewController()
///     }
///
///     public var reactor: R {
///         return makeReactor()
///     }
///     // End expansion of "@Wrapper"
/// }
/// // Begin expansion of "@Wrapper"
/// extension HomeViewControllerWrapper: BaseWrapper { }
/// // End expansion of "@Wrapper"
/// ```
///
/// - 참고:  BaseWrapper 프로토콜은 아래와 같이 선언되어 있습니다.
/// ```swift
/// public protocol BaseWrapper {
///     associatedtype R: Reactor
///     associatedtype V: ReactorKit.View
///
///     func makeReactor() -> R
/// }
/// ```
/// 이 매크로는 첨부된 선언의 접근 제어자에 따라 전개되는 멤버의 접근 제어자가 바뀝니다. 예를 들어, 첨부 Class가 public 접근 제어자를 가진다면 전개되는 멤버도 public 접근 제어자를 가집니다.
///
/// - Warning: 이 매크로는 Class에만 적용할 수 있습니다.
///
/// - Author: 김소월
///
@attached(member, names: arbitrary)
@attached(extension, conformances: BaseWrapper)
public macro Wrapper<R, V>() = #externalMacro(
    module: "MacrosImplementation",
    type: "WrapperMacro"
)


public protocol BaseWrapper {
    associatedtype R: Reactor
    associatedtype V: ReactorKit.View
    
    func makeReactor() -> R
}



// MARK: - Wrapper View Complex


/// 타입이 BaseWrapper 프로토콜을 준수하게 합니다.
///
/// 이 매크로를 적용한 타입에 BaseWrapper 프로토콜을 준수하게 하고 make() 메서드 및 view, reactor 계산 프로퍼티를 추가합니다.
///
/// 첫 번째 Generic 타입은 Reactor 프로토콜을 준수하는 타입이어야 하고, 두 번째 Generic 타입은 ReactorKit.View 프로토콜을 준수하는 타입이어야 합니다.
///
/// 아래는 전개되기 전과 후의 코드를 보여줍니다.
/// ```swift
/// @Wrapper<RankingReactor, RankingView>
/// public class HomeViewControllerWrapper {
///     public func makeReactor() -> R {
///         return HomeReactor()
///     }
///
///     // Begin expansion of "@WrapperView"
///     public typealias R = RankingReactor
///     public typealias V = RankingView
///
///     public func makeView() -> V {
///          return RankingView(reactor: makeReactor())
///     }
///
///     public var view: V {
///         return makeView()
///     }
///
///     public var reactor: R {
///         return makeReactor()
///     }
///     // End expansion of "@WrapperView"
/// }
/// // Begin expansion of "@WrapperView"
/// extension HomeViewControllerWrapper: BaseWrapper { }
/// // End expansion of "@WrapperView"
/// ```
///
/// - 참고:  BaseWrapper 프로토콜은 아래와 같이 선언되어 있습니다.
/// ```swift
/// public protocol BaseWrapper {
///     associatedtype R: Reactor
///     associatedtype V: ReactorKit.View
///
///     func makeReactor() -> R
/// }
/// ```
/// 이 매크로는 첨부된 선언의 접근 제어자에 따라 전개되는 멤버의 접근 제어자가 바뀝니다. 예를 들어, 첨부 Class가 public 접근 제어자를 가진다면 전개되는 멤버도 public 접근 제어자를 가집니다.
///
/// - Warning: 이 매크로는 Class에만 적용할 수 있습니다.
///
/// - Author: 김소월
///
@attached(member, names: arbitrary)
@attached(extension, conformances: BaseWrapper)
public macro WrapperView<R, V>() = #externalMacro(
    module: "MacrosImplementation",
    type: "WrapperViewMacro"
)


