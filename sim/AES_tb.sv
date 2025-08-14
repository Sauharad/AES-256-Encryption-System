`timescale 1ns / 1ps

interface aes_intf;
    
    logic ON;
    logic [127:0] dut_aes_input_data;
    logic [255:0] dut_aes_key;
    logic dut_sys_clk;
    logic [127:0] dut_aes_output_data;
    
    task run();
        forever @(posedge dut_sys_clk)
            $display("\n[INT] Input: %0x, Key: %0x, Output: %0x, Time: %0t",dut_aes_input_data,dut_aes_key,dut_aes_output_data,$time());
    endtask
    
endinterface



class transaction1;
    
    rand bit [127:0] aes_input_data;
    bit [255:0] aes_key;
    int seed;
    
    function new(input bit [255:0] aes_key);
        this.aes_key = aes_key;
    endfunction
                
    function transaction1 copy();
        copy = new(this.aes_key);
        copy.aes_input_data = this.aes_input_data;
        copy.aes_key = this.aes_key;
    endfunction
    
endclass



class transaction2;
    logic [127:0] aes_output_data;
    
    function transaction2 copy();
        copy = new();
        copy.aes_output_data = this.aes_output_data;
    endfunction
    
endclass



class generator;
    transaction1 gen_to_drv_trans;
    mailbox #(transaction1) gen_to_drv_mbx;
    event gen_done;
    integer fd, num_vectors,i;
    int keywait=0;
    
    
        
    function new(mailbox #(transaction1) gen_to_drv_mbx, input int num_vectors);
        this.gen_to_drv_mbx = gen_to_drv_mbx;
        this.num_vectors = num_vectors;
        srandom(123);
        gen_to_drv_trans = new(256'haaa71db5936fc59ec733a01fc17aedcbd7fa50c3dfde48c1f8fed035e92c2fea);
    endfunction
    
    task run();
        fd = $fopen("D:\\Vivado\\Projects\\AES\\AES.sim\\sim_1\\behav\\xsim\\tb_out.txt","w");
        if (fd == 0) $display("\nFailed To Open tb_out.txt");
        for (i=0; i<num_vectors; i=i+1)
            begin
                assert(gen_to_drv_trans.randomize) else $display("Transaction1 Randomization Failed");
                gen_to_drv_mbx.put(gen_to_drv_trans.copy());
                if (keywait==0)
                    begin
                        #10;
                        gen_to_drv_mbx.put(gen_to_drv_trans.copy());
                        keywait++;
                    end
                $fdisplay(fd,"Key=%x",gen_to_drv_trans.aes_key);
                $fdisplay(fd,"Data=%x",gen_to_drv_trans.aes_input_data);
                $display("[GEN]: Sent %0x Data and %0x Key to Driver at Time %0t",gen_to_drv_trans.aes_input_data,gen_to_drv_trans.aes_key,$time());
                #10;
            end
        -> gen_done;
        $display("Gen Done");
        $fclose(fd);
    endtask
    
endclass



class driver;
    mailbox #(transaction1) gen_to_drv_mbx;
    transaction1 gen_to_drv_trans;
    virtual aes_intf vif;
    event gen_done;
    int keywait = 0;
    
    function new(mailbox #(transaction1) gen_to_drv_mbx, virtual aes_intf vif);
        this.gen_to_drv_mbx = gen_to_drv_mbx;
        this.vif = vif;
    endfunction
    
    task run();
        vif.ON = 1'b1;
        forever 
            begin
                gen_to_drv_mbx.get(gen_to_drv_trans);
                @(posedge vif.dut_sys_clk);
                vif.dut_aes_input_data <= gen_to_drv_trans.aes_input_data;
                vif.dut_aes_key <= gen_to_drv_trans.aes_key;
                $display("\n[DRV] : Sent %0x Data and %0x Key to DUT at Time %0t",gen_to_drv_trans.aes_input_data,gen_to_drv_trans.aes_key,$time());
                if (gen_done.triggered)
                    begin
                        vif.ON = 1'b0;   
                        $display("Driver Done");
                    end                 
            end
    endtask
    
endclass



class monitor;
    
    virtual aes_intf vif;
    bit [127:0] dut_out;
    int num_vectors;
    int counter = 0;
    event mon_done;
    
    function new(virtual aes_intf vif, input int num_vectors);
        this.vif = vif;
        this.num_vectors = num_vectors;
    endfunction
    
    task run();
        int py;
        py = $fopen("D:\\Vivado\\Projects\\AES\\AES.sim\\sim_1\\behav\\xsim\\dut_out.txt","w");
        repeat (18) @(posedge vif.dut_sys_clk);
        forever 
            begin
                @(posedge vif.dut_sys_clk);
                if (counter == num_vectors)
                    begin
                        ->mon_done;
                    end
                else
                    begin
                        $display("\n[MON] Ciphertext: %0x Received at %0t",vif.dut_aes_output_data,$time());
                        $fdisplay(py,"%0x",vif.dut_aes_output_data);
                        $display("[MON] Counter: %0d",counter);
                        counter = counter + 1;
                    end
            end
    endtask
endclass


module AES_tb;

    aes_intf vif();
    generator gen;
    driver drv;
    monitor mon;
    event gen_done, mon_done;
    int num_vectors = 3;
    int seed = 69;
    
    mailbox #(transaction1) gen_to_drv_mbx;
    
    aes_toplevel dut(.ON(vif.ON),.aes_input_data(vif.dut_aes_input_data),.aes_key(vif.dut_aes_key),.sys_clk(vif.dut_sys_clk),.aes_output_data(vif.dut_aes_output_data));
    
    initial 
        begin
            vif.dut_sys_clk = 1'b0;
            forever #5 vif.dut_sys_clk = ~vif.dut_sys_clk;
        end
    
    initial
        begin
            gen_to_drv_mbx = new();
            gen = new(gen_to_drv_mbx,num_vectors);
            drv = new(gen_to_drv_mbx,vif);
            mon = new(vif,num_vectors);
            
            gen_done = gen.gen_done;
            drv.gen_done = gen_done;
            mon_done = mon.mon_done;            
        end
        
    initial
        begin
            fork
                gen.run();
                drv.run();
                mon.run();
                vif.run();
            join            
        end
           
    initial
        begin
            int fin;
            wait(mon_done.triggered);
            fin = $fopen("D:\\Vivado\\Projects\\AES\\AES.sim\\sim_1\\behav\\xsim\\trigger.txt","w");
            $display("\nSimulation Finished");
            $fclose(fin);
            $finish();
        end
    
    wire clk = dut.myaesdatapath.sys_clk;
    wire [127:0] initial_latch = dut.myaesdatapath.initial_round_load;
    wire [255:0] key = dut.myaeskeygen.key_store_temp;
    wire [127:0] ri_out = dut.myaesdatapath.init_to_r1;
    wire [127:0] r1_out = dut.myaesdatapath.r1_to_r2;
    wire [127:0] r2_out = dut.myaesdatapath.r2_to_r3;
    wire [127:0] r3_out = dut.myaesdatapath.r3_to_r4;
    wire [127:0] r4_out = dut.myaesdatapath.r4_to_r5;
    wire [127:0] r5_out = dut.myaesdatapath.r5_to_r6;
    wire [127:0] r6_out = dut.myaesdatapath.r6_to_r7;
    wire [127:0] r7_out = dut.myaesdatapath.r7_to_r8;
    wire [127:0] r8_out = dut.myaesdatapath.r8_to_r9;
    wire [127:0] r9_out = dut.myaesdatapath.r9_to_r10;
    wire [127:0] r10_out = dut.myaesdatapath.r10_to_r11;
    wire [127:0] r11_out = dut.myaesdatapath.r11_to_r12;
    wire [127:0] r12_out = dut.myaesdatapath.r12_to_r13;
    wire [127:0] r13_out = dut.myaesdatapath.r13_to_rfinal;
    wire [127:0] rfinal_out = dut.myaesdatapath.rfinal_to_output;
    wire [127:0] output_dut = dut.aes_output_data;
    wire [127:0] output_intf = vif.dut_aes_output_data;

     
    
endmodule
