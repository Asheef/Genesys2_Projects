// Testbench file

module tb_io_buf_2();

    reg in1;
    reg in2;
    reg wr_en;
    reg rd_en;

    wire [1:0] out1;
    wire [1:0] out2;

    wire led0;
    wire led1;
    wire led2;
    wire led3;


    // Instantiation
    io_buf_2 dut (in1, in2, wr_en, rd_en, out1, out2, led0, led1, led2, led3);

    assign out2 = out1;

    initial begin
       // 3
            wr_en = 0;
            rd_en = 0;
            in1 = 0;
            in2 = 0;
    
            #20;
            wr_en = 1;
            in1 = 1;
            in2 = 1;

            #20;
            wr_en = 0;
            
            #20;
            in1 = 0;
            in2 = 0;

            #10;
            rd_en = 1;
            
            #10;
            $display("IN Mem = %0d\t\tOUT Mem = %0d", dut.in_reg, dut.out_reg);
            $display("LED0 = %0d\t\tLED1 = %0d\t\tLED2 = %0d\t\tLED3 = %0d\n\n", led0, led1, led2, led3);


        // 2
            wr_en = 0;
            rd_en = 0;
            in1 = 0;
            in2 = 0;
    
            #20;
            wr_en = 1;
            in1 = 0;
            in2 = 1;

            #20;
            wr_en = 0;
            
            #20;
            in1 = 0;
            in2 = 0;

            #10;
            rd_en = 1;
            
            #10;
            $display("IN Mem = %0d\t\tOUT Mem = %0d", dut.in_reg, dut.out_reg);
            $display("LED0 = %0d\t\tLED1 = %0d\t\tLED2 = %0d\t\tLED3 = %0d\n\n", led0, led1, led2, led3);



         // 1
            wr_en = 0;
            rd_en = 0;
            in1 = 0;
            in2 = 0;
    
            #20;
            wr_en = 1;
            in1 = 1;
            in2 = 0;

            #20;
            wr_en = 0;
            
            #20;
            in1 = 0;
            in2 = 0;

            #10;
            rd_en = 1;
            
            #10;
            $display("IN Mem = %0d\t\tOUT Mem = %0d", dut.in_reg, dut.out_reg);
            $display("LED0 = %0d\t\tLED1 = %0d\t\tLED2 = %0d\t\tLED3 = %0d\n\n", led0, led1, led2, led3);    




         // 0
            wr_en = 0;
            rd_en = 0;
            in1 = 0;
            in2 = 0;
    
            #20;
            wr_en = 1;
            in1 = 0;
            in2 = 0;

            #20;
            wr_en = 0;
            
            #20;
            in1 = 0;
            in2 = 0;

            #10;
            rd_en = 1;
            
            #10;
            $display("IN Mem = %0d\t\tOUT Mem = %0d", dut.in_reg, dut.out_reg);
            $display("LED0 = %0d\t\tLED1 = %0d\t\tLED2 = %0d\t\tLED3 = %0d\n\n", led0, led1, led2, led3);            
       
    end



endmodule
