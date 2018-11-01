# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcat.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/25 11:00:27 by fdexheim          #+#    #+#              #
#    Updated: 2018/11/01 10:11:48 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_strcat

copy:
	mov al, byte[rsi]
	mov byte[rdi], al
	inc rdi
	inc rsi
	cmp byte[rsi], 0
	jne copy
	jmp end

advance:
	inc rdi
	cmp byte[rdi], 0
	jne advance
	jmp copy

end:
	pop rsi
	pop rdi
	ret

_ft_strcat:
	push rdi
	push rsi
	mov rax, rdi
	cmp byte[rsi], 0
	je end
	cmp byte[rdi], 0
	je copy
	jmp advance
