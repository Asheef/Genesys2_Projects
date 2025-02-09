`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Aheesa Digital Innovation Private Limited
// Engineer: Mohamed Asheef M
// 
// Create Date: 02/07/2025 3:36:52 PM
// Design Name: IO Buffer Loopback 
// Module Name: io_buf_2
// Project Name: IO Buffer Loopback for checking Spartan FPGA board
// Target Devices: Genesys 2
// Tool Versions: Vivado 2024
// Description: It has 2 internal registers In_reg and OUT_reg, data transmitter 
//		from IN_reg to Out1 or Out2 based on Sel, will be loopbacked to 
//		or from Out1 or Out2 will be stored to OUT_reg.
//		If IN_reg == OUT_reg, Leds glow based on its data
// 
// Dependencies: Have to connect 2 Male to Male connector between JC & JD PMODs
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module io_buf_2(
    input clk_p,
    input clk_n,
    input rst,
    input in1,
    input in2,
    input wr_en,
    input rd_en,
    input sel,

    inout [1:0] out1,
    inout [1:0] out2,

    output reg led0,
    output reg led1,
    output reg led2,
    output reg led3
);

    // Internal register
    reg [1:0] in_reg;
    reg [1:0] out_reg;

    always @ (*) begin
        if(wr_en == 1) begin
            if(in2 == 0 && in1 == 0) begin
                in_reg = 2'h0;
            end
            else if(in2 == 0 && in1 == 1) begin
                in_reg = 2'h1;
            end
            else if(in2 == 1 && in1 == 0) begin
                in_reg = 2'h2;
            end
            else if(in2 == 1 && in1 == 1) begin
                in_reg = 2'h3;
            end
        end

        else if(wr_en == 0) begin
            in_reg = in_reg;
        end

        if(wr_en == 0 && in2 == 0 && in1 == 0 && rd_en == 0) begin
            led0 = 0;
            led1 = 0;
            led2 = 0;
            led3 = 0;
            if(sel == 0)
                out_reg = out2;
            else if (sel == 1)
                out_reg = out1;
            
        end
        else if(wr_en == 0 && in2 == 0 && in1 == 0 && rd_en == 1) begin
            if(out_reg == 2'h0) begin
                led0 = 1;
                led1 = 0;
                led2 = 0;
                led3 = 0;
            end
            else if(out_reg == 2'h1) begin
                led0 = 0;
                led1 = 1;
                led2 = 0;
                led3 = 0;
            end
            else if(out_reg == 2'h2) begin
                led0 = 0;
                led1 = 0;
                led2 = 1;
                led3 = 0;
            end
            else if(out_reg == 2'h3) begin
                led0 = 0;
                led1 = 0;
                led2 = 0;
                led3 = 1;
            end
        end


    end

    assign out1 = (wr_en == 0 && sel == 0) ? in_reg : 2'hz;
    assign out2 = (wr_en == 0 && sel == 1) ? in_reg : 2'hz;
  
    wire locked;
    wire clk_out1;
    
    //Clk
  clk_wiz_0 clk_wiz_inst
   (
    // Clock out ports
    .clk_out1(clk_out1),     // output clk_out1
    // Status and control signals
    .reset(rst), // input reset
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1_p(clk_p),    // input clk_in1_p
    .clk_in1_n(clk_n)    // input clk_in1_n
);    


    //ILA
ila_0 ila_inst (
	.clk(clk_out1), // input wire clk


	.probe0(in1), // input wire [0:0]  probe0  
	.probe1(in2), // input wire [0:0]  probe1 
	.probe2(wr_en), // input wire [0:0]  probe2 
	.probe3(rd_en), // input wire [0:0]  probe3 
	.probe4(led0), // input wire [0:0]  probe4 
	.probe5(led1), // input wire [0:0]  probe5 
	.probe6(led2), // input wire [0:0]  probe6 
	.probe7(led3), // input wire [0:0]  probe7 
	.probe8(out1), // input wire [1:0]  probe8 
	.probe9(out2) // input wire [1:0]  probe9
	
);    

endmodule
