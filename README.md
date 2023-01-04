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
* Update to use XC16 v2.00
* Ceedling updated to 0.31.1
* Update Simulation configuration located in test/simulation

Edit: 2023-01-04
- sim_test_fixture.rd
sim_test_fixture.rd now programs and runs the test binary.
Changes eliminate the need for "sleep" and "wait" timeouts and breakpoints.

MDB is configured using the `:text_fixture:` section of the `project.yml` file.

  - The first 6 arguments are required, and must be supplied in the given order.
  - Set options must be supplied as `option value` pairs.

```yaml
  :test_fixture:
    :executable: ruby
    :name: "Microchip simulator test fixture"
    :stderr_redirect: :auto #inform Ceedling what model of $stderr capture to use
    :arguments:
      - test/simulation/sim_test_fixture.rb
      - ${1}
      # MDB command
      - "mdb.sh"
      # MDB timeout - fail safe
      - "30000"
      # Device
      - PIC24HJ128GP202
      # HWTOOL
      - SIM
      # Set options
      - "warningmessagebreakoptions.W0011_CORE_SIM32_UNIMPLEMENTED_RAMACCESS break"
      - "uart1io.output window"
      - "uart1io.uartioenabled true"
```

