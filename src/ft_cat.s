# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_cat.s                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/11/05 11:48:09 by fdexheim          #+#    #+#              #
#    Updated: 2018/11/08 10:21:33 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

%define BUFFSIZE						1024
%define MACH_SYSCALL(nb)				0x2000000 | nb
%define READ							3
%define WRITE							4
%define	STDOUT							1

extern _ft_puts
global _ft_cat

section .bss
	bufferino resb BUFFSIZE

section .text
	global _ft_cat

_ft_cat:
	lea rsi, [rel bufferino]
	jmp end								; REMOVE DIS WHEN YA DONE
	jmp loop

loop:

	mov rax, MACH_SYSCALL(READ)			; rdi should already be at the right place
	lea rsi, [rel bufferino]
	mov rdx, BUFFSIZE
	syscall

	push rax

	mov rdx, rax						; length returned by read in write parameter
	mov rax, MACH_SYSCALL(WRITE)
	mov rdi, STDOUT
	lea rsi, [rel bufferino]
	
	pop rax
	cmp rax, 0
	jg loop								; brother may i have some loops

end:
	ret
