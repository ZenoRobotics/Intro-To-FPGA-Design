`timescale 1ns / 1ps

module TB_Base();

// Instantiate DUT Module



parameter c_CLOCK_PERIOD_NS = 10;  //100 MHz
reg r_sys_clk = 0;
reg r_rst_n = 1;

top_module Top_Module_Inst(
  //essential inputs
	.clk(r_sys_clk),     //input wire 
  .rst_n(r_rst_n),     //input wire 
	//example outputs
  .my_output()
);

  always
    #(c_CLOCK_PERIOD_NS/2) r_sys_clk <= ~r_sys_clk;

  initial
    begin
       r_rst_n = 1;
       #20
      repeat (5) begin
            @(posedge r_sys_clk);
       end
       r_rst_n = 0;
       #35
       r_rst_n = 1;

      #100;
    end
    
endmodule
       
