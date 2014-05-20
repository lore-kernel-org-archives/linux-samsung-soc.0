From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 0/4] Add support for Exynos clock output configuration
Date: Tue, 20 May 2014 18:43:27 +0200
Message-ID: <1400604211-9447-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Pankaj Dubey <pankaj.dubey@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, Mark Brown <broonie@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Tomasz Figa <t.figa@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On all Exynos SoCs there is a dedicated CLKOUT pin that allows many of
internal SoC clocks to be output from the SoC. The hardware structure
of CLKOUT related clocks looks as follows:

	CMU	|---> clock0 --------->	|	PMU	|
		|			|		|
    several	|---> clock1 ---------> |	mux	|
    muxes	|			|	+	|---> CLKOUT
    dividers	|       ...		|	gate	|
    and gates	|			|		|
		|---> clockN ---------> |		|

Since the block responsible for handling the pin is PMU, not CMU,
a separate driver, that binds to PMU node is required and acquires
all input clocks by standard DT clock look-up. This way we don't need
any cross-IP block drivers and cross-driver register sharing or
nodes for fake devices.

To represent the PMU mux/gate clock, generic composite clock is registered.

Tested on Odroid U3, with HSIC/USB hub using CLKOUT as reference clock,
with some additional patches.

Depends on:
[PATCHv5 0/4] Enable usbphy and hsotg for exynos4
(No link, sorry, I could not find it in any archive yet...)
for Exynos4210/4x12 PMU binding and DT nodes.

Changes since RFC v1:
(https://lkml.org/lkml/2014/5/15/506)
 - rebased onto v5 of "Enable usbphy and hsotg for exynos4" series and
   current HEAD of samsung-clk tree,
 - added handling of suspend/resume in the driver,
 - added missing CPU clocks on Exynos4,
 - added CLK_SET_RATE_PARENT to CMU CLKOUT gates on Exynos4,
 - fixed bit field width on Exynos4,
 - added CLKOUT CMU registers of Exynos4 to save/restore list,
 - added CLK_SET_RATE_PARENT and CLK_SET_RATE_NO_REPARENT to clkout clock,
 - changed the binding to use 1-cell clock specifier to allow extension
   with further PMU clocks in future, if needed.

Tomasz Figa (4):
  clk: samsung: exynos4: Add missing CPU/DMC clock hierarchy
  clk: samsung: exynos4: Add CLKOUT clock hierarchy
  clk: samsung: Add driver to control CLKOUT line on Exynos SoCs
  ARM: dts: exynos: Update PMU node with CLKOUT related data

 .../devicetree/bindings/arm/samsung/pmu.txt        |  30 ++++
 arch/arm/boot/dts/exynos4.dtsi                     |   1 +
 arch/arm/boot/dts/exynos4210.dtsi                  |   9 ++
 arch/arm/boot/dts/exynos4x12.dtsi                  |   6 +
 arch/arm/boot/dts/exynos5250.dtsi                  |   3 +
 arch/arm/boot/dts/exynos5420.dtsi                  |   3 +
 drivers/clk/samsung/Makefile                       |   1 +
 drivers/clk/samsung/clk-exynos-clkout.c            | 153 ++++++++++++++++++
 drivers/clk/samsung/clk-exynos4.c                  | 173 +++++++++++++++++++++
 include/dt-bindings/clock/exynos4.h                |   6 +
 10 files changed, 385 insertions(+)
 create mode 100644 drivers/clk/samsung/clk-exynos-clkout.c

-- 
1.9.3
