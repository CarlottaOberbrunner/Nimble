import XCTest
import Nimble
#if SWIFT_PACKAGE
import NimbleSharedTestHelpers
#endif

final class BeVoidTest: XCTestCase {
    func testBeVoid() {
        expect(()).to(beVoid())
        expect(() as ()?).to(beVoid())
        expect(nil as ()?).toNot(beVoid())

        expect(()) == ()
        expect(() as ()?) == ()
        expect(nil as ()?) != ()

        failsWithErrorMessage("expected to not be void, got <()>") {
            expect(()).toNot(beVoid())
        }

        failsWithErrorMessage("expected to not be void, got <()>") {
            expect(() as ()?).toNot(beVoid())
        }

        failsWithErrorMessage("expected to be void, got <nil>") {
            expect(nil as ()?).to(beVoid())
        }
    }
}
