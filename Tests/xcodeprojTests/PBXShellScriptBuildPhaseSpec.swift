import Foundation
import XCTest
import xcodeproj

final class PBXShellScriptBuildPhaseSpec: XCTestCase {
    
    var subject: PBXShellScriptBuildPhase!
    
    override func setUp() {
        super.setUp()
        self.subject = PBXShellScriptBuildPhase(reference: "reference", files: ["file"], name: "name", inputPaths: ["input"], outputPaths: ["output"], shellPath: "shell", shellScript: "script")
    }

    func test_init_initializesTheBuildPhaseWithTheCorrectValues() {
        XCTAssertEqual(subject.reference, "reference")
        XCTAssertEqual(subject.files, ["file"])
        XCTAssertEqual(subject.name, "name")
        XCTAssertEqual(subject.inputPaths, ["input"])
        XCTAssertEqual(subject.outputPaths, ["output"])
        XCTAssertEqual(subject.shellPath, "shell")
        XCTAssertEqual(subject.shellScript, "script")
    }
    
    func test_returnsTheCorrectIsa() {
        XCTAssertEqual(PBXShellScriptBuildPhase.isa, "PBXShellScriptBuildPhase")
    }
    
    func test_initFails_whenTheFilesAreMissing() {
        var dictionary = testDictionary()
        dictionary.removeValue(forKey: "files")
        do {
            _ = try PBXShellScriptBuildPhase(reference: "reference", dictionary: dictionary)
            XCTAssertTrue(false, "Expected to throw an error but it didnt'")
        } catch {}
    }
    
    func test_initFails_whenShellPathIsMissing() {
        var dictionary = testDictionary()
        dictionary.removeValue(forKey: "shellPath")
        do {
            _ = try PBXShellScriptBuildPhase(reference: "reference", dictionary: dictionary)
            XCTAssertTrue(false, "Expected to throw an error but it didnt'")
        } catch {}
    }
    
    func test_initFails_whenNameIsMissing() {
        var dictionary = testDictionary()
        dictionary.removeValue(forKey: "name")
        do {
            _ = try PBXShellScriptBuildPhase(reference: "name", dictionary: dictionary)
            XCTAssertTrue(false, "Expected to throw an error but it didnt'")
        } catch {}
    }
    
    func test_equals_returnsTheCorrectValue() {
        let one = PBXShellScriptBuildPhase(reference: "reference", files: ["file"], name: "name", inputPaths: ["input"], outputPaths: ["output"], shellPath: "shell", shellScript: "script")
        let another = PBXShellScriptBuildPhase(reference: "reference", files: ["file"], name: "name", inputPaths: ["input"], outputPaths: ["output"], shellPath: "shell", shellScript: "script")
        XCTAssertEqual(one, another)
    }
    
    func test_hashValue_returnsTheReferenceHashValue() {
        XCTAssertEqual(subject.hashValue, subject.reference.hashValue)
    }
    
    private func testDictionary() -> [String: Any] {
        return [
            "files": ["files"],
            "inputPaths": ["input"],
            "outputPaths": ["output"],
            "shellPath": "shellPath",
            "shellScript": "shellScript"
        ]
    }
}
