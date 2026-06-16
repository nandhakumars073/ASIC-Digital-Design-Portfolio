`timescale 1ns/1ps

module tb_traffic_light_controller;

reg clk;
reg rst;

wire red;
wire yellow;
wire green;

traffic_light_controller dut(
    .clk(clk),
    .rst(rst),
    .red(red),
    .yellow(yellow),
    .green(green)
);


// *Clock Generation*
always #5 clk = ~clk;


// *Stimulus*
initial
begin
    clk = 0;
    rst = 1;

    #20;
    rst = 0;

    #200;
    $finish;
end


// *Monitor*
initial
begin
    $monitor(
        "Time=%0t State Outputs: R=%b Y=%b G=%b",
        $time,
        red,
        yellow,
        green
    );
end

endmodule
