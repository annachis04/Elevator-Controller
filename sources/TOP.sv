`timescale 1ns / 1ps

module TOP(
    input logic clk,
    input logic rst,
    input logic en,
    input logic stop,
    input logic [1:0] in,
    output logic clk_delay,
    output logic [6:0] floor_display,
    output logic [3:0] changes_counter
);

logic clk_delay;
logic [1:0] floor;

CLK_DELAY CLK_DELAY0 (
    .clk(clk),       
    .rst(rst),       
    .en(en),        
    .clk_delay(clk_delay)          
);

ELEVATOR ELEVATOR_DUT(
     .clk(clk_delay),          
     .rst(rst),          
     .stop(stop),         
     .in(in),           
     .floor(floor),         
     .changes_count(changes_counter) 
);

FLOOR_TRANSCODOR TRANSCODOR0 (
    .floor(floor), 
    .out(floor_display)                                                                                                                                                                                                                                                                                                                                                                                   
);

assign clk_delay=clk_delay;
    
endmodule
