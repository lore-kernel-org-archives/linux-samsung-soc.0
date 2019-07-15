From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 00/50] Exynos5x clocks and buses changes
Date: Mon, 15 Jul 2019 14:43:27 +0200
Message-ID: <20190715124417.4787-1-l.luba@partner.samsung.com>
References: <CGME20190715124433eucas1p2a292f236ea55751117836742c1ca5d23@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi all,

The patch set fixes clock settings for the Exynos5420/5422/5800 SoCs which
can be found in Odroid XU3/4, Google Peach Pi. Support for DT board files
with Exynos5420 (like Google Peach Pit) are under development.  The old
implementation did not configure properly the clock rates or the
connections which could cause performance issues or instability.  The
Exynos5x SoC has complex clocks topology. Some of the NoC clock branches
provide clock to the device internal buses or AXI interface and had wrong
settings.

In the old configuration the OPP values where not reflecting the actually
set frequencies, which were possible by setting the divider value on the
clock tree. The algorithms in governors, which use these frequencies,
relied on wrong assumption during their calculations. It also applies to
device drivers code, which does not check the rate of the clock but relay
on OPP values, which in some cases are different.  It is not only the bus
frequency but also the connected component internal buses (accelerators
like e.g. G2D, scaler, rotator) frequency.  Wrong frequency set due to
impossible division from PLL rate caused that some devices had lower than
possible clock for internal logic and for the AXI bus which transfers the
data.  For example fixes for MMC controller, where OPP max frequency
changed from 150MHz to 240MHz, changing the PLL rate to proper value caused
performance increase up to 20% (FSYS2 OPP table).

Affected components inside SoC: image rotator, usb3.0 and 2.0 controller,
jpeg accelerator, image/video scaler, mmc controller, ISP, display
controller, all NoC buses.

Some of the clocks have name which might indicate their max speed, e.g.
CLK_DOUT_ACLK266 but it is not true.  The max speed clock from this example
is 300MHz (according to the RM) and has been reflected accordingly in this
patch set.

Main changes:
- defined new clocks or added IDs to take them from DT nodes
- set proper PLLs frequency for: MPLL, DPLL, which would handle children
  clock requirements down in the tree,
- changed parents of some clocks to proper PLL or to proper parent clock,
- properly calculated OPP values for the buses keeping in mind the parent
  clock frequency and possible values derived from there by one clock
divider with proper bit length indicating maximum allowed divider; thanks
to that it is possible to set the requested frequency in all children
without changing the PLL frequency, which also makes the governor frequency
values assumption true,
- some OPPs were removed because it was not possible to set them due to
  different base frequency, which would require of changing PLL rate, which
might affect other devices connected to this PLL and their misscalculated
rates.

The last two patches touches Exynos5800 and are optional. They have been
checked due to some issues with disabling parent, which accidently was
populated up to MPLL and shut down the PLL. They might be used for testing
on Peach Pi.

The patch set is based on Samsung clock repo and branch 'for-v5.3/next'
[1].

Regards,
Lukasz Luba

[1] https://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git/log/?h=for-v5.3/next

Lukasz Luba (50):
  clk: samsung: add new IDs for Exynos5420 clocks
  clk: samsung: add IDs for Exynos5420 NoC clocks
  clk: samsung: change parent of dout_aclk400_wcore in Exynos5420
  clk: samsung: add IDs to manage aclk400_mscl in Exynos5420
  clk: samsung: add IDs to aclk400_isp in Exynos5420
  clk: samsung: add IDs to ACLK266 clocks in Exynos5420
  clk: samsung: add IDs to ACLK266_G2D clocks in Exynos5420
  clk: samsung: change aclk266_isp clocks definitions Exynos5420
  clk: samsung: add IDs to FSYS clocks in Exynos5x
  clk: samsung: change ACLK100_NOC clocks definitions Exynos5x
  clk: samsung: add IDs to UART clocks in Exynos5420
  clk: add ID to PWM MUX in Exynos5420
  clk: samsung: add DPLL rate table in Exynos5420
  clk: samsung: add CLK_MOUT_SCLK_CPLL in the Exynos5420
  clk: samsung: add MPLL rate table in Exynos5420
  clk: samsung: add SPLL rate table in Exynos5420
  clk: samsung: add CLK_MOUT_MMC0 in the Exynos5420
  ARM: dts: exynos: add bus_isp with OPP table
  ARM: dts: exynos: change OPPs values for FSYS2 in Exynos5420
  ARM: dts: exynos: change and rename FSYS OPP table in Exynos5420
  ARM: dts: exynos: add OPP into FSYS APB bus in Exynos5420
  ARM: dts: exynos: OPPs for bus_disp1 in Exynos5420
  ARM: dts: exynos: change lowest OPP in bus_disp1_fimd in Exynos5420
  ARM: dts: exynos: align OPPs with PLL rate for MSCL in Exynos5420
  ARM: dts: exynos: add 300MHz to bus_disp1_fimd in Exynos5420
  ARM: dts: exynos: align NOC100 bus OPPs in Exynos5420
  ARM: dts: exynos: align bus_wcore OPPs in Exynos5420
  ARM: dts: exynos: change OPPs for g2d and g2d_acp buses in Exynos5420
  ARM: dts: exynos: align OPPs of bus_gen in Exynos5420
  ARM: dts: exynos: add bus_isp266 into Exynos5800
  ARM: dts: exynos: align lowest OPP in bus_jpeg in Exynos5420
  ARM: dts: exynos: remove lowest OPP from bus_mfc in Exynos5420
  ARM: dts: exynos: set parent clocks to UARTs in Exynos5420
  ARM: dts: exynos: set parent clocks to PWM in Exynos5420
  ARM: dts: exynos: change speed and parent of NoC clock in Exynos5420
  ARM: dts: exynos: change ACLK100_NOC config in Exynos5422
  ARM: dts: exynos: change parent and rate of bus_fsys in Exynos5422
  ARM: dts: exynos: change parent and rate of bus_fsys2 in Exynos5422
  ARM: dts: exynos: change parent and rate of bus_fsys_acp in Exynos5422
  ARM: dts: exynos: change parent and rate of bus_gen in Exynos5422
  ARM: dts: exynos: change parent and rate of bus_g2d in Exynos5422
  ARM: dts: exynos: change parent and rate of bus_mscl in Exynos5422
  ARM: dts: exynos: add bus_isp in Exynos5422
  ARM: dts: exynos: change rate of bus_jpeg in Exynos5422
  ARM: dts: exynos: change rate of bus_disp1_fimd in Exynos5422
  ARM: dts: exynos: change rates of bus_disp1 in Exynos5422
  ARM: dts: exynos: change rate of bus_gscl_scaler in Exynos5422
  ARM: dts: exynos: set proper parents to bus_isp266 Exynos5422
  ARM: dts: exynos: add buses support for Exynos5800 Peach Pi
  ARM: dts: exynos: change MMC0 clock parent in Exynos5800 Peach Pi

 arch/arm/boot/dts/exynos5420.dtsi             | 116 +++++++-----
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi |  74 ++++++++
 arch/arm/boot/dts/exynos5800-peach-pi.dts     | 175 ++++++++++++++++++
 arch/arm/boot/dts/exynos5800.dtsi             |  10 +
 drivers/clk/samsung/clk-exynos5420.c          | 109 +++++++----
 include/dt-bindings/clock/exynos5420.h        |  27 ++-
 6 files changed, 429 insertions(+), 82 deletions(-)

-- 
2.17.1
