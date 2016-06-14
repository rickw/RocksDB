import XCTest
@testable import RocksDB

extension RocksDBTests {
  func testStatistics() {
    do {
      db = nil
      let opts = DBOptions()
      opts.enableStatistics = true

      db = try Database(path: dbPath, options: opts)
      try db.put("foo", value: "bar")
      try db.put("stats", value: "true")

      let stats = opts.getStatistics()
      print(stats)
      XCTAssertNotNil(stats, "Enabled stats should not be nil")
    } catch {
      XCTFail("\(error)")
    }
  }
}