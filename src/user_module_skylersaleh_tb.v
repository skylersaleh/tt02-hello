`timescale 1ns / 1ps
`include "user_module_skylersaleh.v"

module user_module_skylersaleh_tb;

wire [7:0] io_in;
wire [7:0] io_out;

reg clk;
reg reset;
reg [6:0] dip_switch;
assign io_in = {dip_switch,clk};

user_module_341452019534398035 UUT (.io_in(io_in), .io_out(io_out));

initial begin
  $dumpfile("user_module_skylersaleh_tb.vcd");
  $dumpvars(0, user_module_skylersaleh_tb);
end

initial begin
   #100_100_000_000; // Wait a long time in simulation units (adjust as needed).
   $display("Caught by trap");
   $finish;
 end

parameter CLK_HALF_PERIOD = 5;
parameter TCLK = 2*CLK_HALF_PERIOD;
always begin
    clk = 1'b1;
    #(CLK_HALF_PERIOD);
    clk = 1'b0;
    #(CLK_HALF_PERIOD);
end

initial 
begin
    #20
    reset = 1;
    #(CLK_HALF_PERIOD);
    reset = 0;
end

initial begin
    dip_switch=0;

    //Print Hello
    dip_switch[6]=1;

    #320 
    //Print RPOG
    dip_switch[5]=1;

    #320
    dip_switch=0;

    //Print Hello
    dip_switch[6]=1;
    dip_switch[3:0]=1;

    #640
    dip_switch=0;

    //Print Hello
    dip_switch[6]=1;
    dip_switch[3:0]=2;

    #1280
    dip_switch=0;

    //Print Hello
    dip_switch[6]=1;
    dip_switch[3:0]=2;

    #1280
    dip_switch=0;

    //Print Hello
    dip_switch[6]=1;
    dip_switch[3:0]=15;


/*
    write_en = 0;
    pdm_input = 5'h00;
    #(CLK_HALF_PERIOD);
    #(5*TCLK)
    write_en = 1;
    pdm_input= 5'h08;
    #(TCLK);
    write_en = 0;
    #(63*TCLK);
    write_en = 1;
    pdm_input= 5'h1a;
    #(TCLK);
    write_en = 0;
    #(63*TCLK);
    write_en = 1;
    pdm_input= 5'h0f;
    #(64*TCLK);
    pdm_input= 5'h04;
    #(64*TCLK);
    $finish;
    */
end

endmodule
