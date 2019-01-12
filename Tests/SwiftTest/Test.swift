//
//  Test.swift
//  cmarkTests
//

import XCTest
import Libcmarkgfm

class Test: XCTestCase {

    let mdTable = """
| foo | bar |
| --- | --- |
| baz | bim |
"""
    
    let mdCode = """
```ruby
line1
line2
```
"""
    
    let mdEmph = "xx *eeee* yy"

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    // func testSimpleParse() throws {
    //     withExtensions() {
    //         Helper.dumpTree(from: mdEmph)
    //     }
    // }
    
    func testSimpleRender() {
        let data = Helper.renderStr(from: mdEmph)
        XCTAssertEqual("<p>xx <em>eeee</em> yy</p>\n", data)
    }
    
    func testTableRender() {
        let data = Helper.renderStr(from: mdTable)
        XCTAssertEqual("<table>\n<thead>\n<tr>\n<th>foo</th>\n<th>bar</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>baz</td>\n<td>bim</td>\n</tr></tbody></table>\n", data)
    }

    
}
