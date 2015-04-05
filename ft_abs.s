;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_abs.s                                           :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mbooth <mbooth@student.42.fr>              +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/04/05 19:29:35 by mbooth            #+#    #+#              ;
;    Updated: 2015/04/05 19:33:26 by mbooth           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

section	.text
	global _ft_abs

_ft_abs:
	cmp rdi, 0
	jge positive
	jmp negative

positive:
	mov rax, rdi
	ret

negative:	
	mov rax, rdi
	mul -1
	ret
	
	