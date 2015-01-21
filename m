From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 0/9] clk: samsung: Add clocks for remaining domains of
 Exynos5433
Date: Thu, 22 Jan 2015 08:44:29 +0900
Message-ID: <1421883878-4980-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:54584 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753186AbbAUXom (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Jan 2015 18:44:42 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com, mturquette@linaro.org
Cc: kgene@kernel.org, pankaj.dubey@samsung.com, inki.dae@samsung.com, chanho61.park@samsung.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

This patchset adds the support for following clock domains of Exynos5433
and clkout drvier.

Following clock domains has clocks for each IP.
- CMU_APOLLO : clocks for Cortex-A53 Quad-core processor.
- CMU_ATLAS  : clocks for Cortex-A57 Quad-core processor, CoreSight and
               L2 cache controller.
- CMU_MSCL   : clocks for M2M (Memory to Memory) scaler and JPEG IPs.
- CMU_MFC    : clocks for MFC (Multi-Format Codec) IP.
- CMU_HEVC   : clocks for HEVC(High Efficiency Video Codec) decoder IP.
- CMU_ISP    : clocks for FIMC-ISP/DRC/SCLC/DIS/3DNR IPs.
- CMU_CAM0   : clocks for MIPI_CSIS{0|1}/FIMC_LITE_{A|B|D}/FIMC_3AA{0|1} IPs.
- CMU_CAM1   : clocks for COrtex-A5/MIPI_CSIS2/FIMC_LITE_C/FIMC-FD IPs.

Depend on:
[PATCH v3 00/12] clk: samsung: Add the support for exynos5433 clocks
- https://lkml.org/lkml/2015/1/21/44

Chanwoo Choi (8):
  clk: samsung: exynos5433: Add clocks for CMU_APOLLO domain
  clk: samsung: exynos5433: Add clocks for CMU_ATLAS domain
  clk: samsung: exynos5433: Add clocks for CMU_MSCL domain
  clk: samsung: exynos5433: Add clocks for CMU_MFC domain
  clk: samsung: exynos5433: Add clocks for CMU_HEVC domain
  clk: samsung: exynos5433: Add clocks for CMU_ISP domain
  clk: samsung: exynos5433: Add clocks for CMU_CAM0 domain
  clk: samsung: exynos5433: Add clocks for CMU_CAM1 domain

Inha Song (1):
  clk: samsung: Add CLKOUT driver support for Exynos5433 SoC.

 .../devicetree/bindings/clock/exynos5433-clock.txt |   66 +
 drivers/clk/samsung/clk-exynos-clkout.c            |    2 +
 drivers/clk/samsung/clk-exynos5433.c               | 2028 ++++++++++++++++++++
 include/dt-bindings/clock/exynos5433.h             |  548 +++++-
 4 files changed, 2643 insertions(+), 1 deletion(-)

-- 
1.8.5.5
