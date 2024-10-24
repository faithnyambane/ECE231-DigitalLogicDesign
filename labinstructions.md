# Lab Instructions

## All Labs are located in

[Labs 1-6](https://github.com/RU-ECE/ECE231-DigitalLogicDesign/tree/main/labs)

## Grading

* Pre-lab:       20% (except first lab)
* Lab:           45% (TA checks off that you did the work)
* Clean Station:  5% (TA checks that your station has not been left in a bad state)
* Post lab:      30%

Each lab has a pre-lab report. It is due before you arrive in lab. It will be collected electronically (on canvas).

Please read the lab in advance, and prepare by learning whatever material you need.

If you intend to use your own computer for verilog programming, then you have been told for weeks to install icarus verilog (compact, and works on Mac) or Xilinx (the industry leader, and you should eventually learn this regardless)

## Verilog

For coding in verilog, you are allowed to use Icarus verilog (a command line tool) which works in Windows, Mac OSX, and Linux. It has a corresponding tool for graphing timings called gtkwave which also works on all 3 platforms.

[Icarus Verilog for Windows](https://bleyer.org/icarus/)
[Icarus Verilog for MacOSX (requires brew)] (https://formulae.brew.sh/formula/icarus-verilog)

Once you have installed them, you have to add the commands to the PATH in your computer. Assuming that is done, here are the commands needed:

```verilog
`timescale 1ns/1ps
module simplefunc_tb;
  reg a, b;
  initial begin
  // the first two lines must be this!
     $dumpfile ("simplefunc_tb.vcd");
     $dumpvars(0, simplefunc_tb); 
     a = 1;
     b = 0;

// the last two lines terminate the simulation
     #200
       $finish;
  end
  always begin
    #5
      a = ~a; // keep toggling a every 5 ns
  end
endmodule
```

**Important Notes**
  - If you use vivado, they take care of the simulation file in their environment, no need to write \$dumpfile and \$dumpvars
  - Absolutely critical on iverilog to TERMINATE THE RUN using $finish
    - if you don't, the simulation will continue to run, using all your hard drive.
    - In class, I demonstrated that in 10 seconds, it used 150MB. You can always delete the file, but you could easily run out of space and crash if you are careless.

For icarus verilog, get into a *command line*

```bash
# compile the program in the command line
iverilog simplefunc_tb.sv -o simplefunc

# run the program
./simplefunc   #on Mac or Linux
simplefunc     #on Windows

# run the graphics (filename matches $dump)
gtkwave  simplefunc_tb.vcd # run and display the simulation
```

After running gtkwave, you will need to:
* click on the - to zoom out to see the full timescale. If you selected 1ns, you should probably zoom out so full scale is about 100ns to start.
* double click on the variables to graph


You are also encouraged to install Xilinx Vivado (does not work on MacOSX) or use it in the lab ECE105. Vivado is the industry standard, big and complicated, and the undisputed best development tool. It takes a minimum of 45GB to install.

Vivado works on Windows and Linux (not MacOSX)
It is also available in ECE105 on all the computers in the lab.

[Download Vivado](https://www.xilinx.com/support/download.html)
[Instructions for Installing and Using Vivado]()

## Strategies for Success in Building Electronics

Good strategies will help you do better in labs. You need to be
efficient with your time, and use both members of your team to get as
much as possible done as quickly as possible.

1. Build large circuits in modules separate on the board.
1. Test each individual piece independently, don't try to test the whole thing.
1. Be neat.
   1. Color coding wire
   1. wires flat to the board (takes more time but on a big build will save debugging)
   1. chips oriented the same way will avoid mistakes
1. Both team members should build different parts
   1. on different areas of the board in parallel.
   1. Different boards
1. Learn to use test equipment early in the semester.
