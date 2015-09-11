library verilog;
use verilog.vl_types.all;
entity ten_cnt is
    port(
        ce              : in     vl_logic;
        clk             : in     vl_logic;
        ainit           : in     vl_logic;
        thresh0         : out    vl_logic;
        q               : out    vl_logic_vector(3 downto 0)
    );
end ten_cnt;
