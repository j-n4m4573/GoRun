//
//  XCTestCase.swift
//  GoRunTests
//
//  Created by Jamar Gibbs on 2/16/21.
//

import Foundation

import XCTest

extension XCTestCase {
    
    func loadStub(name: String, extension: String) -> Data {
        
        let bundle = Bundle(for: classForCoder)
        let url = bundle.url(forResource: name, withExtension: `extension`)
        
        return try! Data(contentsOf: url!)
    }
}
