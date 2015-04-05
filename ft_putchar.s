;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_putchar.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mbooth <mbooth@student.42.fr>              +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/04/05 19:09:45 by mbooth            #+#    #+#              ;
;    Updated: 2015/04/05 19:12:32 by mbooth           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

%define MACHSYSCALL(nb) 0x2000000 | nb

section .data
	WRITE equ 4
	STD_OUT equ 1

section .text
	global _ft_putchar

_ft_putchar:
	lea rsi, [rel rdi]
	mov rdi, STD_OUT
	mov rdx, 1
	mov rax, MACHSYSCALL(WRITE)
	syscall

exit:
	ret