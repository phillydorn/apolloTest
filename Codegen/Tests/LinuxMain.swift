import XCTest
import Foundation
import ApolloCodegenLib
import CodegenTests

var tests = [XCTestCaseEntry]()
tests += CodegenTests.allTests()
XCTMain(tests)
