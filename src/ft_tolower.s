# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_tolower.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/25 10:20:10 by fdexheim          #+#    #+#              #
#    Updated: 2018/10/25 10:42:53 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
extern _ft_isupper
global _ft_tolower
global notolower

notolower:
	mv rax rdi
	ret

_ft_tolower:
	call _ft_isupper
	cmp rax, 0
	je notolower
	mv rax rdi
	add rax 0x20
	ret
