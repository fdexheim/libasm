# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_puts.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/25 13:33:28 by fdexheim          #+#    #+#              #
#    Updated: 2018/11/09 13:35:53 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

%define MACH_SYSCALL(nb)				0x2000000 | nb
%define WRITE							4
%define	STDOUT							1

section .data
	endl: db "",10
	nulll: db "(null)",10
	nul_len: equ $-nulll

section .text
	extern _ft_strlen
	global _ft_puts

nullstr:
	mov rax, MACH_SYSCALL(WRITE)
	mov rdi, STDOUT
	lea rsi, [rel nulll]
	mov rdx, nul_len
	syscall
	mov rax, 0							; not sure about that return value tho...
	jmp end

endline:
	mov rax, MACH_SYSCALL(WRITE)
	mov rdi, STDOUT
	lea rsi, [rel endl]
	mov rdx, 1
	syscall

end:
	pop rdx
	pop rsi
	pop rdi
	ret

_ft_puts:
	push rdi
	push rsi
	push rdx
	cmp rdi, 0
	je nullstr
	call _ft_strlen
	cmp rax, 0
	je endline
	mov rsi, rdi
	mov rdx, rax						; size in 3rd parameter we got from _ft_strlen
	mov rax, MACH_SYSCALL(WRITE)		; write call
	mov rdi, STDOUT
	syscall
	jmp endline
