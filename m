From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 9/9] clk: samsung: Add CLKOUT driver support for Exynos5433 SoC.
Date: Thu, 22 Jan 2015 08:44:38 +0900
Message-ID: <1421883878-4980-10-git-send-email-cw00.choi@samsung.com>
References: <1421883878-4980-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:21108 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753341AbbAUXom (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Jan 2015 18:44:42 -0500
In-reply-to: <1421883878-4980-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com, mturquette@linaro.org
Cc: kgene@kernel.org, pankaj.dubey@samsung.com, inki.dae@samsung.com, chanho61.park@samsung.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Inha Song <ideal.song@samsung.com>

From: Inha Song <ideal.song@samsung.com>

This patch add CLKOUT driver support for Exynos5433 SoC.

Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>
Signed-off-by: Inha Song <ideal.song@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/clk/samsung/clk-exynos-clkout.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
index 3a7cb25..1eb16b8 100644
--- a/drivers/clk/samsung/clk-exynos-clkout.c
+++ b/drivers/clk/samsung/clk-exynos-clkout.c
@@ -151,3 +151,5 @@ CLK_OF_DECLARE(exynos5250_clkout, "samsung,exynos5250-pmu",
 		exynos5_clkout_init);
 CLK_OF_DECLARE(exynos5420_clkout, "samsung,exynos5420-pmu",
 		exynos5_clkout_init);
+CLK_OF_DECLARE(exynos5433_clkout, "samsung,exynos5433-pmu",
+		exynos5_clkout_init);
-- 
1.8.5.5
