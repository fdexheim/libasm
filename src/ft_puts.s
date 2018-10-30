# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_puts.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/25 13:33:28 by fdexheim          #+#    #+#              #
#    Updated: 2018/10/30 11:01:12 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .data
	endl: db "",10
	nul: db "(null)",10
	nul_len: equ $-nul

section .text
	global _ft_puts
	global putsloop
	global endline
	global nodgood
	global end

endline:
	mov rax, 4
	mov rdi, 1
	mov rsi, endl
	mov rdx, 1
	syscall
	jmp end

end:
	pop rdx
	pop rsi
	pop rdi
	ret

notgood:
	mov rax, 4
	mov rdi, 1
	mov rsi, nul
	mov rdx, nul_len

_ft_puts:
	push rdi
	push rsi
	push rdx
	mov rdi, 1
	mov rsi, 1

putsloop:
	cmp rdi, 0
	je notgood
	mov rax, 4					;write call
	mov rdi, 1
	mov rdx, 1
	syscall
;	NOT GOOD
	inc rdi
	jmp putsloop
