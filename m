From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v3 05/10] clk: samsung: exynos5433: Fix wrong PMS value of
 exynos5433_pll_rates
Date: Mon, 27 Apr 2015 20:36:32 +0900
Message-ID: <1430134597-14668-6-git-send-email-cw00.choi@samsung.com>
References: <1430134597-14668-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1430134597-14668-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com, mturquette@linaro.org
Cc: kgene@kernel.org, inki.dae@samsung.com, chanho61.park@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch fixes the wrong PMS value of exynos5433_pll_rates table
for {ATLAS|APOLLO|MEM0|MEM1|BUS|MFC|MPHY|G3D|DISP|ISP|_PLL.
- 720 MHz (mdiv=360, pdiv=6, sdiv=1) -> 700 MHz (mdiv=175, pdiv=3, sdiv=1)
- 350 MHz (mdiv=360, pdiv=6, sdiv=2) -> (mdiv=350, pdiv=6, sdiv=2)
- 133 MHz (mdiv=552, pdiv=6, sdiv=4) -> (mdiv=532, pdiv=6, sdiv=4)

Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index ec29426..9e04ae2 100644
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
@@ -760,14 +760,14 @@ static struct samsung_pll_rate_table exynos5443_pll_rates[] = {
 	PLL_35XX_RATE(444000000U,  370, 5,  2),
 	PLL_35XX_RATE(420000000U,  350, 5,  2),
 	PLL_35XX_RATE(400000000U,  400, 6,  2),
-	PLL_35XX_RATE(350000000U,  360, 6,  2),
+	PLL_35XX_RATE(350000000U,  350, 6,  2),
 	PLL_35XX_RATE(333000000U,  222, 4,  2),
 	PLL_35XX_RATE(300000000U,  500, 5,  3),
 	PLL_35XX_RATE(266000000U,  532, 6,  3),
 	PLL_35XX_RATE(200000000U,  400, 6,  3),
 	PLL_35XX_RATE(166000000U,  332, 6,  3),
 	PLL_35XX_RATE(160000000U,  320, 6,  3),
-	PLL_35XX_RATE(133000000U,  552, 6,  4),
+	PLL_35XX_RATE(133000000U,  532, 6,  4),
 	PLL_35XX_RATE(100000000U,  400, 6,  4),
 	{ /* sentinel */ }
 };
-- 
1.8.5.5
