//
//  NarouAPITests.swift
//  NarouAPITests
//
//  Created by tosaka on 2019/12/31.
//  Copyright © 2019 tosaka.net. All rights reserved.
//

import XCTest
@testable import NarouAPI

class NarouAPITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testRankType() {
        let test1 = "20200101-d"
        XCTAssertNoThrow(try RankingType(rankString: test1))
    }
    
    func testDecodeRanks() {
        let json = """
        [{"pt":129,"rank":221,"rtype":"20191227-d"},{"pt":374,"rank":61,"rtype":"20191228-d"},{"pt":1128,"rank":15,"rtype":"20191229-d"},{"pt":3157,"rank":2,"rtype":"20191230-d"},{"pt":7204,"rank":1,"rtype":"20191231-d"},{"pt":12062,"rank":6,"rtype":"20191231-w"},{"pt":6165,"rank":1,"rtype":"20200101-d"},{"pt":18732,"rank":23,"rtype":"20200101-m"},{"pt":18978,"rank":103,"rtype":"20200101-q"},{"pt":5503,"rank":1,"rtype":"20200102-d"},{"pt":5675,"rank":1,"rtype":"20200103-d"},{"pt":6488,"rank":1,"rtype":"20200104-d"},{"pt":6338,"rank":1,"rtype":"20200105-d"},{"pt":6093,"rank":1,"rtype":"20200106-d"},{"pt":5017,"rank":1,"rtype":"20200107-d"},{"pt":41019,"rank":1,"rtype":"20200107-w"},{"pt":4777,"rank":1,"rtype":"20200108-d"},{"pt":4438,"rank":1,"rtype":"20200109-d"},{"pt":4176,"rank":1,"rtype":"20200110-d"},{"pt":4127,"rank":2,"rtype":"20200111-d"},{"pt":4497,"rank":2,"rtype":"20200112-d"},{"pt":5071,"rank":2,"rtype":"20200113-d"},{"pt":5059,"rank":1,"rtype":"20200114-d"},{"pt":31936,"rank":1,"rtype":"20200114-w"}]
        """
        let decoder = JSONDecoder()
        XCTAssertNoThrow(try decoder.decode(RankResponse.self, from: json.data(using: .utf8)!))
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
