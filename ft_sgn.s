;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_sgn.s                                           :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mbooth <mbooth@student.42.fr>              +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/04/05 19:16:07 by mbooth            #+#    #+#              ;
;    Updated: 2015/04/05 19:29:09 by mbooth           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

section .text:
	global _ft_sgn

_ft_sgn:
	cmp rdi, 0
	je its_zero
	jg more_than_zero
	jl less_than_zero

its_zero:	
	mov rax, 0
	ret

more_than_zero:	
	mov rax, 1
	ret

less_than_zero:	
	mov rax, -1
	ret
	