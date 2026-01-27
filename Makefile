# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dedantas <dedantas@student.42porto.com>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/04/23 19:19:44 by dedantas          #+#    #+#              #
#    Updated: 2025/04/27 16:40:03 by dedantas         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

MAKEFLAGS += --silent

# Nome da biblioteca
NAME = libft.a

# Comandos
CC = cc
CFLAGS = -Wall -Wextra -Werror -g
AR = ar -rcs
RM = rm -f

# Folders
INCLUDE_DIR	= include
SRC_DIR		= src
BUILD_DIR	= build

# Busca automática de fontes
SRCS = $(shell find $(SRC_DIR) -type f -name "*.c")

# Objetos
OBJS = $(SRCS:$(SRC_DIR)/%.c=$(BUILD_DIR)/%.o)

# Regra padrão
all: $(NAME)

# Regra de compilação implícita correta
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -I$(INCLUDE_DIR) -c $< -o $@

# Construção da biblioteca
$(NAME): ${OBJS}
	${AR} $(NAME) $(OBJS)
	echo Compiled
# Limpeza
clean:
	rm -rf $(BUILD_DIR)
	echo Build files cleaned!

fclean: clean
	$(RM) $(NAME)
	echo Binaries cleaned!

re: fclean all

.PHONY: all bonus clean fclean re
