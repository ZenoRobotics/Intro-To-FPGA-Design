`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2024 02:23:50 PM
// Design Name: 
// Module Name: add_module
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


module add_module(
    input clk,
    input rst,
    input [3:0] a,
    input [3:0] b,
    output [4:0] c
    );
    
    reg [4:0] c_reg;
    
    always@(posedge clk, posedge rst) begin
        if (rst == 1'b1)
           c_reg <= 0;
        else
           c_reg <= a + b;
    end
    
     
    //assign c = a + b;
    assign c = c_reg;
    
endmodule
