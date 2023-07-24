_EXIT = 1
_PRINTF = 127
.SECT .TEXT
start:
MOV CX,end-vec
SHR CX, 1 !in CX va la dimensione di vec
MOV BX,vec 
MOV AX, (num) 
1: CMP (BX)(SI), AX
JL 2f 
ADD SI,2
LOOP 1b
JMP 3f
2: MOV DX, 1
3: MOV DX, 0
PUSH DX
PUSH (num)
PUSH format
PUSH _PRINTF
SYS
MOV SP,BP
PUSH 0
PUSH _EXIT
SYS
.SECT .DATA
vec: .WORD 3, 4, 1, 11, 3
end: .SPACE 1
num: .WORD 2
format: .ASCII "%d %d"
.SECT .BSS