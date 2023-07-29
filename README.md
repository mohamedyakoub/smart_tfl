# smart_tfl
A smart traffic light that detects the presence of cars on two roads A (main road)and B and controls the lights depending on the sensors implemented with verilog on FPGA  
This project consists 2 modules:
1- a timer that gives 4 done signals 4 times :
    1- green a (default 60).
    2- yellow  (default 5).
    3- green b (default 50).
    4- custom delay (default 10).
and the times for each signal are parameterized and could be changed.
2- a fsm that contols the algorithm for the traffic light 
