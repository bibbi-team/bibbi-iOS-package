//
//  File.swift
//  
//
//  Created by 김건우 on 5/25/24.
//

import Foundation
import MacrosInterface

// MARK: - Codable Complex

@Codable
public struct MemberDTO {
    var name: String
    @CodableKey(name: "day_of_birth") var dayOfBirth: String
    var age: Int
}


// MARK: - Wrapper Complex

#if canImport(UIKit)

import UIKit
import ReactorKit

public class SomeReactor: Reactor {
    public typealias Action = NoAction
    
    public struct State { }
    
    public var initialState: State = State()
}

public class SomeViewController: UIViewController, ReactorKit.View {
    public typealias Reactor = SomeReactor
    public var disposeBag = DisposeBag()
    
    public convenience init(reactor: Reactor) {
        self.init()
        self.reactor = reactor
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public func bind(reactor: SomeReactor) { }
}

@Wrapper<SomeReactor, SomeViewController>
public class SomeViewControlllerWrapper {
    
    public func makeReactor() -> R {
        return SomeReactor()
    }
    
}


func runWrapperMacro() {
    let someViewController = SomeViewControlllerWrapper().viewController
    print("SomeViewController: \(someViewController)")
}

#endif



func runComplexMacorsPlayground() {
    
    let jsonString = """
    {
        \"name\":\"김소월\",
        \"day_of_birth\":\"1998-03-21\",
        \"age\": 27
    }
    """
    if let jsonData = jsonString.data(using: .utf8),
       let decodedMember = try? JSONDecoder().decode(MemberDTO.self, from: jsonData) {
        print("Decoded Member: \(decodedMember)")
    }
    
    
    #if canImport(UIKit)
    
    runWrapperMacro()
    
    #endif
    
}


