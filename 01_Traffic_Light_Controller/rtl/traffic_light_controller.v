module traffic_light_controller (
    input clk,
    input rst,

    output reg red,
    output reg yellow,
    output reg green
);

parameter Red    = 2'b00;
parameter Green  = 2'b01;
parameter Yellow = 2'b10;

reg [1:0] state;
reg [2:0] count;

always @(posedge clk or posedge rst)
begin
    if (rst)
    begin
        state <= Red;
        count <= 0;
    end
    else
    begin
        case(state)

            Red:
            begin
                if(count == 4)
                begin
                    state <= Green;
                    count <= 0;
                end
                else
                    count <= count + 1;
            end

            Green:
            begin
                if(count == 4)
                begin
                    state <= Yellow;
                    count <= 0;
                end
                else
                    count <= count + 1;
            end

            Yellow:
            begin
                if(count == 1)
                begin
                    state <= Red;
                    count <= 0;
                end
                else
                    count <= count + 1;
            end

        endcase
    end
end

always @(*)
begin
    red    = 0;
    yellow = 0;
    green  = 0;

    case(state)

        Red:
            red = 1;

        Green:
            green = 1;

        Yellow:
            yellow = 1;

    endcase
end

endmodule        
  
  
