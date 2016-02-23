From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 0/6] clk/samsung: exynos5433 clk fixes
Date: Tue, 23 Feb 2016 13:14:26 +0100
Message-ID: <1456229672-13445-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:49014 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750740AbcBWMRz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Feb 2016 07:17:55 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: tomasz.figa@gmail.com, mturquette@baylibre.com, sboyd@codeaurora.org, jonghwa3.lee@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

This short series includes corrections of the exynos5433 clock
definitions and minor clean up of the registers save/restore code.

Jonghwa Lee (1):
  clk: samsung: exynos5433: Fix wrong registers of PCLK_GSCL_SMMU clocks

Marek Szyprowski (1):
  clk: samsung: exynos5433: Fix definitions of SCLK ISP SENSOR0 clocks

Sylwester Nawrocki (4):
  clk: samsung: exynos5433: Fix typos in *_ISP_MPWM clock names
  clk: samsung: exynos5433: Fix definitions of MUX_SEL_CAM04 clocks
  clk: samsung: exynos5433: Drop RO registers from the save/restore
    lists
  clk: samsung: exynos5433: Fix mout_aclk_cam1*_user clocks definition

 drivers/clk/samsung/clk-exynos5433.c   | 130 ++++-----------------------------
 include/dt-bindings/clock/exynos5433.h |   2 +-
 2 files changed, 16 insertions(+), 116 deletions(-)

--
1.9.1
