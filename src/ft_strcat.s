# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcat.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/25 11:00:27 by fdexheim          #+#    #+#              #
#    Updated: 2018/11/06 09:59:02 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_strcat

addend:
	mov byte[rdi], 0
	jmp end

copy:
	cmp byte[rsi], 0
	je addend
	mov al, byte[rsi]
	mov byte[rdi], al
	inc rdi
	inc rsi
	jmp copy

advance:
	cmp byte[rdi], 0
	je copy
	inc rdi
	jmp advance

end:
	pop rsi
	pop rdi
	mov rax, rdi
	ret

_ft_strcat:
	push rdi
	push rsi
	cmp byte[rsi], 0
	je end
	jmp advance
