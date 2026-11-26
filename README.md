# ASIC Digital System Implementation

## 1. Project Overview

Final System is an integrated digital design project that combines a processor-style datapath and control unit with a UART communication subsystem.

The system is organized into two clock domains, with dedicated synchronization mechanisms to ensure reliable communication and data transfer between different clock domains.

The project covers the digital frontend design and the complete backend flow, including synthesis, formal equivalence checking, Design for Testability (DFT), and post-DFT verification.

## 2. System Architecture

### Final System Architecture

![Final System Architecture](docs/system_architecture.png)

The system consists of three main functional groups:

**Clock Domain 1 – REF_CLK**
- Register File (RegFile)
- Arithmetic Logic Unit (ALU)
- Clock Gating
- System Controller (SYS_CTRL)

**Clock Domain 2 – UART_CLK**
- UART Transmitter (UART_TX)
- UART Receiver (UART_RX)
- Pulse Generator (PULSE_GEN)
- Clock Dividers

**Data Synchronization**
- Reset Synchronizers
- Data Synchronizer
- Asynchronous FIFO (ASYNC FIFO)

## 3. Clock Configuration

The design uses two master clocks and three generated clocks.

| Clock | Type | Period | Frequency |
|---|---|---:|---:|
| REF_CLK | Master | 20 ns | 50 MHz |
| UART_CLK | Master | 271.27 ns | 3.686 MHz |
| ALU_CLK | Generated | 20 ns | 50 MHz |
| RX_CLK | Generated | 271.27 ns | 3.686 MHz |
| TX_CLK | Generated | 8680.64 ns | ~115.2 kHz |

### Generated Clock Configuration

- **ALU_CLK:** Derived from REF_CLK with a division ratio of 1.
- **RX_CLK:** Derived from UART_CLK with a division ratio of 1.
- **TX_CLK:** Derived from UART_CLK with a division ratio of 32.

## 4. Timing Constraints

The project timing constraints include:

- Setup clock uncertainty: 0.2 ns.
- Hold clock uncertainty: 0.1 ns.
- Master clock transition: 0.05 ns.
- Clock grouping for the clock domains.
- `set_dont_touch` on master and generated clocks.
- Input delays: 20% of the corresponding clock period, excluding clock and reset inputs.
- Output delays: 20% of the corresponding clock period.
- Input driving cells for non-clock and non-reset inputs.
- Output load: 0.1 pF.
- Slow and fast operating-condition analysis.

**Constraint Report Result:**

No violated constraints were reported.

## 5. Digital Backend Implementation

The backend implementation follows four main stages.

### 5.1 Synthesis

Synthesis was performed using Synopsys Design Compiler.

**Implementation Statistics**

| Parameter | Result |
|---|---:|
| Top Module | SYS_TOP |
| Number of Ports | 772 |
| Number of Nets | 2,815 |
| Number of Cells | 2,020 |
| Combinational Cells | 1,588 |
| Sequential Cells | 394 |
| Buffers / Inverters | 267 |
| Macros / Black Boxes | 0 |
| Total Cell Area | 22,953.887012 |

**Area Breakdown**

| Area Component | Value |
|---|---:|
| Combinational Area | 13,226.108217 |
| Buffer / Inverter Area | 1,002.548422 |
| Non-combinational Area | 9,727.778795 |
| Macro / Black Box Area | 0 |

**Largest Hierarchical Area Contributions**

| Block | Area | Percentage |
|---|---:|---:|
| RegFile | 5,711.7018 | 24.9% |
| ALU | 5,551.6706 | 24.2% |
| ASYNC FIFO | 3,871.3430 | 16.9% |
| UART | 3,712.4885 | 16.2% |
| SYS_CTRL | 1,867.4229 | 8.1% |

### 5.2 Post-Synthesis Formality

Formal equivalence checking was performed between the reference RTL design and the synthesized implementation.

The available Formality report shows:

- 377 passing compare points.
- 0 failing compare points.
- 0 unmatched reference/implementation compare points.
- Verification status: **SUCCEEDED**.

This confirms equivalence for the compared points in the reported verification run.

### 5.3 Design for Testability (DFT)

DFT implementation and fault analysis were performed to evaluate the design's testability.

**Uncollapsed Stuck Fault Summary**

| Fault Classification | Number of Faults |
|---|---:|
| Detected (DT) | 16,628 |
| Possibly Detected (PT) | 2 |
| Undetectable (UD) | 191 |
| ATPG Untestable (AU) | 49 |
| Not Detected (ND) | 8 |
| **Total Faults** | **16,878** |

**Reported DFT Test Coverage: 99.65%**

### 5.4 Post-DFT Formality

A second formal equivalence verification was performed after DFT insertion.

| Verification Metric | Result |
|---|---:|
| Matched Compare Points | 377 |
| Passing Compare Points | 377 |
| Failing Compare Points | 0 |
| Unmatched Compare Points | 0 |

**Final Verification Status: VERIFY PASSED**

The Formality report confirms successful post-DFT verification with no failing compare points.

## 6. Power Analysis

Power estimation was performed using Synopsys Design Compiler with hierarchical reporting.

**Power Analysis Configuration**

| Parameter | Value |
|---|---|
| Design | SYS_TOP |
| Supply Voltage | 1.08 V |
| Analysis Effort | Low |
| Operating Condition | Slow Corner |
| Wire Load Model | Top |

**Reported Power Results**

| Power Component | Reported Value |
|---|---:|
| Switching Power | 6.68 × 10⁻³ mW |
| Internal Power | 0.215 mW |
| Leakage Power | 1.31 × 10⁷ pW |
| **Total Power** | **0.235 mW** |

**Power Distribution**

| Block | Percentage |
|---|---:|
| RegFile | 44.3% |
| ASYNC FIFO | 26.1% |
| SYS_CTRL | 11.2% |
| ALU | 7.1% |
| UART | 2.2% |

The power report contains warnings about unannotated primary inputs and sequential cell outputs. Therefore, these values represent the reported low-effort power estimation rather than a fully activity-annotated power analysis.

## 7. Tools and Technology

The available reports identify the following implementation environment:

- **Synopsys Design Compiler:** O-2018.06-SP1.
- **Synopsys Formality:** Formal equivalence verification.
- **Technology:** TSMC 0.13 µm standard-cell library.
- **Slow-corner library:** `scmetro_tsmc_cl013g_rvt_ss_1p08v_125c`.
- **Operating voltage:** 1.08 V.
- **Operating temperature:** 125°C for the reported slow-corner library.

## 8. Project Results Summary

| Stage | Result |
|---|---|
| Synthesis | Area and clock reports generated |
| Constraint Report | No violated constraints |
| Post-Synthesis Formality | 377 passing points, 0 failing |
| DFT | 99.65% reported test coverage |
| Post-DFT Formality | 377 passing points, 0 failing |
| Area Analysis | 22,953.887012 total cell area |
| Power Analysis | 0.235 mW reported total power |

## 9. Repository Structure

```text
ASIC-Digital-System-Implementation/
│
├── README.md
│
├── docs/
│   └── system_architecture.png
│
├── SYSTEM_Backend/
│
└── SYSTEM_Front_End/
```

The repository structure reflects the main directories currently included in the project.

## 10. Author

**Rahma Muhammad Saeed Al-Sayed**

Digital IC Design | RTL Design | Synthesis | Formal Verification | DFT

---

This documentation summarizes the system architecture, implementation requirements, and the available synthesis, formal verification, DFT, area, timing-constraint, and power reports.
