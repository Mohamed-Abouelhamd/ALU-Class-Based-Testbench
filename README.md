# ALU-Class-Based-Testbench

## Overview

This repository contains a class-based testbench for an Arithmetic Logic Unit (ALU) implemented in SystemVerilog. The testbench is structured using standard components: packet, generator, driver, interface, monitor, scoreboard and environment. This modular approach allows for efficient testing and validation of the ALU's functionality.

## Architecture

The testbench follows a structured architecture with separate classes for each component, allowing for clear interaction between components. The testbench integrates seamlessly with the ALU DUT, feeding inputs and checking outputs as specified in the test cases.

## Components

### Packet

The `packet` class defines the data structure for the inputs and expected outputs of the ALU operations. It encapsulates the opcode and operands.

### Generator

The `generator` class is responsible for generating stimulus packets based on predefined scenarios. It randomly selects operation types and operands to create diverse test cases.

### Driver

The `driver` class sends the generated packets to the DUT. It uses the SystemVerilog interface for seamless communication with the ALU.

### Monitor

The `monitor` class observes the DUT's output signals and records the results for further analysis. It ensures that the DUT behaves as expected based on the input stimuli.

### Scoreboard

The `scoreboard` class compares the DUT's output with the expected results derived from the input packets. It tracks pass/fail statistics and logs any discrepancies.

### Environment

The `environment` class encapsulates all the previous components, ensuring they interact properly. It orchestrates the overall simulation, managing the lifecycle of the testbench.

### Interface

The `interface` defines the communication protocol between the environment and the DUT. It includes signal declarations and any necessary connections.

### DUT

The `dut` module is an instantiation of the ALU and provides a way for the environment to interact with it. This module is the main focus of the verification effort.

### Test

The `Test` module contains the DUT and the environment in addition to connecting them with each other.
