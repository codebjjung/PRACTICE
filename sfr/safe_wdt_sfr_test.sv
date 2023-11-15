`ifndef SAFE_WDT_SFR_TEST_SV
`define SAFE_WDT_SFR_TEST_SV

`include "safe_wdt_reg_def.sv"
`include "wdt_base_test.sv"
`define SAFE_WDT_BASE (32'h1b93_4000) // base addr select

class wdt_sfr_test_c extends wdt_base_test_c; // wdt_base_test -> wdt_sfr_test
   extern virtual task wdt_sfr_test;
   extern virtual task wdt_sfr_reset_check(bit [31:0] addr, bit [31:0] exp, bit [31:0] mask);
   extern virtual task wdt_sfr_rw_check(bit [31:0] addr, bit [31:0] wdata, bit [31:0] mask=32'hffff_ffff);
   extern virtual task wdt_sfr_rand_rw_check(bit [31:0] addr, bit [31:0] wdata, bit [31:0] mask=32'hffff_ffff);

   function new();
      super.new();
   endfunction

   task run_phase();
      super.run_phase();
      boot_seq();

      `DFD_INFO("SAFE_WDT", "WDT SFR TEST");
      wdt_sfr_test;

      #1ns;
   endtask: run_phase

   task result_phase();
      super.result_phase();
   endtask
endclass


