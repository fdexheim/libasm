# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdexheim <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/10/26 14:02:22 by fdexheim          #+#    #+#              #
#    Updated: 2018/10/24 15:42:15 by fdexheim         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME =	libfts.a

SRC_PATH = ./src/
SRC_NAME =	ft_bzero.s ft_isalpha.s ft_isdigit.s ft_isalnum \

OBJ_PATH = ./obj/
OBJ_NAME =	$(SRC_NAME:.s=.o)

CC_NASM =	nasm
CC_NASM_FLAGS = -f macho64

SRC = $(addprefix $(SRC_PATH), $(SRC_NAME))
OBJ = $(addprefix $(OBJ_PATH), $(OBJ_NAME))

all:		$(NAME)

$(OBJ_PATH)%.o: $(SRC_PATH)%.s
	@echo "\033[1;32;m[$@]\033[0m : " | tr -d '\n'
	@mkdir $(OBJ_PATH) 2> /dev/null || echo "" > /dev/null
	$(CC_NASM) $(CC_NASM_FLAGS) $< -o $@

$(NAME): $(OBJ)
	@$(CC_NASM) $(CC_NASM_FLAGS) -o $@ $(OBJ)
	@echo "\033[1;32;m[Compilation Successful]\033[0m"
	@echo "\033[1;36;m$(NAME)\033[1;32;m ready to go !\033[0m"

clean:
	@echo "\033[0;33;m[Clean]\033[0m              : " | tr -d '\n'
	rm -f $(OBJ)

fclean:		clean
	@echo "\033[0;31;m[Deleting $(NAME)]\033[0m : " | tr -d '\n'
	rm -f $(NAME)
	@rm -rf $(OBJ_PATH)

re:			fclean all

.PHONY:		all clean fclean re test
