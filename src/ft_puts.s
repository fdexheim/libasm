# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_puts.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/25 13:33:28 by fdexheim          #+#    #+#              #
#    Updated: 2018/11/01 10:13:01 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .data
	endl: db "",10
	nul: db "(null)",10
	nul_len: equ $-nul

section .text
	extern _ft_strlen
	global _ft_puts

notgood:
	mov rax, 4
	mov rdi, 1
	mov rsi, nul
	mov rdx, nul_len
	syscall

endline:
	mov rax, 4
	mov rdi, 1
	mov rsi, endl
	mov rdx, 1
	syscall
	ret

_ft_puts:
	cmp rdi, 0
	mov rdx, rdi
	je notgood
	call _ft_strlen
	mov rdx, rax				; size iin 3rd parameter we got from _ft_strlen
	mov rax, 4					; write call
	mov rdi, 1
	syscall
	jmp endline
