./lib/stb_image.so: ./src/stb_image.h ./src/stb_image.c
	gcc -shared src/stb_image.c -o ./lib/stb_image.so -fPIC -g
