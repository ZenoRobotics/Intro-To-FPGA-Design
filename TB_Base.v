`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2024 12:02:33 PM
// Design Name: 
// Module Name: TB_Adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TB_Adder();

`timescale 1ns / 1ps

// Instantiate DUT Module



parameter c_CLOCK_PERIOD_NS = 10;  //100 MHz
reg sys_clk_r = 0;
reg rst_n_r = 1;

reg [3:0] val_a_in_r = 0;
reg [3:0] val_b_in_r = 0;
wire [4:0] sum_c_out;

add_module add_module_inst(
  //essential inputs
  .clk(sys_clk_r),     //input wire 
  .rst(~rst_n_r),     //input wire 
  //adder I/O
  .a(val_a_in_r),     // 4 bits (15)
  .b(val_b_in_r),     // 4 bits (15)
  //sum output
  .c(sum_c_out)       // 5 bits  
);

  always
    #(c_CLOCK_PERIOD_NS/2) sys_clk_r <= ~sys_clk_r;

  initial
    begin
       rst_n_r = 1;
       val_a_in_r = 1;
       val_b_in_r = 2;
       #20
      repeat (5) begin
            @(posedge sys_clk_r);
       end
       rst_n_r = 0;
       #10
       rst_n_r = 1;
       @(posedge sys_clk_r);
       val_a_in_r = 3;
       val_b_in_r = 5;
       

      #100;
      $finish;
    end

endmodule
