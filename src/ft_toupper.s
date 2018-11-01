# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_toupper.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/25 09:52:03 by fdexheim          #+#    #+#              #
#    Updated: 2018/11/01 10:22:43 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	extern _ft_islower
	global _ft_toupper

nope:
	mov rax, rdi
	ret

_ft_toupper:
	call _ft_islower
	cmp rax, 0
	je nope
	mov rax, rdi
	sub rax, 0x20
	ret
