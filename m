From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v3 9/9] clk: samsung: Add CLKOUT driver support for Exynos5433
 SoC.
Date: Tue, 03 Feb 2015 09:13:57 +0900
Message-ID: <1422922437-7414-10-git-send-email-cw00.choi@samsung.com>
References: <1422922437-7414-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1422922437-7414-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com, mturquette@linaro.org
Cc: kgene@kernel.org, pankaj.dubey@samsung.com, inki.dae@samsung.com, chanho61.park@samsung.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Inha Song <ideal.song@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Inha Song <ideal.song@samsung.com>

This patch add CLKOUT driver support for Exynos5433 SoC.

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
