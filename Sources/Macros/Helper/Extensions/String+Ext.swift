//
//  File.swift
//  
//
//  Created by 김건우 on 6/1/24.
//

import Foundation

public extension String {
    
    /// 문자열의 첫 문자를 대문자로 바꿉니다.
    ///
    /// - Returns: String
    /// - Author: 김소월
    ///
    func capitalizeFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
}
