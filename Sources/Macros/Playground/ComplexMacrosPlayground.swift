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
    
}


