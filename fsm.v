`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2023 05:37:17 PM
// Design Name: 
// Module Name: fsm
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


module fsm(
    input clk,reset,
    input sa,
    input sb,
    output [2:0] A,
    output [2:0] B
    );
     parameter green_a=60, yellow=5,green_b=50,sec_10=10;
     wire done_green,done_yellow,done_green_b,res,done_10_sec;
     reg[3:0] curr_state,next_state;
     parameter     s0=3'd0,
                   s1=3'd1,
                   s2=3'd2,
                   s3=3'd3,
                   s4=3'd4,
                   s5=3'd5,
                   s6=3'd6,
                   s7=3'd7,
                   s8=4'd8,
                   s9=4'd9,
                   s10=4'd10,
                   s11=4'd11;
     timer#(green_a,yellow,green_b,sec_10) timer_1( clk,res,curr_state,done_green,done_yellow,done_green_b,done_10_sec);   
     always@(posedge clk,posedge reset) begin
     if(reset)
       curr_state<=s0;     
     else
       curr_state<=next_state;
       end
    always@(*)begin
    case(curr_state)
    s0:begin //A green restart timer 60 
        next_state=s1;
       end
    s1:begin //A green timer 60
        if(done_green)

          if(sb)
           next_state=s4;
          else
           next_state=s2;
         else
          next_state=s1;
       end
    s2:next_state=s3; //green extend timer restart 10
    s3:begin //A green extend timer 10
        if(done_10_sec)
           
           if(sb)
            next_state=s4;
           else
            next_state=s2;
        else
           next_state=s3;
       end
    s4:next_state=s5; //A yellow timer restart 5
    s5:if(done_yellow) // A yellow timer 5
        next_state=s6;    
       else
        next_state=s5;
    s6:next_state=s7; //B green timer restart 60
    s7:if(done_green_b) //B green timer 60
          if(sa)
           next_state=s10;
          else if(sb)
           next_state=s8;
          else
           next_state=s10;
       else
        next_state=s7;
    s8:next_state=s9; //B green timer extend restart 10
    s9: if(done_10_sec)  //B green timer 10
          if(sa)
           next_state=s10;
          else if(sb)
           next_state=s8;
          else
           next_state=s10;
         else
         next_state=s9;
    s10:next_state=s11;//A yellow timer restart 5
    s11:if(done_yellow)//A yellow timer  5
        next_state=s0;    
       else
        next_state=s11;
    default: next_state=s0;
    endcase
    end
    
    assign res=   (curr_state==s0|curr_state==s2|curr_state==s4|curr_state==s6|curr_state==s8|curr_state==s10);
    assign A[0]=  (curr_state==s0|curr_state== s1|curr_state== s2|curr_state==  s3);            
    assign B[2]=  (curr_state==s0|curr_state==s1|curr_state==s2|curr_state==s3|curr_state==s4|curr_state==s5);            
    assign A[1]=  (curr_state==s4|curr_state==s5);            
    assign B[1]=  (curr_state==s10|curr_state==s11);  
    assign A[2]=  (curr_state==s6|curr_state==s7|curr_state==s8|curr_state==s9|curr_state==s10|curr_state==s11);            
    assign B[0]=  (curr_state==s6|curr_state==s7|curr_state==s8|curr_state==s9);            
endmodule
