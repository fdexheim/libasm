# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcat.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/25 11:00:27 by fdexheim          #+#    #+#              #
#    Updated: 2018/10/26 15:53:16 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text

global _ft_strcat
global done
global advance

copy
	mov byte[rdi], byte[rsi]
	inc rdi
	inc rsi
	cmp byte[rsi], 0
	jne copy
	ret

done:
	ret

advance:
	inc rdi
	cmp byte[rdi], 0
	jne advance
	jmp copy

_ft_strcat:
	cmp byte[rdi], 0
	je copy
	jmp advance
