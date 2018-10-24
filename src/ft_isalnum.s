# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isalnum.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/24 12:40:35 by fdexheim          #+#    #+#              #
#    Updated: 2018/10/24 15:47:33 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
global _ft_isalpha
global _ft_isdigit
global _ft_isalnum

_ft_isalnum:
	mov rsi, 0
;	call isalpha
;	call isdigit
	ret
