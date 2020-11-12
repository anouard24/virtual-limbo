; template to write 8086 assembly
; last modified: 09/05/2017
include 'emu8086.inc'
pile segment
    dw 128 dep(0)
ends
; macro

; end macro
data segment
    ; var
ends

code segment
main:
    assume CS:code, DS:data, SS:pile
    mov ax, data
    mov DS, ax
    mov ax, pile
    mov SS, ax
    debut:
        ; code
    fin:
        mov ah, 4Ch
        int 21h
ends
; define

; end define
end main
