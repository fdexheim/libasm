# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_puts.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/25 13:33:28 by fdexheim          #+#    #+#              #
#    Updated: 2018/10/26 15:30:38 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .data
	endl: db "",10
	end_len: dw 1
	nul: db "(null)"
	nul_len: equ $-nul

section .text
	global _ft_puts
	global putsloop
	global endline

endline:
	mov rax, 4
	mov rdi, 1
	mov rsi, endl
	mov rdx, end_len
	syscall
	ret

_ft_puts:
	NOT GOOD
	mov rdi, 1
	mov rsi, 1

putsloop:
	cmp byte[rdi], 0
	je endline
	mov rax, 4					;write call
	mov rdi, 1
	mov rdx, 1
	syscall
	NOT GOOD
	inc rdi
	jmp putsloop
