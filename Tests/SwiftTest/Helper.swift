//
//  Helper.swift
//  cmarkTests
//

import Foundation
import Libcmarkgfm

public func withExtensions<T>(fn: ()->T ) -> T {
    cmark_register_plugin(core_xt_extensions_registration)
    let t = fn()
    cmark_release_plugins();
    return t
}

extension String {
    init?(unsafeCString: UnsafePointer<Int8>!) {
        guard let cString = unsafeCString else { return nil }
        self.init(cString: cString)
    }
}

public class Helper {

    static func renderStr(from: String) -> String {
        guard let md = from.data(using: .utf8) else {
            return ""
        }
        
        return Helper.render(from: md)
    }
    
    static func render(from: Data) -> String {
        cmark_register_plugin(core_xt_extensions_registration)
        return from.withUnsafeBytes() { (bytes: UnsafePointer<Int8>) -> String in
            guard let htmlBytes = cmark_xt_markdown_to_html(bytes, from.count, 0, CMARK_XTOPT_USE_EXTENSIONS) else { return "" }
            let html = String(utf8String: htmlBytes)
            free(htmlBytes)

            cmark_release_plugins();

            return html ?? ""
        }
    }
    
    // static func dumpTree(from: String) {
    //     let node = Node(markdown: from)
    //  
    //     guard let tree = node?.children else { XCTFail("Count not parse doc"); return; }
    //        
    //     for n in tree {
    //         print(n)
    //     }
    // }

}
