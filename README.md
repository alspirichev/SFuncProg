# SFuncProg

## Functional Programming Concepts

  1. Immutability and Side Effects

  The term variable implies a quantity that varies. Thinking of the quantity ***x*** from a mathematical perspective, you’ve essentially introduced ***time*** as a key parameter in how your software behaves. By changing the variable, you create ***mutable state***.
  
 ```
var x = 3
// other stuff...
x = 4
```

  For instance, when two or more threads access the same variable ***concurrently***, they may modify or access it out of order, leading to unexpected behavior. This includes ***race conditions***, ***dead locks*** and many other problems.

  The key benefit of using immutable data is that units of code that use it would be free of side effects, meaning the functions in your code wouldn’t alter elements outside of themselves and no spooky effects would appear when function calls occur.
  
  2. First-Class and Higher-Order Functions

  In FP languages functions are ***first-class*** citizens, meaning that functions are treated just like other objects, and can be assigned to variables.
  Because of this, functions can also accept other functions as parameters, or return other functions. Functions that accept or return other functions are called higher order functions.
  In this section, you'll work with some of the most common higher-order functions in FP languages, namely ***filter***, ***map*** and ***reduce***.
  
  * Filter
  
  In Swift, *filter(_:)* is a method on ***Collection*** types, such as Swift arrays. It accepts another function a parameter. This other function accepts as input a single value from the array, and returns a Bool.
  
  *filter(_:)* applies the input function to each element of the calling array and returns another array that has only the array elements for which the parameter function returns ***true***.
  
  * Map
  
  The ***Collection*** method *map(_:)* also accepts a *single function* as a parameter, and in turn, it produces an array of the same length after being applied to each element of the collection. The return type of the mapped function does not have to be the same type as the collection elements.
  
  * Reduce
  
  The ***Collection*** method *reduce(_:_:)* takes two parameters. The first is a starting value of a ***generic*** type ***Element***, and the second is a function that combines a value of type ***Element*** with an element in the collection to produce another value of type ***Element***.
  
  The input function applies to each element of the calling collection, one-by-one, until it reaches the end of the collection and produces a final accumulated value of type ***Element***.
  
  3. Partial Functions
  
  This concept allows you to encapsulate one function within another, which allows you to define a part of a function while passing another component of it as a parameter.
  
  4. Pure Functions
  
  A function can be considered ***pure*** if it meets two criteria:
  * The function ***always*** produces the same output when given the same input, e.g., the output only depends on its input.
  * The function creates ***zero*** side effects outside of it.
  
  (A pure function's existence is closely tied to the usage of immutable state).
  
  5. Referential Transparency
  
  Pure functions are closely related to the concept of ***referential transparency***. An element of a program is referentially transparent if you can replace it with its definition and always produce the same result. It makes for predictable code and allows the compiler to perform optimizations. Pure functions satisfy this condition.
  
  6. Recursion
  
  The final concept to discuss is ***recursion***, which occurs whenever a function calls *itself* as part of its function body. In functional languages, recursion effectively replaces the looping constructs that are used in imperative languages.
  
  When the function's input leads to the function being called again, this is considered a ***recursive case***. In order to avoid an infinite stack of function calls, recursive functions need a ***base case*** to end them.
  
  # Authors
  * Original post - [An Introduction to Functional Programming in Swift](https://www.raywenderlich.com/157123/introduction-functional-programming-swift-2).
