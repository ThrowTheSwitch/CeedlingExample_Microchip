CeedlingExample_Microchip
=========================

An example project demonstrating how to configure Ceedling for use with Microchip's compiler and simulator.

See http://spin.atomicobject.com/2012/10/22/getting-started-with-tdd-for-microchips-pics/ for a walkthough/tutorial that goes along with this project.

=========================

This project requires that the following is installed on your computer
* Ruby (http://rubyinstaller.org/)
* Ceedling gem (gem install ceedling)
* Microchip XC16 compiler - Cross-platform C compiler for 16 bit PICs (http://www.microchip.com/pagehandler/en_us/promo/mplabxc/)

=========================

Edit: 11/01/2021

* You only need to change XC16 compiler path (line 34) inside "project.yml" file to yours. 

Edit: 2022-12-07

* Ceedling updated to 0.31.1
* Update Simulation configuration located in test/simulation

- sim_test_fixture.rd
sim_test_fixture.rd now programs and runs the test binary.
Changes eliminate the need for "sleep" and "wait" timeouts and breakpoints.

- sim_instructions.txt
This file should only include configuration for the device - Device, HWTool and "set".
Running commands - Program, Reset, Run, Wait, Sleep, Quit - should not be used.

- project.yml

```yaml
  :test_fixture:
    :executable: ruby
    :name: "Microchip simulator test fixture"
    :stderr_redirect: :win #inform Ceedling what model of $stderr capture to use
    :arguments:
      - test/simulation/sim_test_fixture.rb
      - ${1}
```

