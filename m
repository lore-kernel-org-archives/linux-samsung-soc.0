From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v3 00/12] clk: samsung: Add the support for exynos5433 clocks
Date: Wed, 21 Jan 2015 15:26:49 +0900
Message-ID: <1421821618-8627-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: mturquette@linaro.org, kgene@kernel.org, pankaj.dubey@samsung.com, inki.dae@samsung.com, chanho61.park@samsung.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This patchset adds the support for Exynos5433 CMU (Clock Management Unit)
by using common clock framework. This patchset is divided from patch[1]
and then sent it.
[1] https://lkml.org/lkml/2014/12/2/134

Changelog:

Changes from v2:
- Fix the parent clock of sclk_bus_pll/sclk_mfc_pll clock on CMU_MIF domain
- Fix wrong clock name of 'phyclk_usbdrd30_udrd30_{pipe_pclk|phyclock}_phy' clock
- Add the clock id for CMU_FSYS fixed clock
- Fix wrong bit width of CLK_DIV_SCLK_SCI clock on CMU_PERIC domain
- Remove duplicat parent clocks on CMU_DISP/CMU_AUD domains
- Fix typo on patch descriptions
- Fix wrong fixed rate on CMU_AUD domain (ioclk_{jtag_|slimbus_|i2s_b}clk)
- Add CLK_IGNORE_UNUSED flag to 'aclk_dmac/sclk_aud_i2s' clock for audio subsystem
- Fix the parent clock of mout_aclk_fsys_200_user clock from aclk_fsys_200 to div_aclk_fsys_200

Changes from v1:
- Fix wrong register and code clean by using space instead of tab [Pankaj]
- Add CLK_IGNORE_UNUSED flag to pclk_sysreg_* clock for accessing system control register
- Remove duplicate definition on the patch for CMU_BUS{0|1|2} domain

Chanwoo Choi (12):
  clk: samsung: exynos5433: Add clocks using common clock framework
  clk: samsung: exynos5433: Add MUX clocks of CMU_TOP domain
  clk: samsung: exynos5433: Add clocks for CMU_PERIC domain
  clk: samsung: exynos5433: Add clocks for CMU_PERIS domain
  clk: samsung: exynos5433: Add clocks for CMU_G2D domain
  clk: samsung: exynos5433: Add clocks for CMU_MIF domain
  clk: samsung: exynos5433: Add clocks for CMU_DISP domain
  clk: samsung: exynos5433: Add clocks for CMU_AUD domain
  clk: samsung: exynos5433: Add clocks for CMU_BUS{0|1|2} domains
  clk: samsung: exynos5433: Add missing clocks for CMU_FSYS domain
  clk: samsung: exynos5433: Add clocks for CMU_G3D domain
  clk: samsung: exynos5433: Add clocks for CMU_GSCL domain

 .../devicetree/bindings/clock/exynos5433-clock.txt |  167 +
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-exynos5433.c               | 3395 ++++++++++++++++++++
 include/dt-bindings/clock/exynos5433.h             |  857 +++++
 4 files changed, 4420 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/exynos5433-clock.txt
 create mode 100644 drivers/clk/samsung/clk-exynos5433.c
 create mode 100644 include/dt-bindings/clock/exynos5433.h

-- 
1.8.5.5
