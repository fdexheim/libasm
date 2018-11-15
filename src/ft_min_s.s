# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_min_s.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/11/08 11:13:20 by fdexheim          #+#    #+#              #
#    Updated: 2018/11/15 15:23:00 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _ft_min_s

section .text

otherone:
	mov rax, rsi
	ret

_ft_min_s:
	mov rax, rdi
	cmp rdi, rsi
	jg otherone
	ret
