# Materials

## Presentations

1. [**What is Quantum Computing?**](/01_what_is_quantum_computing)
    - Core concepts: qubits, superposition, entanglement, quantum interference
    - Quantum gates and their implementations
    - Comparison of quantum frameworks (Qiskit, Cirq, Q#, Quipper)
    - Analysis of quantum service providers (IBM Quantum, AWS Braket, Azure Quantum)
    - Performance comparisons for linear systems and ODEs/PDEs
    - Quantum algorithms applied to CFD: HHL algorithm, Quantum Lattice Boltzmann Method

2. [**Quantum Operations**](/02_quantum_operations)
    - Mathematical foundations: bra-ket notation, Bloch sphere representation
    - Single and multi-qubit operations
    - Universal quantum gate sets (H, T, CNOT)
    - Quantum circuit design and implementation
    - Pauli operators, Hadamard, CNOT, SWAP, and Toffoli gates


3. [**Lid driven cavity problem**](/03_lid_driven_cavity_problem)
    - Overview of the lid driven cavity problem
    - Classical solution methods and challenges
    - Possible Quantum approaches to solving the problem
    - Comparison of the methods discussed

4. [**Using Quantum Algorithms for PINNs**](/04_using_quantum_algos_for_pinns)
    - Introduction to Quantum Physics-Informed Neural Networks (QPINNs)
    - Variational Quantum Algorithms for solving PDEs
    - "Hybrid" PINNs: Combining classical and quantum approaches
    - Explains Continuous Variable Quantum Computing (CVQC)
    - Performed analysis of different cases of problems as papers linked

## Algorithms Covered by Python Notebooks

The notebooks are all linked here: [GitHub Repository](https://github.com/Lofty-Brambles/qsnippets/)

1. Basic Quantum Gates and Circuits
    - Single qubit gate: H, Z
    - Multi-qubit gate: SWAP
    - Circuit construction and visualization

2. HHL Algorithm for Solving Linear Systems
    - Quantum phase estimation
    - Controlled rotations
    - Inverse quantum Fourier transform
    - Application to sparse linear systems

3. [Q]PINN implementations
    - [General PINN implementation](https://www.kaggle.com/code/prantikdasiitmds/pinn-lid-cav)
        - 21122 total params + some meta params
        - 4000 + 2000 epochs
        - [No derivative pred time]: 0.996 +/- 0.018 ms (min=0.978, max=1.053, runs=30, points=10000)
        - [With derivative pred time]: 20.992 +/- 0.485 ms (min=20.425, max=21.876, runs=30, points=10000)
    - [Hybrid QPINN](https://www.kaggle.com/code/prantikdasiitmds/te-hybrid-qpinn) [ PRED times are on a simulator, not comparable]
        - 274 total params + some meta params
        - 500 + 250 epochs
        - [No derivative pred time]: 43.168 +/- 1.905 ms (min=40.493, max=49.225, runs=30, points=10000)
        - [With derivative pred time]: 1790.258 +/- 27.446 ms (min=1734.754, max=1865.329, runs=30, points=10000)

## Key References and Sources for Further Studying?

1. [Papers collection](/papers)
1. [NISQ Quantum CFD](https://github.com/comp-physics/NISQ-Quantum-CFD) - Evaluating incompressible NSE on noisy quantum hardware

1. [Nielsen & Chuang: Quantum Computation and Quantum Information](https://profmcruz.wordpress.com/wp-content/uploads/2017/08/quantum-computation-and-quantum-information-nielsen-chuang.pdf)
1. [Quantum Algorithm Zoo](https://quantumalgorithmzoo.org/)
1. [ZX Calculus](https://arxiv.org/pdf/2012.13966) - Graphical language for quantum circuits

1. TE-QPINNs: https://www.nature.com/articles/s41598-025-02959-z
1. QC-PINNs: https://iopscience.iop.org/article/10.1088/2632-2153/ae1c91#mlstae1c91s9
1. Hybrid-approach: https://arxiv.org/html/2503.16678v1#S6
