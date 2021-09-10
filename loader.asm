bits 16
org 0x7C00

boot:
	xor ax, ax
	mov ds, ax
	mov es, ax
	
.reset:
	mov ah, 0	;сброс дисковой системы
	int 0x13
	jc .reset	;CF выставляется в случае возникновения ошибок

;ES:BX - адрес буфера данных в памяти (область памяти для размещения
;информации из считываемых секторов)

	mov ax, 0x7E00	;адрес для считываения сектора 0xE00:0
	mov es, ax 	;ES - extra segment
	xor bx, bx

.read_disk:
	mov ah, 0x02	; Чтение секторов диска
	mov al, 0x05	; Число считываемых секторов
	mov cx, 0x0002	; номер цилиндра (старше 10 бит) и номер сектора (младше 6 бит)
	mov dh, 0x00	; номер головки
	mov dl, 0x00 	; номер диска 0-1 - гибкий 80h-83h - жесткий
	int 0x13

	jnc success
	mov si, fail
	call print

	jmp .read_disk

print:
	pusha
	
	lodsb
	or al, al
	jz print_done	;если строка напечатана, перейти к метке
	mov ah, 0x0E
	int 0x10
	jmp print

print_done:
	popa
	ret

fail: db "ERROR", 0
back: db "Come Back.", 0
success:
	jmp 0x7E00:0x00	;переход ко второму сектору
times 510 - ($-$$) db 0
dw 0xAA55
