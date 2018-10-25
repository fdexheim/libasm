# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isalnum.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/24 12:40:35 by fdexheim          #+#    #+#              #
#    Updated: 2018/10/25 15:00:34 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

extern _ft_isalpha
extern _ft_isdigit

section .text
	global _ft_isalnum
	global yes

_ft_isalnum:
	mov rax, 0
	call _ft_isalpha
	cmp rax, 0
	jne yes
	call _ft_isdigit
	cmp rax, 0
	jne yes
	ret

yes:
	ret
