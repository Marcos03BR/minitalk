# Nombres de los ejecutables
NAME_SERVER = server
NAME_CLIENT = client

# Compilador y flags
CC = gcc
CFLAGS = -Wall -Wextra -Werror -no-pie

# Directorio de la libft
LIBFT_DIR = libft
LIBFT = $(LIBFT_DIR)/libft.a
INCLUDES = -I$(LIBFT_DIR)

# Directorio de los archivos fuente (ajusta si es necesario)
SRC_DIR = src

# Archivos fuente de server y client
SRCS_SERVER = $(SRC_DIR)/server.c
SRCS_CLIENT = $(SRC_DIR)/client.c

# Regla principal que compila todo
all: $(LIBFT) $(NAME_SERVER) $(NAME_CLIENT)

# Compilación de la libft
$(LIBFT):
	@$(MAKE) -C $(LIBFT_DIR)

# Compilar server y enlazar con libft
$(NAME_SERVER): $(SRCS_SERVER) $(LIBFT)
	$(CC) $(CFLAGS) $(INCLUDES) -o $(NAME_SERVER) $(SRCS_SERVER) $(LIBFT)

# Compilar client y enlazar con libft
$(NAME_CLIENT): $(SRCS_CLIENT) $(LIBFT)
	$(CC) $(CFLAGS) $(INCLUDES) -o $(NAME_CLIENT) $(SRCS_CLIENT) $(LIBFT)

# Limpiar los archivos objeto de libft
clean:
	@$(MAKE) -C $(LIBFT_DIR) clean

# Limpiar todo
fclean: clean
	rm -f $(NAME_SERVER) $(NAME_CLIENT)
	@$(MAKE) -C $(LIBFT_DIR) fclean

# Recompilar todo desde cero
re: fclean all

# Declarar las reglas que no son archivos
.PHONY: all clean fclean re
