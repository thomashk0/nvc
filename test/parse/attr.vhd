architecture a of e is
    attribute foo : integer;
    attribute foo of x : signal is 5;
    attribute foo of x : component is 5;
    attribute foo of x : label is 6;
    attribute foo of x : type is 4;
begin
    assert x'foo(5);
end architecture;
