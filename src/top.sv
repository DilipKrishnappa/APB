import uvm_pkg::*;
`include "uvm_macros.svh"
`include "apb_design.sv"
`include "transaction.sv"
`include "write_data_seq.sv"
`include "write_read_seq.sv"
`include "read_data_seq.sv"
`include "wrie_read_bulk_seq.sv"
`include "write_err.sv"
`include "read_err.sv"
`include "reset_dut.sv"
`include "driver.sv"
`include "interface.sv"
`include "config.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "agent.sv"
`include "env.sv"
`include "test.sv"


module tb;
apb_if vif();

apb_ram dut (.presetn(vif.presetn), .pclk(vif.pclk), .psel(vif.psel), .penable(vif.penable), .pwrite(vif.pwrite), .paddr(vif.paddr), .pwdata(vif.pwdata), .prdata(vif.prdata), .pready(vif.pready), .pslverr(vif.pslverr));

initial begin
  vif.pclk <= 0;
end

always #10 vif.pclk <= ~vif.pclk;



initial begin
  uvm_config_db#(virtual apb_if)::set(null, "*", "vif", vif);
  run_test("test");
end


initial begin
  $dumpfile("dump.vcd");
  $dumpvars;
end


endmodule
