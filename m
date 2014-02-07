From: Thomas Abraham <ta.omasab@gmail.com>
Subject: [PATCH v3 0/7] cpufreq: use cpufreq-cpu0 driver for exynos based platforms
Date: Fri,  7 Feb 2014 21:25:41 +0530
Message-ID: <1391788548-13056-1-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:59078 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751901AbaBGP4h (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Feb 2014 10:56:37 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, shawn.guo@linaro.org, kgene.kim@samsung.com, t.figa@samsung.com, l.majewski@samsung.com, viresh.kumar@linaro.org, thomas.ab@samsung.com, heiko@sntech.de

Changes since v2:
- Safe operating voltage is not required while switching APLL frequency
  since the temporary parent's clock is divided down to keep armclk wit=
hin
  permissible limits. Thanks to Heiko St=C3=BCbner <heiko@sntech.de> fo=
r this
  suggesting this.
- Rob had suggested to use max frequency for each of the divider clock
  outputs instead of divider values. But due to certain SoC specific
  characteristics, the divider values corresponding to the input clock
  frequency for the CMU_CPU clock blocks have to be used.

Changes since v1:
- Removes Exynos4x12 and Exynos5250 cpufreq driver also.
- Device tree based clock configuration lookup as suggested by Lukasz
  Majewski and Tomasz Figa.
- safe operating point binding reworked as suggested by Shawn Guo.

The patch series removes the use of Exynos specific cpufreq driver and =
enables
the use of cpufreq-cpu0 driver for Exynos4210, Exynos4x12 and Exynos525=
0 based
platforms. This is being done for few reasons.

(a) The Exynos cpufreq driver reads/writes clock controller registers
    bypassing the Exynos CCF driver which is sort of problematic.
(b) Removes the need for having clock controller register definitions
    in the cpufreq driver and also removes the need for statically
    io-remapping clock controller address space (helps in moving toward=
s
    multiplatform kernel).

Thomas Abraham (7):
  cpufreq: cpufreq-cpu0: allow use of optional boost mode frequencies
  clk: samsung: add infrastructure to register cpu clocks
  Documentation: devicetree: add cpu clock configuration data binding f=
or Exynos4/5
  clk: exynos: use cpu-clock provider type to represent arm clock
  ARM: dts: Exynos: add cpu nodes, opp and cpu clock configuration data
  ARM: Exynos: switch to using generic cpufreq-cpu0 driver
  cpufreq: exynos: remove all exynos specific cpufreq driver support

 .../devicetree/bindings/clock/exynos4-clock.txt    |   37 ++
 .../devicetree/bindings/clock/exynos5250-clock.txt |   39 ++
 .../devicetree/bindings/cpufreq/cpufreq-cpu0.txt   |    2 +
 arch/arm/boot/dts/exynos4210-origen.dts            |    6 +
 arch/arm/boot/dts/exynos4210-trats.dts             |    6 +
 arch/arm/boot/dts/exynos4210-universal_c210.dts    |    6 +
 arch/arm/boot/dts/exynos4210.dtsi                  |   35 ++
 arch/arm/boot/dts/exynos4212.dtsi                  |   18 +
 arch/arm/boot/dts/exynos4412-odroidx.dts           |    6 +
 arch/arm/boot/dts/exynos4412-origen.dts            |    6 +
 arch/arm/boot/dts/exynos4412-trats2.dts            |    6 +
 arch/arm/boot/dts/exynos4412.dtsi                  |   31 ++
 arch/arm/boot/dts/exynos4x12.dtsi                  |   36 ++
 arch/arm/boot/dts/exynos5250-arndale.dts           |    6 +
 arch/arm/boot/dts/exynos5250-cros-common.dtsi      |    6 +
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |    6 +
 arch/arm/boot/dts/exynos5250.dtsi                  |   41 ++
 arch/arm/mach-exynos/common.c                      |    5 -
 arch/arm/mach-exynos/common.h                      |    1 -
 arch/arm/mach-exynos/mach-exynos4-dt.c             |    2 +-
 arch/arm/mach-exynos/mach-exynos5-dt.c             |    2 +-
 drivers/clk/samsung/Makefile                       |    2 +-
 drivers/clk/samsung/clk-cpu.c                      |  409 ++++++++++++=
++++++++
 drivers/clk/samsung/clk-exynos4.c                  |   23 +-
 drivers/clk/samsung/clk-exynos5250.c               |   10 +-
 drivers/clk/samsung/clk.h                          |    5 +
 drivers/cpufreq/Kconfig                            |    1 +
 drivers/cpufreq/Kconfig.arm                        |   51 ---
 drivers/cpufreq/Makefile                           |    4 -
 drivers/cpufreq/cpufreq-cpu0.c                     |    3 +
 drivers/cpufreq/exynos-cpufreq.c                   |  292 ------------=
--
 drivers/cpufreq/exynos-cpufreq.h                   |   91 -----
 drivers/cpufreq/exynos4210-cpufreq.c               |  157 --------
 drivers/cpufreq/exynos4x12-cpufreq.c               |  211 ----------
 drivers/cpufreq/exynos5250-cpufreq.c               |  183 ---------
 include/dt-bindings/clock/exynos5250.h             |    1 +
 36 files changed, 727 insertions(+), 1019 deletions(-)
 create mode 100644 drivers/clk/samsung/clk-cpu.c
 delete mode 100644 drivers/cpufreq/exynos-cpufreq.c
 delete mode 100644 drivers/cpufreq/exynos-cpufreq.c
 delete mode 100644 drivers/cpufreq/exynos-cpufreq.h
 delete mode 100644 drivers/cpufreq/exynos4210-cpufreq.c
 delete mode 100644 drivers/cpufreq/exynos4x12-cpufreq.c
 delete mode 100644 drivers/cpufreq/exynos5250-cpufreq.c
