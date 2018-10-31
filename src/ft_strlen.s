# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/30 09:55:01 by fdexheim          #+#    #+#              #
#    Updated: 2018/10/31 15:33:38 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_strlen

_ft_strlen:
	push rbx
	push rcx

	mov rbx, rdi
	xor al, al
	mov rcx, 1
	repne scasb
	sub rdi, rbx
	mov rax, rdi

	pop rbx
	pop rcx
	ret
