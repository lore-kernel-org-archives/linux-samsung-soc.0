From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v4 00/13] clk: samsung: Add the support for exynos5433 clocks
Date: Mon, 02 Feb 2015 22:01:01 +0900
Message-ID: <1422882074-19758-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:23589 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932985AbbBBNBR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Feb 2015 08:01:17 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com, mturquette@linaro.org
Cc: kgene@kernel.org, pankaj.dubey@samsung.com, sangbae90.lee@samsung.com, inki.dae@samsung.com, chanho61.park@samsung.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

This patchset adds the support for Exynos5433 CMU (Clock Management Unit)
by using common clock framework. This patchset is divided from patch[1]
and then sent it.
[1] https://lkml.org/lkml/2014/12/2/134

Changelog:

Changes from v3:
- Use 'oscclk' clock name instead of 'fin_pll'
- Add the clock dependencies between clock domains on first patch of this patch-set

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

Chanwoo Choi (13):
  clk: samsung: exynos5433: Add binding document for Exynos5433 clock domains
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

 .../devicetree/bindings/clock/exynos5433-clock.txt |  258 ++
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-exynos5433.c               | 3395 ++++++++++++++++++++
 include/dt-bindings/clock/exynos5433.h             |  857 +++++
 4 files changed, 4511 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/exynos5433-clock.txt
 create mode 100644 drivers/clk/samsung/clk-exynos5433.c
 create mode 100644 include/dt-bindings/clock/exynos5433.h

-- 
1.8.5.5
