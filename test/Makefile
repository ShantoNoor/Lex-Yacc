FILE_BASE_NAME = t
INPUT_FILE_NAME = in

alli: run_yacc run_lex run_gcc run_with_input
all: run_yacc run_lex run_gcc run


run_yacc: $(FILE_BASE_NAME).y
	yacc -d $(FILE_BASE_NAME).y

run_lex: $(FILE_BASE_NAME).l
	flex $(FILE_BASE_NAME).l

run_gcc: lex.yy.c y.tab.c
	gcc lex.yy.c y.tab.c -lfl -w

run: a.out
	./a.out

run_with_input: a.out INPUT_FILE_NAME
	./a.out < $(INPUT_FILE_NAME)