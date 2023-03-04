module uc(input wire [5:0] opcode, input wire z, output reg s_inc, s_inm, we3, wez, output reg [2:0] op_alu);
always @(*) begin
    casez (opcode)
        6'b0?????:  begin // Op arit-log
            s_inc = 1'b1;
            s_inm = 1'b0;
            we3 = 1'b1;
            wez = 1'b1;
            op_alu = opcode[4:2];
        end
        6'b10????:  begin // Carga de cte inmediata
            s_inc = 1'b1;
            s_inm = 1'b1;
            we3 = 1'b1;
            wez = 1'b0;
            op_alu = 3'b000;
        end
        6'b110???:  begin // Salto
            s_inc = 1'b0;
            s_inm = 1'b0;
            we3 = 1'b0;
            wez = 1'b0;
            op_alu = 3'b000;
        end
        6'b1110??:  begin // Salto condicional si z
            if (z == 1'b1)
                s_inc = 1'b0;
            else
                s_inc = 1'b1;
            s_inm = 1'b0;
            we3 = 1'b0;
            wez = 1'b0;
            op_alu = 3'b000;
        end
        6'b1111??:  begin // Salto condicional si no z
            if (z == 1'b0)
                s_inc = 1'b0;
            else
                s_inc = 1'b1;
            s_inm = 1'b0;
            we3 = 1'b0;
            wez = 1'b0;
            op_alu = 3'b000;
        end
        default: begin
            $display("Error en el opcode");
            s_inc = 1'b1;
            s_inm = 1'b0;
            we3 = 1'b0;
            wez = 1'b0;
            op_alu = 3'b000;
        end
    endcase
end
endmodule