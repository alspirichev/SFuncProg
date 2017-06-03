import Foundation

enum RideCategory: String {
  case family
  case kids
  case thrill
  case scary
  case relaxing
  case water
}

typealias Minutes = Double
struct Ride {
  let name: String
  let categories: Set<RideCategory>
  let waitTime: Minutes
}

extension Ride: CustomStringConvertible {
  var description: String {
    return "⚡️Ride(name: \"\(name)\", waitTime: \(waitTime), categories: \(categories))"
  }
}

extension RideCategory: CustomStringConvertible {
  var description: String {
    return rawValue
  }
}

let parkRides = [
  Ride(name: "Raging Rapids", categories: [.family, .thrill, .water], waitTime: 45.0),
  Ride(name: "Crazy Funhouse", categories: [.family], waitTime: 10.0),
  Ride(name: "Spinning Tea Cups", categories: [.kids], waitTime: 15.0),
  Ride(name: "Spooky Hollow", categories: [.scary], waitTime: 30.0),
  Ride(name: "Thunder Coaster", categories: [.family, .thrill], waitTime: 60.0),
  Ride(name: "Grand Carousel", categories: [.family, .kids], waitTime: 15.0),
  Ride(name: "Bumper Boats", categories: [.family, .water], waitTime: 25.0),
  Ride(name: "Mountain Railroad", categories: [.family, .relaxing], waitTime: 0.0)
]

func waitTimeIsShort(ride: Ride) -> Bool {
  return ride.waitTime < 15.0
}


/* First-Class and Higher-Order Functions */

// Filter

var shortWaitTimeRides = parkRides.filter(waitTimeIsShort)
print(shortWaitTimeRides)

// Map

func sortedNames(of rides: [Ride]) -> [String] {
  let rideNames = rides.map { $0.name }
  return rideNames.sorted(by: <)
}

//print(sortedNames(of: parkRides))

let riders = [
  Ride(name: "d d", categories: [.scary], waitTime: 30.0),
  Ride(name: "a a", categories: [.family, .thrill, .water], waitTime: 45.0),
  Ride(name: "c c c", categories: [.kids], waitTime: 15.0),
  Ride(name: "b b", categories: [.family], waitTime: 10.0)
]

//print(sortedNames(of: parkRides))


// Reduce

let totalWaitTime = parkRides.reduce(0.0) { (total, ride) in total + ride.waitTime }
//print(totalWaitTime)

/* Partial Functions */

func filter(for category: RideCategory) -> ([Ride]) -> [Ride] {
  return { (rides: [Ride]) in
    rides.filter { $0.categories.contains(category) }
  }
}

let kidRideFilter = filter(for: .kids)
//print(kidRideFilter(parkRides))

/* Pure Functions */

func ridesWithWaitTimeUnder(_ waitTime: Minutes, from rides: [Ride]) -> [Ride] {
  return rides.filter { $0.waitTime < waitTime }
}

// With a pure function, it's easy to write a good unit test against the function. 

var shortWaitRides = ridesWithWaitTimeUnder(15, from: parkRides)
assert(shortWaitRides.count == 2, "Count of short wait rides should be 2")
//print(shortWaitRides)


/* Referential Transparency */

shortWaitRides = parkRides.filter { $0.waitTime < 15 }
assert(shortWaitRides.count == 2, "Count of short wait rides should be 2")
//print(shortWaitRides)

/* Recursion */

extension Ride: Comparable {
  static func <(lhs: Ride, rhs: Ride) -> Bool {
    return lhs.waitTime < rhs.waitTime
  }

  static func ==(lhs: Ride, rhs: Ride) -> Bool {
    return lhs.name == rhs.name
  }
}

extension Array where Element: Comparable {
  func quickSorted() -> [Element] {
    if self.count > 1 {
      let (pivot, remaining) = (self[0], dropFirst())
      let lhs = remaining.filter { $0 <= pivot }
      let rhs = remaining.filter { $0 > pivot }
      return lhs.quickSorted() as [Element] + [pivot] + rhs.quickSorted()
    }
    return self
  }
}

//print(parkRides.quickSorted())
//print(parkRides)

var ridesOfInterest: [Ride] = []
for ride in parkRides where ride.waitTime < 20 {
  for category in ride.categories where category == .family {
    ridesOfInterest.append(ride)
    break
  }
}

/* Imperative Approach */
var sortedRidesOfInterest1 = ridesOfInterest.quickSorted()
//print(sortedRidesOfInterest1)

/* Functional Approach */
let sortedRidesOfInterest2 = parkRides.filter { $0.categories.contains(.family) && $0.waitTime < 20 }.sorted(by: <)
//print(sortedRidesOfInterest2)
