module top_module (
    input ring,
    input vibrate_mode,
    output ringer,     
    output motor        
);
  assign motor = vibrate_mode & ring;
    assign ringer = ring & ~vibrate_mode;
endmodule
