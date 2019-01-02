/*
 
 For the purpose of this challenge, the N queens problem consists of putting one quwwn on every column (labeled a, b, c, ...) of an NxN chessboard, such that no two queens are in the same row or diagonal. An example of a valid solution for N = 6 is:
 
 6  . . Q . . .
 5  . . . . . Q
 4  . Q . . . .
 3  . . . . Q .
 2  Q . . . . .
 1  . . . Q . .
 
    a b c d e f
 
 In chess notation, the squares with queens in this solution are called a2, b4, c6, d1, e3, and f5. We'll represent solutions by listing the rows that each column's queen appears in from left to right, so that this solution is represented as the array {2, 4, 6, 1, 3, 5}
 
 CHALLENGE:
 
 Given an array of 8 integers between 1 and 8 determine whether it represents a valid 8 queens solution.
 
 EXAMPLES:
 
 qcheck({4, 2, 7, 3, 6, 8, 5, 1}) => true
 qcheck({2, 5, 7, 4, 1, 8, 6, 3}) => true

 qcheck({5, 3, 1, 4, 2, 8, 6, 3}) => false
 
 8  . . . . . Q . .
 7  . . . . . . . .
 6  . . . . . . Q .
 5  Q . . . . . . .
 4  . . . Q . . . .
 3  . Q . . . . . Q -- two in the same row!
 2  . . . . Q . . .
 1  . . Q . . . . .
 
    a b c d e f g h
 
 
 qcheck({5, 8, 2, 4, 7, 1, 3, 6}) => false
 
 8  . Q . . . . . . -- two on the same diagonal
 7  . . . . Q . . .
 6  . . . . . . . Q
 5  Q . . . . . . .
 4  . . . Q . . . .
 3  . . . . . . Q . -- two on the same diagonal
 2  . . Q . . . . .
 1  . . . . . Q . .
 
    a b c d e f g h
 
 
 qcheck({4, 3, 1, 8, 1, 3, 5, 2}) => false
 
 8  . . . Q . . . .
 7  . . . . . . . .
 6  . . . . . . . .
 5  . . . . . . Q . -- two on the same diagonal
 4  Q . . . . . . .
 3  . Q . . . Q . .
 2  . . . . . . . Q
 1  . . Q . Q . . . -- two on the same diagonal
 
    a b c d e f g h
 
 */


func canAttackOtherQueens(fromRow row: Int, atIndex startingIndex: Int, againstOtherRows otherRows: [Int]) -> Bool {
  // We only need to check up and right and down and right since we are traversing rows in left-to-right order
  guard startingIndex != otherRows.count - 1 else { return false } // last column so there's nothing to check
  
  var currentUpRow = row
  var currentDownRow = row
  
  for index in startingIndex + 1...otherRows.count - 1 {
    currentUpRow += 1
    currentDownRow -= 1
    let otherRow = otherRows[index]
    
    if currentUpRow == otherRow || currentDownRow == otherRow || row == otherRow {
      return true
    }
  }
  return false
}


func qCheck(_ potentialSolution: [Int]) -> Bool {
  for (index, row) in potentialSolution.enumerated() {
    guard !canAttackOtherQueens(fromRow: row, atIndex: index, againstOtherRows: potentialSolution) else {
      return false
    }
  }
  return true
}

// True test cases!
qCheck([4, 2, 7, 3, 6, 8, 5, 1])
qCheck([2, 5, 7, 4, 1, 8, 6, 3])

// False test cases!
qCheck([5, 3, 1, 4, 2, 8, 6, 3])
qCheck([5, 8, 2, 4, 7, 1, 3, 6])
qCheck([4, 3, 1, 8, 1, 3, 5, 2])

// 6x6 test case!
qCheck([2, 4, 6, 1, 3, 5])
