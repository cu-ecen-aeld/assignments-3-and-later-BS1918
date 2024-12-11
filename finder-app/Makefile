writer: writer.c
	gcc writer.c -o writer
	@echo "compiled writer.c\n"
CROSS_COMPILE: writer.c
	aarch64-none-linux-gnu-gcc writer.c -o writer_aarch64
	@echo "cross compiling \n"	
	
clean_CROSS_COMPILE: 
	rm writer_aarch64 
clean: 
	rm writer
	@echo "cleaning \n"
