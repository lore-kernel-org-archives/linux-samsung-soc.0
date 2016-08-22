From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 0/5] clk/samsung: Add support for PDMA,
 EPLL clocks on exynos5410
Date: Mon, 22 Aug 2016 18:30:58 +0200
Message-ID: <1471883463-1950-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:33733 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755216AbcHVQdN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 22 Aug 2016 12:33:13 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-clk@vger.kernel.org
Cc: tomasz.figa@gmail.com, sboyd@codeaurora.org, mturquette@baylibre.com, kgene@kernel.org, k.kozlowski@samsung.com, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

This patch adds support for the EPLL and the peripheral DMA clocks
on Exynos5410 SoC.  These clocks are required for sound support
on Odroid-XU board.

Sylwester Nawrocki (5):
  clk: samsung: exynos5410: Add clock IDs for PDMA and EPLL clocks
  clk: samsung: exynos5410: Expose the peripheral DMA gate clocks
  clk: samsung: Use common registration function for pll2550x
  clk: samsung: Add support for EPLL on exynos5410
  clk: samsung: Add support for exynos5410 AUDSS clock controller

 .../devicetree/bindings/clock/clk-exynos-audss.txt |   4 +-
 .../devicetree/bindings/clock/exynos5410-clock.txt |  14 ++
 drivers/clk/samsung/clk-exynos-audss.c             |  78 ++++++-----
 drivers/clk/samsung/clk-exynos5410.c               |  32 ++++-
 drivers/clk/samsung/clk-exynos5440.c               |   9 +-
 drivers/clk/samsung/clk-pll.c                      | 154 ++++++++++++++-------
 drivers/clk/samsung/clk-pll.h                      |   2 +
 include/dt-bindings/clock/exynos5410.h             |   3 +
 include/dt-bindings/clock/exynos5440.h             |   2 +
 9 files changed, 212 insertions(+), 86 deletions(-)

--
1.9.1
