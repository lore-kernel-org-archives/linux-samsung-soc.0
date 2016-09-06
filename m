From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 0/7] clk/samsung: exynos5410: Add sound subsystem related
 clocks
Date: Tue, 06 Sep 2016 14:04:49 +0200
Message-ID: <1473163496-17820-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:39072 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753456AbcIFMFc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 6 Sep 2016 08:05:32 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: b.zolnierkie@samsung.com, krzk@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

This patch adds support for the EPLL and the peripheral DMA clocks required
for sound support on Odroid-XU board.

The clk-exynos-audss driver has been reworked to support
"samsung,exynos5412-audss-clock" compatible.

This series also includes a cleanup patch consolidating the PLL clocks
code, i.e. switching exynos5440 to use common code.

Sylwester Nawrocki (7):
  clk: samsung: exynos5410: Add clock IDs for PDMA and EPLL clocks
  clk: samsung: exynos5410: Expose the peripheral DMA gate clocks
  clk: samsung: Use common registration function for pll2550x
  clk: samsung: Add support for EPLL on exynos5410
  clk: samsung: clk-exynos-audss: controller variant handling rework
  clk: samsung: clk-exynos-audss: Add exynos5410 compatible
  clk: samsung: clk-exynos-audss: Whitespace and debug trace cleanup

 .../devicetree/bindings/clock/clk-exynos-audss.txt |   4 +-
 .../devicetree/bindings/clock/exynos5410-clock.txt |  21 +--
 drivers/clk/samsung/clk-exynos-audss.c             |  84 ++++++-----
 drivers/clk/samsung/clk-exynos5410.c               |  32 ++++-
 drivers/clk/samsung/clk-exynos5440.c               |   9 +-
 drivers/clk/samsung/clk-pll.c                      | 154 ++++++++++++++-------
 drivers/clk/samsung/clk-pll.h                      |   2 +
 include/dt-bindings/clock/exynos5410.h             |   3 +
 include/dt-bindings/clock/exynos5440.h             |   2 +
 9 files changed, 217 insertions(+), 94 deletions(-)

--
1.9.1
