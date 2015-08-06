all: example tron screengrab

OBJS = hexxx.o ledstring.o color.o buttons.o coordinates.o
LIBS = ws2811/libws2811.a gpio/gpio.a -lX11
CPPFLAGS = -std=c++0x -O2

example: example.o $(OBJS)
	g++ $(CPPFLAGS) -o example example.o $(OBJS) $(LIBS) -pthread

tron: tron.o $(OBJS)
	g++ $(CPPFLAGS) -o tron tron.o $(OBJS) $(LIBS) -pthread

screengrab: screengrab.o $(OBJS)
	g++ $(CPPFLAGS) -o screengrab screengrab.o $(OBJS) $(LIBS) -pthread

clean:
	@rm -vf *.o *.a hexxx

distclean: clean
	make clean -C ws2811
