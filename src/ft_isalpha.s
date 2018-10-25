# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isalpha.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/24 10:39:13 by fdexheim          #+#    #+#              #
#    Updated: 2018/10/25 14:48:19 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

	extern _ft_islower
	extern _ft_isupper

section .text
	global _ft_isalpha
	global notalpha

notalpha:
	mv rax, 0
	ret

_ft_isalpha:
	call _ft_islower
	cmp rax, 0		; compare with minimum value of 'a' character
	jne notalpha
	call _ft_isupper
	cmp rax, 0
	jne notalpha
	mv rax, 1
	ret
