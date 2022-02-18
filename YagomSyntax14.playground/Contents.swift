import Cocoa

// enum 열거형

// 정의

// enum은 타입이므로 대문자 카멜케이스를 사용하여 이름을 정의한다.
// 각 case는 소문자 카멜케이스로 정의한다.
// 각 case는 그 자체가 고유의 값이다.

// enum 이름 {
// case1 이름1
// case2 이름2
// case3 이름3, 이름4, 이름5
// ...
// }




// 열거형 사용

enum Weekday {
    case mon
    case tue
    case wed
    case thu, fri, sat, sun // 이렇게 원하는 만큼 열거도 가능.
}

var day: Weekday =  Weekday.mon // day의 타입이 Weekday.
day = .tue

print(day)

switch day {
case .mon, .tue, .wed, .thu:
    print("평일.")
case Weekday.fri:
    print("불금.")
case .sat, .sun:
    print("주말")
}
// 이 중에 하나라도 case를 빼먹으면 default값 설정해야 한다.
// 평일.




// 원시값

// C 언어의 enum처럼 정수값을 가질 수도 있다.
// rawValue를 사용하면 된다.
// case 별로 각각 다른 값을 가져야 한다.

enum Fruit: Int {
    case apple = 0
    case grape = 1
    case peach
// case mango = 0
}

print("Fruit.peach.rawValue == \(Fruit.peach.rawValue)")
// Fruit.peach.rawValue == 2

// 정수 타입 뿐만 아니라
// Hashable 프로토콜을 따르는 모든 타입이 원시값의 타입으로 지정될 수 있다.

enum School: String {
    case elementary = "초등"
    case middle = "중등"
    case high = "고등"
    case university
}

print("School.middle.rawValue == \(School.middle.rawValue)")
// School.middle.rawValue == "중등"

print("School.university.rawValue == \(School.university.rawValue)")
// School.university.rawValue == university
// enum의 case가 정수형인 경우는 0,1,2,3,.... 으로 나오기 쉽지만, 문자형인 경우 case 이름을 rawValue로 갖는다.




// 원시값을 통한 초기화

// rawValue를 통해 초기화 할 수 있다.
// rawValue가 case에 해당하지 않을 수 있으므로
// rawValue를 통해 초기화 한 인스턴스는 옵셔널 타입이다.

// let apple: Fruit = Fruit(rawValue: 0)
// 아까 위에서는 0,1,2 까지만 있어서
let apple: Fruit? = Fruit(rawValue: 0)
// 값이 없을 수도 있기 때문에 옵셔널 타입으로 정의한다.

if let orange: Fruit = Fruit(rawValue: 5) {
    print("rawValue 5에 해당하는 case는 \(orange)이다.")
} else {
    print("rawValue 5에 해당하는 case는 없다.")
}
// 공부했던 if let으로 옵셔널 값을 꺼낸다.
// rawValue 5에 해당하는 case는 없다.





// 메소드

enum Month {
    case dec, jan, feb
    case mar, apr, may
    case jun, jul, aug
    case sep, oct, nov
    
    func printMessage() {
        switch self {
        case .mar, .apr, .may:
            print("봄")
        case .jun, .jul, .aug:
            print("여름")
        case .sep, .oct, .nov:
            print("가을")
        case .dec, .jan, .feb:
            print("겨울")
        }
    }
}

Month.mar.printMessage()
// 봄
