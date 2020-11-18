//
//  TestingExtensions.swift
//  CotswoldCastTests
//
//  Created by Carl Peto on 18/11/2020.
//

import XCTest

typealias TestSite = (Bool, StaticString, UInt, UInt)

@_functionBuilder
struct TestsBuilder {
    static func buildBlock() -> [TestSite] { [] }
}

extension TestsBuilder {
    static func buildBlock(_ tests: Bool..., file: StaticString = #file, line: UInt = #line, column: UInt = #column) -> [TestSite] {
        tests.enumerated().map { test -> TestSite in
            (test.element, file, line + UInt(test.offset), column)
        }
    }
}

extension XCTestCase {
    func assert(@TestsBuilder _ tests: () -> [TestSite]) {
        for test in tests() {
            XCTAssert(test.0, file: test.1, line: test.2)
        }
    }
}
