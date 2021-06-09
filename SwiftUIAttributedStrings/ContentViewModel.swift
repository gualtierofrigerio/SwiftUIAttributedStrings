//
//  ContentViewModel.swift
//  SwiftUIAttributedStrings
//
//  Created by Gualtiero Frigerio on 08/06/21.
//  Copyright © 2021 Gualtiero Frigerio. All rights reserved.
//

import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
    var string = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras rhoncus efficitur lorem, tincidunt viverra ex tempor pretium. Donec nec porta metus. Fusce tincidunt vulputate venenatis. Phasellus viverra purus mi, vel scelerisque tortor vulputate vitae. In porttitor placerat enim, eget sollicitudin purus. Donec vulputate pretium justo, sit amet placerat dui volutpat quis. \nNunc lacinia, metus eu aliquet vulputate, leo enim elementum urna, vitae imperdiet metus mauris ultrices ante. Quisque id tempus ante. Suspendisse vel rhoncus velit, vitae viverra tellus. Vivamus sed viverra orci. Etiam accumsan lorem ut finibus sagittis. Suspendisse potenti."
    
    func highlightText(matching:String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: string)
        let wholeRange = string.startIndex..<string.endIndex
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .justified
        paragraphStyle.firstLineHeadIndent = 10.0
        paragraphStyle.lineBreakMode = .byTruncatingTail
        paragraphStyle.lineSpacing = 3.0
        
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(wholeRange, in:string))
        
        string.enumerateSubstrings(in: wholeRange, options:.byWords) {subString, subrange,_,_ in
            if subString?.lowercased() == matching.lowercased() {
                attributedString.addAttribute(.backgroundColor, value: UIColor.yellow, range: NSRange(subrange, in: self.string))
            }
        }
        
        return attributedString
    }
    
    @available(iOS 15, *)
    func getAttributedString(highlightText: String) -> AttributedString {
        var attributedString = AttributedString(string)
        
        if let range = attributedString.range(of: highlightText, options: .caseInsensitive, locale: nil) {
            attributedString[range].backgroundColor = .red
        }
                
        return attributedString
    }

}
