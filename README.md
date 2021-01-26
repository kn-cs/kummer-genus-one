## Efficient Kummer line computations for genus one curves at 128-bit, 224-bit and 256-bit security levels.

The source codes of this repository correspond to the Kummer line computations of the work [Kummer versus Montgomery Face-off over 
Prime Order Fields](https://eprint.iacr.org/2021/019), authored by [Kaushik Nath](kaushikn_r@isical.ac.in) 
& [Palash Sarkar](palash@isical.ac.in) of [Indian Statistical Institute, Kolkata, India](https://www.isical.ac.in).
All the implementations are 4-way vectorized and have been developed using assembly language targeting the modern Intel architectures 
like Skylake and Haswell which are enabled with the AVX2 instruction set.

To report a bug or make a comment regarding the implementations please drop a mail to: [Kaushik Nath](kaushikn_r@isical.ac.in).

---

### Compilation and execution of programs 
    
* Please compile the ```makefile``` in the **test** directory and execute the generated executable file. 
* One can change the architecture accordingly in the makefile before compilation. Default provided is ```Skylake```.
---

### Overview of the implementations in the repository

* **KL-p2519**: 9-limb implementations of the Kummer line KL[p251-9,81,20].

* **KL-p25519/9-limb**: 9-limb implementations of the Kummer line KL[p255-19,838,831].

* **KL-p25519/10-limb**: 10-limb implementations of the Kummer line KL[p255-19,838,831].

* **KL-p2663**: 10-limb implementations of the Kummer line KL[p266-3,683,18].

* **KL-p44417**: 16-limb implementations of the Kummer line KL[p444-17,659,370].

* **KL-p4482241**: 16-limb implementations of the Kummer line KL[p448-224-1,659,370].

* **KL-p4523**: 16-limb assembly implementations of the Kummer line KL[p452-3,913,294].

* **KL-p50645**: 18-limb implementations of the Kummer line KL[p506-45,856,181].

* **KL-p51075**: 18-limb implementations of the Kummer line KL[p510-75,1063,198].

* **KL-p5211**: 18-limb implementations of the Kummer line KL[p506-45,1559,796].

---    
