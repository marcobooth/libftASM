;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_puts.s                                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mbooth <mbooth@student.42.fr>              +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/04/04 12:00:25 by mbooth            #+#    #+#              ;
;    Updated: 2015/04/04 16:04:16 by mbooth           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

%define MACHSYSCALL(nb)  0x2000000 | nb  
	
section .data
	WRITE equ 4
	msg db 0xa
	STD_OUT equ 1
	
section .text
	global _ft_puts

_ft_puts:
	push rdi
	mov rsi, rdi
	mov rdi, STD_OUT
	mov rdx, 0

find_end_s1:
	cmp [rsi], byte 0
	je  write 			
	inc rsi
	inc rdx
	jmp find_end_s1

write:
	pop rsi
	mov rax, MACHSYSCALL(WRITE)
	syscall

printNewLine:
    lea rsi, [rel msg]
	mov rdx, 1
	mov rax, MACHSYSCALL(WRITE)	
	syscall
	mov rax, 1

exit:	
	ret