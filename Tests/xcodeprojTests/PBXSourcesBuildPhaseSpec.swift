import Foundation
import XCTest
import xcodeproj

class PBXSourcesBuildPhaseSpec: XCTestCase {
    
    var subject: PBXSourcesBuildPhase!
    
    override func setUp() {
        super.setUp()
        self.subject = PBXSourcesBuildPhase(reference: "reference", files: ["file"])
    }
    
    func test_init_initializesThePropertiesCorrectly() {
        XCTAssertEqual(subject.reference, "reference")
        XCTAssertEqual(subject.buildActionMask, 2147483647)
        XCTAssertEqual(subject.files, ["file"])
        XCTAssertEqual(subject.runOnlyForDeploymentPostprocessing, 0)
    }
    
    func test_itHasTheCorrectIsa() {
        XCTAssertEqual(PBXSourcesBuildPhase.isa, "PBXSourcesBuildPhase")
    }
    
    func test_equals_returnsTheCorrectValue() {
        let one = PBXSourcesBuildPhase(reference: "refrence", files: ["file"])
        let another =  PBXSourcesBuildPhase(reference: "refrence", files: ["file"])
        XCTAssertEqual(one, another)
    }
    
    func test_hashValue_returnsTheReferenceHashValue() {
        XCTAssertEqual(subject.hashValue, subject.reference.hashValue)
    }
    
    func test_init_failsIfFilesAreMissing() {
        var dictionary = testDictionary()
        dictionary.removeValue(forKey: "files")
        do {
            _ = try PBXSourcesBuildPhase(reference: "reference", dictionary: dictionary)
            XCTAssertTrue(false, "Expected to throw an error but it didn't")
        } catch {}
    }
 
    
    private func testDictionary() -> [String: Any] {
        return [
            "files": ["file"]
        ]
    }
}
