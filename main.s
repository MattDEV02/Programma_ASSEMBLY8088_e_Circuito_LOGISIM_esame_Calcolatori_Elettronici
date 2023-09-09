! Calcola la lunghezza di una stringa e il numero di occorrenze di un certo carattere presente in essa.

_EXIT = 1
_PRINTF = 127

.SECT .TEXT
   main:
      MOV  SP, BP
      MOV  AX, end
      PUSH stringa
      CALL LUNGHEZZASTRINGA
      MOV  SP, BP
      PUSH (occorrenze)
      PUSH stringa
      CALL CONTAOCCORRENZE
      MOV  SP, BP
      PUSH DX     ! contiene il valore intero di occorrenze nella stringa.
      PUSH BX     ! contiene la lunghezza della stringa.
      PUSH format
      PUSH _PRINTF
      SYS
      MOV  SP, BP
      PUSH 0
      PUSH _EXIT
      SYS
      MOV  SP, BP

LUNGHEZZASTRINGA:
   PUSH BP
   MOV  BP, SP
   MOV  BX, 4(BP) !  stringa 
   SUB  AX, BX    !  lunghezza stringa
   MOV  CX, AX
   MOV  BX, CX    ! NON necessario
   MOV  SP, BP
   POP  BP
   RET

CONTAOCCORRENZE:
   PUSH BP
   MOV  BP, SP
   MOV  DI, 4(BP)  ! stringa
   MOVB AL, 6(BP)  ! carattere (un byte)
   MOV  DX, 0
   1:   SCASB      ! CMP DI, AL
   JNE 2f
   INC DX          
   2:   LOOP 1b
   MOV SP, BP
   POP  BP
   RET
.SECT .DATA
   stringa:        .ASCII "ociaoo.o0"
   end:            .SPACE 1
   occorrenze:     .ASCII "o" 
   format:         .ASCII "\n Stringa di Lunghezza = %d ==> Occorrenze = %d.\n"
.SECT .BSS
