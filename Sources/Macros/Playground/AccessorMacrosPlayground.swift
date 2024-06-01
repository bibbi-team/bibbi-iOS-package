//
//  File.swift
//  
//
//  Created by 김건우 on 5/31/24.
//

import Dependencies
import MacrosInterface

// MARK: - DependencyValue Accessor

protocol MeRepositoryProtocol {
    func request() -> String
}
class MeRepository: MeRepositoryProtocol {
    func request() -> String {
        return """
        {
            \"name\":\"김소월\",
            \"day_of_birth\":\"1998-03-21\",
            \"age\": 27
        }
        """
    }
}

protocol MemberRepositoryProtocol {
    func request() -> String
}
class MemberRepository: MemberRepositoryProtocol {
    func request() -> String {
        return """
        {
            \"members\":\"[김소월, 김제니, 마미미]\",
        }
        """
    }
}

// DependencyKey
struct MeRepositoryKey: DependencyKey {
    static let liveValue: MeRepositoryProtocol = MeRepository()
}
struct MemberRepositoryKey: DependencyKey {
    static let liveValue: MemberRepositoryProtocol = MemberRepository()
}

// DependencyValues
@DependencyVales
extension DependencyValues {
    var meRepository: MeRepositoryProtocol
    @DependencyValue(for: MemberRepositoryKey.self)
    var memberRepository: MemberRepositoryProtocol
}






func runAccessorMacrosPlayground() {
    
    @Dependency(\.meRepository) var meRepository
    let me = meRepository.request()
    print("Requested Data from MeRepository: \(me)")
    
    @Dependency(\.memberRepository) var memberRepository
    let members = memberRepository.request()
    print("Requested Data from MemberRepository: \(members)")
    
}
