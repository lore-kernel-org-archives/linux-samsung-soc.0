From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 0/7] clk: samsung: fix PLL rates
Date: Fri, 16 Feb 2018 15:57:47 +0100
Message-ID: <20180216145754.14428-1-a.hajda@samsung.com>
References: <CGME20180216145803eucas1p2b75e6f26d2979ee129152f674a31e886@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:38042 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755594AbeBPO6L (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Feb 2018 09:58:11 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, "moderated list:SAMSUNG SOC CLOCK
        DRIVERS" <linux-samsung-soc@vger.kernel.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>

Hi,

This patchset fixes PLL clock rates in all Samsung PLLs, moreover it adds
compile time validators to avoid such mistakes in the future.
The patchset has been compile tested for all variants, and runtime tested on
TM2 and Odroid XU3.

v2:
- modified commit message of patches 1-6/7,
- rebased,
- added Acks,
- patch is the same as v2 already posted in prev thread (except rebase changes).

Regards
Andrzej


Andrzej Hajda (7):
  clk: samsung: exynos3250: fix PLL rates
  clk: samsung: exynos5250: fix PLL rates
  clk: samsung: exynos5260: fix PLL rates
  clk: samsung: exynos5433: fix PLL rates
  clk: samsung: exynos7: fix PLL rates
  clk: samsung: s3c2410: fix PLL rates
  clk: samsung: add compile time PLL rate validators

 drivers/clk/samsung/clk-exynos3250.c | 114 +++++++++++++++++-----------------
 drivers/clk/samsung/clk-exynos4.c    | 102 +++++++++++++++---------------
 drivers/clk/samsung/clk-exynos5250.c |  54 ++++++++--------
 drivers/clk/samsung/clk-exynos5260.c |  90 +++++++++++++--------------
 drivers/clk/samsung/clk-exynos5410.c |  20 +++---
 drivers/clk/samsung/clk-exynos5420.c |  62 +++++++++----------
 drivers/clk/samsung/clk-exynos5433.c | 116 +++++++++++++++++------------------
 drivers/clk/samsung/clk-exynos7.c    |   2 +-
 drivers/clk/samsung/clk-pll.h        |  48 ++++++++++++---
 drivers/clk/samsung/clk-s3c2410.c    | 108 ++++++++++++++++----------------
 10 files changed, 372 insertions(+), 344 deletions(-)

-- 
2.16.1
