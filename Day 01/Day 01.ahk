input := FileRead("input.txt")
inputArray := StrSplit(input, '`n`n')
elvesInventory := []
for i in inputArray {
    elvesInventory.Push(StrSplit(i, '`n'))
}
elvesInventory.RemoveAt(-1)
for i in elvesInventory {
    LoopIndex := A_Index
    for j in i {
        elvesInventory[LoopIndex][A_Index] := Integer(elvesInventory[LoopIndex][A_Index])
    }
}
most := 0
firstPlace := 0
secondPlace := 0
thirdPlace := 0
Loop 3 {
    for i in elvesInventory {
        total := 0
        LoopIndex := A_Index
        for j in i {
            total := total + j
            if most < total {
                most := total
                indexMost := LoopIndex
            }
        }
    }
    elvesInventory.RemoveAt(indexMost)
    indexMost := 0
    if firstPlace == 0 {
        firstPlace := most
    } else if secondPlace == 0{
        secondPlace := most
    } else {
        thirdPlace := most
    }
    most := 0
}
MsgBox "1st place: " firstPlace "`n2nd place: " secondPlace "`n3rd place: " thirdPlace "`nTotal: " firstPlace + secondPlace + thirdPlace