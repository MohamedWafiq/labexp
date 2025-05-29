    AREA DivisionExample, CODE, READONLY
    ENTRY

start
    ; Load decimal values into registers
    MOV     R1, #100        ; Dividend = 100                          ; example immediate load :contentReference[oaicite:3]{index=3}
    MOV     R2, #7          ; Divisor  = 7                             ; immediate load :contentReference[oaicite:4]{index=4}

    ; Perform unsigned division: R3 = R1 / R2
    UDIV    R3, R1, R2      ; Quotient ← Dividend ÷ Divisor           ; UDIV syntax :contentReference[oaicite:5]{index=5}

    ; Compute remainder: R5 = R1 – (R3 × R2)
    MUL     R4, R3, R2      ; R4 ← Quotient × Divisor                  ; long multiply description :contentReference[oaicite:6]{index=6}
    SUB     R5, R1, R4      ; R5 ← Dividend – Product                  ; subtraction :contentReference[oaicite:7]{index=7}

    ; Store quotient and remainder to memory
    LDR     R6, =result     ; Load address of 'result' into R6         ; load literal :contentReference[oaicite:8]{index=8}
    STR     R3, [R6]        ; Store Quotient at result[0]              ; store register :contentReference[oaicite:9]{index=9}
    STR     R5, [R6, #4]    ; Store Remainder at result[1] (offset 4)  ; store with offset :contentReference[oaicite:10]{index=10}

    B       .               ; Infinite loop to end program

    AREA DivisionExampleData, DATA, READWRITE
result  SPACE   8           ; Allocate 8 bytes: 4 for quotient, 4 for remainder

    END
