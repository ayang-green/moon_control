# MoonControl

A lightweight motion control algorithm library written in MoonBit.

## Overview

MoonControl is a motion control algorithm library developed in MoonBit.

The project aims to provide reusable and modular control algorithms
for robotics, CNC systems, automation equipment and other motion
control applications.

## Motivation

Motion control systems usually require many basic algorithm modules,
including PID controllers, filters, interpolation algorithms and
trajectory planning.

MoonControl attempts to build a native MoonBit implementation of
these common algorithms, providing simple APIs and reusable components.

## Project Status

Work in progress.

## Development Progress

### Day 1
- Created MoonControl project
- Initialized MoonBit development environment
- Designed project architecture
- Planned core algorithm modules

### Day 2
- Implemented basic PID controller
- Added PID state management
- Added proportional, integral and derivative calculation
- Added PID update interface
- Verified PID closed-loop response with example

## Planned Features

### Control Algorithms

- PID controller
- PID with output limitation
- PID with anti-windup

### Signal Processing

- Moving average filter
- Low-pass filter
- First-order filter

### Motion Planning

- Linear interpolation
- Trapezoidal velocity planning
- S-curve trajectory planning

### Utility Modules

- Saturation limiter
- Error calculation
- Numerical tools

## Target Applications

- Robot motion control
- CNC machine tools
- Industrial automation
- Embedded motion systems

## License

MIT
