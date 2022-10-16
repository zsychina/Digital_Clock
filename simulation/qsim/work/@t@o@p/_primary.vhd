library verilog;
use verilog.vl_types.all;
entity TOP is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        set_time_finish : in     vl_logic;
        set_sec_ge      : in     vl_logic_vector(3 downto 0);
        set_sec_shi     : in     vl_logic_vector(3 downto 0);
        set_min_ge      : in     vl_logic_vector(3 downto 0);
        set_min_shi     : in     vl_logic_vector(3 downto 0);
        set_hour_ge     : in     vl_logic_vector(3 downto 0);
        set_hour_shi    : in     vl_logic_vector(3 downto 0);
        clock_en        : in     vl_logic;
        clock_min_ge    : in     vl_logic_vector(3 downto 0);
        clock_min_shi   : in     vl_logic_vector(3 downto 0);
        clock_hour_ge   : in     vl_logic_vector(3 downto 0);
        clock_hour_shi  : in     vl_logic_vector(3 downto 0);
        clock_out       : out    vl_logic;
        sec_ge_r        : out    vl_logic_vector(3 downto 0);
        sec_shi_r       : out    vl_logic_vector(3 downto 0);
        min_ge_r        : out    vl_logic_vector(3 downto 0);
        min_shi_r       : out    vl_logic_vector(3 downto 0);
        hour_ge_r       : out    vl_logic_vector(3 downto 0);
        hour_shi_r      : out    vl_logic_vector(3 downto 0);
        out_sec_ge_seg  : out    vl_logic_vector(6 downto 0);
        out_sec_shi_seg : out    vl_logic_vector(6 downto 0);
        out_min_ge_seg  : out    vl_logic_vector(6 downto 0);
        out_min_shi_seg : out    vl_logic_vector(6 downto 0);
        out_hour_ge_seg : out    vl_logic_vector(6 downto 0);
        out_hour_shi_seg: out    vl_logic_vector(6 downto 0)
    );
end TOP;
