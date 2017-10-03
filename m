From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 0/9] Various cleanups for Samsung clocks drivers
Date: Tue, 03 Oct 2017 12:00:07 +0200
Message-ID: <20171003100016.32029-1-m.szyprowski@samsung.com>
References: <CGME20171003100028eucas1p11057e4643675c66f6144d0737e8b933a@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:51414 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751354AbdJCKAc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Oct 2017 06:00:32 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi!

While touching Samsung clock drivers I found that there is still some
legacy code left. This patchset is a quick cleanup of the issues I've
noticed so far. The most significant change is removal clkdev alias
support from generic macros used for instantiating all the clocks in
the Samsung drivers. This should reduce the total size of the clock init
structures. Required clkdev aliases can be still created using
samsung_clk_register_alias() function if given platform still needs
them.

Patches have been generated on top of linux-next with "clk: samsung:
Properly propagate flags in __PLL macro" patch applied.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Patch summary:

Marek Szyprowski (9):
  clk: samsung: Remove support for obsolete Exynos4212 CPU clock
  clk: samsung: Remove clkdev alias support in Exynos4 clk driver
  clk: samsung: Remove double assignment to CLK_ARM_CLK id in Exynos4
    driver
  clk: samsung: Remove clkdev alias support in Exynos5250 clk driver
  clk: samsung: Drop useless alias in Exynos5420 clk driver
  clk: samsung: Rework clkdev alias handling in Exynos5440 driver
  clk: samsung: Rework clkdev alias handling in S3C2443 driver
  clk: samsung: Add explicit MPLL and EPLL clkdev aliases in S3C2443
    driver
  clk: samsung: Remove obsolete clkdev alias support

 drivers/clk/samsung/clk-exynos4.c    | 82 +++++++-----------------------------
 drivers/clk/samsung/clk-exynos5250.c | 18 ++++----
 drivers/clk/samsung/clk-exynos5420.c |  3 +-
 drivers/clk/samsung/clk-exynos5440.c | 12 +++++-
 drivers/clk/samsung/clk-pll.c        |  9 ----
 drivers/clk/samsung/clk-s3c2443.c    | 16 ++++---
 drivers/clk/samsung/clk.c            | 33 ++-------------
 drivers/clk/samsung/clk.h            | 71 ++++++-------------------------
 include/dt-bindings/clock/s3c2443.h  |  2 +
 9 files changed, 62 insertions(+), 184 deletions(-)

-- 
2.14.2
