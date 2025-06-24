module vending_machine_testbench;
 //inputs
 reg clk;
 reg rst;
 reg[1:0] in;

 //outputs
 wire out;
 wire[1:0] change;


vending_machine vend(.clk(clk),.in(in),.out(out),.change(change),.rst(rst));

 initial begin
     $dumpfile("vending_machine.vcd");
     $dumpvars(0,vending_machine_testbench);

     rst=1;
     clk=0;

     #6 rst=0;
     in=1;
     #11 in=2'b01;
     #16 in=2'b01;
 end

 always #5 clk= ~clk;
endmodule

