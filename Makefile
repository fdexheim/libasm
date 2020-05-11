# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/10/26 14:02:22 by fdexheim          #+#    #+#              #
#    Updated: 2018/11/15 15:09:21 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME =	libfts.a

SRC_PATH = ./src/
SRC_NAME =	ft_bzero.s ft_cat.s ft_isalnum.s ft_isalpha.s ft_isascii.s \
			ft_isdigit.s ft_islower.s ft_isprint.s ft_isupper.s ft_max.s \
			ft_max_s.s ft_memset.s \
			ft_memcpy.s ft_min.s ft_min_s.s ft_puts.s \
			ft_strcat.s ft_strdup.s ft_strlen.s ft_tolower.s ft_toupper.s \

OBJ_PATH = ./obj/
OBJ_NAME =	$(SRC_NAME:.s=.o)

CC_NASM =	nasm
CC_NASM_FLAGS = -f macho64

SRC = $(addprefix $(SRC_PATH), $(SRC_NAME))
OBJ = $(addprefix $(OBJ_PATH), $(OBJ_NAME))

all:		$(NAME)

test: all
	gcc tests/main.c libfts.a -o maintest

$(OBJ_PATH)%.o: $(SRC_PATH)%.s
	@echo "\033[1;32;m[$@]\033[0m : " | tr -d '\n'
	@mkdir $(OBJ_PATH) 2> /dev/null || echo "" > /dev/null
	$(CC_NASM) $(CC_NASM_FLAGS) $< -o $@

$(NAME): $(OBJ)
	ar rc $(NAME) $(OBJ)
	ranlib $(NAME)
	@echo "\033[1;32;m[Compilation Successful]\033[0m"
	@echo "\033[1;36;m$(NAME)\033[1;32;m ready to go !\033[0m"

clean:
	@echo "\033[0;33;m[Clean]\033[0m              : " | tr -d '\n'
	rm -rf $(OBJ_PATH)
	@rm -f maintest

fclean:		clean
	@echo "\033[0;31;m[Deleting $(NAME)]\033[0m : " | tr -d '\n'
	rm -f $(NAME)

re:			fclean all

.PHONY:		all clean fclean re test
