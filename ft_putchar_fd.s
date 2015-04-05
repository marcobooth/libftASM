;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_putchar_fd.s                                    :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mbooth <mbooth@student.42.fr>              +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/04/05 19:13:35 by mbooth            #+#    #+#              ;
;    Updated: 2015/04/05 19:14:08 by mbooth           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

%define MACHSYSCALL(nb) 0x2000000 | nb

section .data
	WRITE equ 4

section .text
	global _ft_putchar_fd

_ft_putchar_fd:
	mov r12, rsi
	lea rsi, [rel rdi]
	mov rdi, r12
	mov rdx, 1
	mov rax, MACHSYSCALL(WRITE)
	syscall

exit:
	ret