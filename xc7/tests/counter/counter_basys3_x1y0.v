module top (
    input  clk,
    output [1:0] led
);

    wire gclk, hclk;
    BUFG bufg(.I(clk), .O(gclk));
    BUFH bufh(.I(gclk), .O(hclk));

    localparam BITS = 2;
    localparam LOG2DELAY = 22;

    reg [BITS+LOG2DELAY-1:0] counter = 0;

    always @(posedge hclk) begin
        counter <= counter + 1;
    end

    assign led[1:0] = counter >> LOG2DELAY;
endmodule
