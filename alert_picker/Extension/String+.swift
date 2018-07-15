//
//  String+.swift
//  alert_picker
//
//  Created by Kentarou on 2018/07/15.
//  Copyright © 2018年 西川継延. All rights reserved.
//

import Foundation

extension String {
    func numberOfOccurrences(of word: String) -> Int {
        var count = 0
        var nextRange = self.startIndex..<self.endIndex
        while let range = self.range(of: word, options: .caseInsensitive, range: nextRange) {
            count += 1
            nextRange = range.upperBound..<self.endIndex
        }
        return count
    }
}
