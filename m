From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v2 5/6] clk: samsung: exynos5433: Fix wrong PMS value of
 exynos5433_pll_rates
Date: Fri, 03 Apr 2015 09:29:10 +0900
Message-ID: <1428020951-30428-6-git-send-email-cw00.choi@samsung.com>
References: <1428020951-30428-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1428020951-30428-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com, mturquette@linaro.org
Cc: kgene@kernel.org, inki.dae@samsung.com, chanho61.park@samsung.com, cw00.choi@samsung.com, jonghwa3.lee@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch fixes the wrong PMS value of exynos5433_pll_rates table
for {ATLAS|APOLLO|MEM0|MEM1|BUS|MFC|MPHY|G3D|DISP|ISP|_PLL.
- before : rate=720000000 (mdiv=360, pdiv=6, sdiv=1)
- after  : rate=700000000 (mdiv=175, pdiv=3, sdiv=1)

Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index ec29426..44f3dd5 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -748,7 +748,7 @@ static struct samsung_pll_rate_table exynos5443_pll_rates[] = {
 	PLL_35XX_RATE(825000000U,  275, 4,  1),
 	PLL_35XX_RATE(800000000U,  400, 6,  1),
 	PLL_35XX_RATE(733000000U,  733, 12, 1),
-	PLL_35XX_RATE(700000000U,  360, 6,  1),
+	PLL_35XX_RATE(700000000U,  175, 3,  1),
 	PLL_35XX_RATE(667000000U,  222, 4,  1),
 	PLL_35XX_RATE(633000000U,  211, 4,  1),
 	PLL_35XX_RATE(600000000U,  500, 5,  2),
-- 
1.8.5.5
