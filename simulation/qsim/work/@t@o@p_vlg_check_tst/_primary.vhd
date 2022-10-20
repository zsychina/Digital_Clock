library verilog;
use verilog.vl_types.all;
entity TOP_vlg_check_tst is
    port(
        clock_out       : in     vl_logic;
        out_hour_ge_seg : in     vl_logic_vector(6 downto 0);
        out_hour_shi_seg: in     vl_logic_vector(6 downto 0);
        out_min_ge_seg  : in     vl_logic_vector(6 downto 0);
        out_min_shi_seg : in     vl_logic_vector(6 downto 0);
        out_sec_ge_seg  : in     vl_logic_vector(6 downto 0);
        out_sec_shi_seg : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end TOP_vlg_check_tst;
