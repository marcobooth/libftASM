;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_sgn.s                                           :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mbooth <mbooth@student.42.fr>              +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/04/05 19:16:07 by mbooth            #+#    #+#              ;
;    Updated: 2015/04/05 20:02:55 by mbooth           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

section .data
	ONE equ 1
	
section .text
	global _ft_sgn

_ft_sgn:
	xor rax, rax
	mov r12, ONE
	cmp rdi, 0
	je its_zero
	
not_zero:
	cmp rdi, 0
	jg more_than_zero
	jmp less_than_zero

its_zero:	
	ret

more_than_zero:	
	inc rax
	ret

less_than_zero:	
	xor rax, rax
	sub rax, r12
	ret
	