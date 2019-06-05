From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v8 00/13] Exynos5 Dynamic Memory Controller driver
Date: Wed,  5 Jun 2019 18:53:57 +0200
Message-ID: <20190605165410.14606-1-l.luba@partner.samsung.com>
References: <CGME20190605165426eucas1p20524669a299f740b5502db24977b098f@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, keescook@chromium.org, tony@atomide.com, jroedel@suse.de, treding@nvidia.com, digetx@gmail.com, willy.mh.wolff.ml@gmail.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi all,

This is v8 of the patch set which adds support of Dynamic Memory Controller
for Exynos5422 SoC.
The driver supports Dynamic Voltage and Frequency Scaling
for the DMC and DRAM. It also provides needed timings for different
speed operations of the DRAM memory.
There is also new generic code in of_memory and headers which allows to parse
LPDDR3 memories defined in device-tree.

The patch set has been cut to land mainline quickly and the dependency
on PPMU patches are removed. It implies that the debugging code which was
presenting details about traffic on the AXI slots has been removed.
It will be added when this driver got mainline and the PPMU code got mainline.
Also DT dependency of PPMU header has been removed.

changes:
v8:
- removed chipID dependency, as Krzysztof suggested and drop the whole checking
  code in the driver (which also Marek suggested offline) (it might be needed
  in future when other configuration would be supported). It also avoids
  a misunderstandings and simplifies the documentation.
- reordered clock IDs in 1st patch to keep the old IDs and add the new clocks
  at the end as Chanwoo suggested (added also his ACK there)
- in patch 6 (dt-bindings) added explicit clocks and names in the right order
  needed for the driver
- added proper address for the memory node in the documentation and in the DT
  (lpddr3-timings@0 -> @80000000)
- fixed wrong reg offset for pause feature
- removed debug code which shows AXI slots traffic and removed DT ppmu events
- in the driver code usage of 'dev', 'pdev->dev' has been aligned
- manipulating clocks has been aligned as Krzysztof suggested, now it enables
  only two clocks (and disables) and enables/disables the 'bypass' clocks
  on demand
- added comments in the documentation why there is a need of clock registers
  to be accessed via syscon regmap
- added proper link to Documentation/devicetree/bindings/ddr/lpddr3.txt
  in dt-bindings for memory controller doc
- removed unneeded prints when there was a deferred probe or during remove
- added 'syscon' also to exynos5420-clock node as Krzysztof suggested
- from 2nd patch removed blank line and added Acked-by: Chanwoo Choi
- collecting ACKs, which makes the clock related 3 patches
  ready to be merged (4 ACKs),
- patches 4,5 got 'Reviewed-by' from Rob
- it is now based on v5.2-rc3 tag
v7 [2]:
- added using regmap in chipid registers and clock registers
- in DT added "syscon" to compatible field in clock and chipid
- added two addition clocks in clocks definition file which were there
  in first implementation but now are grouped and commented properly
  (CLK_DOUT_PCLK_DREX0, CLK_DOUT_PCLK_DREX1)
- the BPLL ratio table now is set for Exynos 5422 and 5800 and not for 5420
- in DMC driver, changed code macro which generates functions for setup events
  into normal three functions as Krzysztof suggested
- moved 'clock_prepare_enable()' calls into the same function where 'disable'
  were called
- changed 'timing_reg' static variables into static const
- in DMC driver: the proper device_node *np_ddr is now put correctly
- in DMC driver: removed code related to counters_enabled
- mapped only 0x100 from DREX registers
- in DT memory node there is now 'reg' as Rob suggested instead of 'max-freq'
- in Documentation/devicetree/bindings/lpddr2 renamed into 'ddr' and the lpdd3*
  files landed there.
- cleaned the commit subject and message as Rob suggested for the patch 4/10 in v6
- added doxygen comments to exported functions in of_memory file
- cleaned minor issues like: missing space, 2 empty lines, in the doc JESD209-2 ->
  JESD209-3C, removed 'status = "okay"' from the doc file, etc
- based on v5.1 (+ PPMU patches from [1])
v6:
- driver code has been converted to use generic code which parses DT memory
  definition in drivers/memory/of_memory.c
- extended of_memory by LPDDR3 support (there was LPDDR2 made by TI)
- extended jedec_lpddr.h by the needed structures for LPDDR3 (AC timings)
- driver file moved to proper directory, where other memory controllers
  live, which is in this case drivers/memory/samsung/
- driver code now uses regmap_{read|write} to access registers for pausing
  and changing timings set, as suggested by Chanwoo
- DT contains simple definition of memory device, similar to LPDDR2 made by TI
- driver code generates the needed timings for registered OPPs, based on
  memory description in DT
- patch 1 contains Rob's ACK,
- simplified memory bandwidth calculation
- added debug information files with timings, raw counters and statistics
- updated dt-bindings files accordingly
- based on v5.1-rc5 (+ PPMU patches from [1])
v5:
- removed unneeded wrapper functions i.e. for regulator_set_voltage
- removed unused defines
- removed direct access to clock register base and used CCF for
  pause and timing set usage
- switched to OPP comming from DT according to Chanowoo's comments
- switched to timings comming from DT, added parsing function
- extended dt-binding with description of OPPs and timings
- according to Rob Herring comment, moved dt-binding file before driver code
  in the patch set.
- rebased on top of v5.0
v4:
- removed unneeded DPLL and G3D clocks IDs
- changed names of parent clocks for mout_mx_mspll_ccore_phy_p
  and added one more parent: mout_sclk_epll
- removed 933Mhz and 138MHz from the BPLL ratio table
v3:
- in DTS align to proper indent the clocks and clock-names entries
v2:
- changed file name exynos5-dmc.c -> exynos5422-dmc.c
  and related entries in other files
- changed dt-binding file name
- changed config entry to CONFIG_ARM_EXYNOS5422_DMC_DEVFREQ
- removed sysfs and print info messages (print only one line)
- removed function exynos5_read_chip_info and compact code
- changed dt-binding patch and move it up in the patch set
- new entries in MAINTAINERS are added with the driver c code
- clean-up in DTS file: renamed nodes to 'ppmu' and 'memory-controller',
  entries moved to suggested location (before nocp nodes or after),
  moved according to alfabetical order, compacted clocks names with right indent.

Regards,
Lukasz Luba

[1] https://lkml.org/lkml/2019/4/19/158
[2] https://lkml.org/lkml/2019/5/6/829

Lukasz Luba (13):
  clk: samsung: add needed IDs for DMC clocks in Exynos5420
  clk: samsung: add new clocks for DMC for Exynos5422 SoC
  clk: samsung: add BPLL rate table for Exynos 5422 SoC
  dt-bindings: ddr: rename lpddr2 directory
  dt-bindings: ddr: add LPDDR3 memories
  drivers: memory: extend of_memory by LPDDR3 support
  dt-bindings: memory-controllers: add Exynos5422 DMC device description
  drivers: memory: add DMC driver for Exynos5422
  drivers: devfreq: events: add Exynos PPMU new events
  ARM: dts: exynos: add chipid label and syscon compatible
  ARM: dts: exynos: add syscon to clock compatible
  ARM: dts: exynos: add DMC device for exynos5422
  ARM: exynos_defconfig: enable DMC driver

 .../{lpddr2 => ddr}/lpddr2-timings.txt        |    0
 .../bindings/{lpddr2 => ddr}/lpddr2.txt       |    2 +-
 .../bindings/ddr/lpddr3-timings.txt           |   58 +
 .../devicetree/bindings/ddr/lpddr3.txt        |   97 ++
 .../memory-controllers/exynos5422-dmc.txt     |   84 ++
 MAINTAINERS                                   |    8 +
 arch/arm/boot/dts/exynos5.dtsi                |    4 +-
 arch/arm/boot/dts/exynos5420.dtsi             |   81 +-
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi |  116 ++
 arch/arm/boot/dts/exynos5800.dtsi             |    2 +-
 arch/arm/configs/exynos_defconfig             |    1 +
 drivers/clk/samsung/clk-exynos5420.c          |   74 +-
 drivers/devfreq/event/exynos-ppmu.c           |    6 +
 drivers/memory/of_memory.c                    |  154 ++
 drivers/memory/of_memory.h                    |   18 +
 drivers/memory/samsung/Kconfig                |   17 +
 drivers/memory/samsung/Makefile               |    1 +
 drivers/memory/samsung/exynos5422-dmc.c       | 1265 +++++++++++++++++
 include/dt-bindings/clock/exynos5420.h        |   18 +-
 include/memory/jedec_ddr.h                    |   62 +
 20 files changed, 2057 insertions(+), 11 deletions(-)
 rename Documentation/devicetree/bindings/{lpddr2 => ddr}/lpddr2-timings.txt (100%)
 rename Documentation/devicetree/bindings/{lpddr2 => ddr}/lpddr2.txt (96%)
 create mode 100644 Documentation/devicetree/bindings/ddr/lpddr3-timings.txt
 create mode 100644 Documentation/devicetree/bindings/ddr/lpddr3.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/exynos5422-dmc.txt
 create mode 100644 drivers/memory/samsung/exynos5422-dmc.c

-- 
2.17.1
