//
//  File.swift
//  
//
//  Created by 김건우 on 6/5/24.
//

import ReactorKit
import MacrosInterface

// MARK: - Reactor Extension

@Reactor
public class CommentReactor {
    public typealias Action = NoAction
    public struct State { }
    public var initialState = State()
}




func runExtensionMacrosPlayground() {
    
    let reactor = CommentReactor()
    print("CommentReactor: \(reactor)")
    
}
