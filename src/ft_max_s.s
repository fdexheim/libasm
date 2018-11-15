# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_max_s.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/11/08 11:12:40 by fdexheim          #+#    #+#              #
#    Updated: 2018/11/15 15:23:06 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _ft_max_s

section .text

otherone:
	mov rax, rsi
	ret

_ft_max_s:
	mov rax, rdi
	cmp rdi, rsi
	jl otherone
	ret
