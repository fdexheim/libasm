# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcat.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/10/25 11:00:27 by fdexheim          #+#    #+#              #
#    Updated: 2018/10/25 13:08:46 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text

global _ft_strcat

ft_strcat:
	mov rax rdi
	mov 