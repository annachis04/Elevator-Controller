`timescale 1ns / 1ps

module ELEVATOR_tb();

logic clk;
logic rst;
logic stop;
logic [1:0] in;
logic [1:0] floor;
logic [3:0] changes_count;

ELEVATOR DUT(
    .clk(clk),         
    .rst(rst),         
    .stop(stop),        
    .in(in),           
    .floor(floor),        
    .changes_count(changes_count) 
);

initial
begin
    clk=0;
    forever #5 clk=~clk;
end

initial
begin
    rst=1;
    #10
    rst=0;
end

initial
begin
  stop=0;
  repeat(8)
  @(posedge clk);
  stop=1;
  repeat(3)
  @(posedge clk);
  stop=0;
  repeat(2)
  @(posedge clk);
  stop=1;
  repeat(3)
  @(posedge clk);
  stop=0;
  #35
  $stop();
end

initial
begin
  in=0;
  repeat(2)
  @(posedge clk);
  in=3;
  repeat(4)
  @(posedge clk);
  in=1;
  repeat(2)
  @(posedge clk);
  in=2;
  repeat(5)
  @(posedge clk);
  in=3;
  repeat(2)
  @(posedge clk);
  in=0;
  repeat(4)
  @(posedge clk);
end

endmodule


