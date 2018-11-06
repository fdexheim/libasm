# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/30 09:55:01 by fdexheim          #+#    #+#              #
#    Updated: 2018/11/06 10:07:24 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_strlen

_ft_strlen:
	push rbx
	push rcx
	push rdi

	mov rbx, rdi
	xor rax, rax
	xor al, al
	mov rcx, 0xffffffff
	repne scasb
	sub rdi, rbx
	sub rdi, 1
	mov rax, rdi

	pop rdi
	pop rcx
	pop rbx
	ret
