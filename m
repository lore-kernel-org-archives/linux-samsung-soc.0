From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2] clk: exynos5433: Extend list of available AUD_PLL output
 frequencies
Date: Mon, 12 Feb 2018 16:52:27 +0100
Message-ID: <20180212155227.20605-1-s.nawrocki@samsung.com>
References: <CGME20180212155239epcas2p34dad3d106036f65e5ee566a593a983e3@epcas2p3.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:15767 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753604AbeBLPwm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 12 Feb 2018 10:52:42 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-clk@vger.kernel.org
Cc: sboyd@codeaurora.org, mturquette@baylibre.com, linux-samsung-soc@vger.kernel.org, cw00.choi@samsung.com, linux-kernel@vger.kernel.org, krzk@kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

Add one more entry to the exynos5433_aud_pll_rates table, this allows
to support audio sample rates: 48000, 96000, 192000 Hz with minimum
error. The M, P, S, K values re confirmed by the HW team.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index ebd18586e325..b08a9028653f 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -765,6 +765,7 @@ static const struct samsung_pll_rate_table exynos5433_aud_pll_rates[] __initcons
 	PLL_36XX_RATE(294912000U,  98, 1, 3,  19923),
 	PLL_36XX_RATE(288000000U,  96, 1, 3,      0),
 	PLL_36XX_RATE(252000000U,  84, 1, 3,      0),
+	PLL_36XX_RATE(196608001U, 197, 3, 3, -25690),
 	{ /* sentinel */ }
 };

--
2.14.2
