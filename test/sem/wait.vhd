entity a is
end entity;

architecture b of a is
    signal x, y : bit;
begin

    -- wait for
    process is
    begin
        wait for ps;
        wait for 5 ns;
        wait for 2 * 4 hr;
        wait for 523;                -- Not TIME type
    end process;

    -- wait on
    process is
        variable v : bit;
    begin
        wait on x;
        wait on x, y;
        wait on v;                      -- Not signal
    end process;

    -- process sensitivity
    process (x, y) is
    begin
        x <= y;
    end process;

    process (x, a) is                   -- Bad name a
    begin
        x <= '1';
    end process;

    process (x) is
    begin
        x <= y;
        wait for 1 ns;                  -- Not allowed wait
    end process;

    -- wait until
    process is
    begin
        wait until true;
        wait until x = '1';
        wait until x;                   -- Not boolean
        wait until y = x for 1 ns;
        wait until y = x for x;         -- Not time
    end process;
    
end architecture;
    
