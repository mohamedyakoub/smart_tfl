`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2023 05:37:17 PM
// Design Name: 
// Module Name: timer
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


module timer#(parameter green_a=60,yellow=5,green_b=50,sec_10=10)(
    input clk,
    input reset,
    input [3:0] state,
    output done_green,done_yellow,done_green_b,done_10_sec
    );
//    reg [9:0] timer;
//    always@(posedge clk,posedge reset)begin
//    if(reset)
//     timer=0;
//    else
//     timer=timer+1;
//    end
    
//    assign done= (timer==final);
//     parameter     s0=3'd0,
//                   s1=3'd1,
//                   s2=3'd2,
//                   s3=3'd3,
//                   s4=3'd4,
//                   s5=3'd5,
//                   s6=3'd6,
//                   s7=3'd7,
//                   s8=4'd8,
//                   s9=4'd9,
//                   s10=4'd10,
//                   s11=4'd11;
   reg[9:0] Q_reg,Q_next;
    always@(posedge clk,posedge reset)begin
    if(reset)begin
     Q_reg<=0;
//     case(state)
//     s0:final=10'd58;
//     s1:final=10'd58;
//     s2:final=10'd8;
//     s3:final=10'd8;
//     s4:final=10'd3;
//     s5:final=10'd3;
//     s6:final=10'd58;
//     s7:final=10'd58;
//     s8:final=10'd8;
//     s9:final=10'd8;
//     s10:final=10'd3;
//     s11:final=10'd3;
//     endcase
    end
    else
     Q_reg<=Q_next;
    end
    always@(*)begin
    Q_next=Q_reg+1;
    end
    assign done_green=(Q_reg==green_a-1);
    assign done_yellow=(Q_reg==yellow-1);
    assign done_green_b=(Q_reg==green_b-1);
    assign done_10_sec=(Q_reg==sec_10-1);
endmodule
