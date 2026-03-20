import Testing
@testable import AnyOptional

struct AnyOptionalTests {
    @Test
    func intSomeReportsPresence() {
        let value: Int? = 42

        #expect(value.isNil == false)
        #expect(value.isSome == true)
    }

    @Test
    func intNoneReportsAbsence() {
        let value: Int? = nil

        #expect(value.isNil == true)
        #expect(value.isSome == false)
    }

    @Test
    func mixedWrappedTypesCanBeHandledThroughTypeErasedProtocol() {
        struct User {
            let id: Int
        }

        let values: [AnyOptional] = [
            Optional(7),
            Optional("hello"),
            Optional(User(id: 1))
        ]

        #expect(values.allSatisfy { $0.isSome })
        #expect(values.contains { $0.isNil } == false)
    }

    @Test
    func customWrappedTypeBehavesTheSameWay() {
        struct User: Equatable {
            let id: Int
        }

        let someValue: User? = User(id: 1)
        let noneValue: User? = nil

        #expect(someValue.isNil == false)
        #expect(someValue.isSome == true)
        #expect(noneValue.isNil == true)
        #expect(noneValue.isSome == false)
    }
}
