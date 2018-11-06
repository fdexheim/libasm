# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_puts.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/25 13:33:28 by fdexheim          #+#    #+#              #
#    Updated: 2018/11/06 12:01:12 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .data
	endl: db "",10
	nulll: db "(null)",10
	nul_len: equ $-nulll

section .text
	extern _ft_strlen
	global _ft_puts

notgood:
	mov rax, 4
	mov rdi, 1
	mov rsi, nulll
	mov rdx, nul_len
	syscall
	mov rax, 0					; not sure about that return value tho...
	jmp end

endline:
	mov rax, 4
	mov rdi, 1
	mov rsi, endl
	mov rdx, 1
	syscall

end:
	pop rdx
	pop rsi
	pop rdi
	mov rax, rdi
	ret

_ft_puts:
	push rdi
	push rsi
	push rdx
	cmp rdi, 0
	je notgood
	call _ft_strlen
	mov rsi, rdi
	mov rdx, rax				; size in 3rd parameter we got from _ft_strlen
	mov rax, 4					; write call
	mov rdi, 1
	syscall
	jmp endline
