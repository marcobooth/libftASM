;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_cat.s                                           :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: tsilva <tsilva@student.42.fr>              +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/04/05 16:13:19 by tsilva            #+#    #+#              ;
;    Updated: 2015/04/05 16:13:20 by tsilva           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

%define MACHSYSCALL(nb) 0x2000000 | nb

section .data
	READ equ 3
	CLOSE equ 6
	EXIT equ 1
	SIZE equ 1024

section .bss
	BUFFER lcomm SIZE 			;non_initialized variables. buffer[1024]

_ft_cat:
	
read:
	push rdi					;storing fd
	mov rsi, BUFFER				;set buffer
	mov rdx, SIZE
	mov rax, MACHSYSCALL(READ)
	syscall						;read(fd, buf, bufsize)
	cmp rax, 0					
	jle close					;if eof or error

display:
	pop rdi						;get fd for write
	mov rax, MACHSYSCALL(WRITE)
	syscall						;write(fd, buf[full], bufsize)
	jmp read

close:
	pop rdi						;get fd for close
	cmp rax, 0
	je well_closed
	jmp badly_closed

well_closed:
	mov rax, MACHSYSCALL(CLOSE)	;close(int fd)
	syscall
	cmp rax, 0
	je exit
	
badly_closed:
	mov rdi, 42					;error in read

exit:
	mov rax, MACHSYSCALL(EXIT)
	syscall
	ret
