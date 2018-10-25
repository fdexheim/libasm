# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_puts.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/25 13:33:28 by fdexheim          #+#    #+#              #
#    Updated: 2018/10/25 15:28:07 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .data
putsstrs:
	.endl db 10
	.len equ $ - putsstrs.endl

section .text
	global _ft_puts
	global putsloop
	global goodputs
	global badputs

goodputs:
	mov rax, 4
	mov rdi, 1
	mov rsi, .endl
	mov rdx, .len
	ret

badputs:
	mov rax, -1
	ret

_ft_puts:
	cmp byte[rdi], 0
	je badputs
	mov rdi, 1
	mov rsi, 1

putsloop:
	cmp byte[rdi], 0
	je goodputs
	mov rax, 4
	mov rdi, 1
	mov rdx, .len
	syscall
	jmp putsloop
