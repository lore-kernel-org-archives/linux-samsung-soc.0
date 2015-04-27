From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v3 03/10] clk: samsung: exynos5433: Fix
 CLK_PCLK_MONOTONIC_CNT's register correctly.
Date: Mon, 27 Apr 2015 20:36:30 +0900
Message-ID: <1430134597-14668-4-git-send-email-cw00.choi@samsung.com>
References: <1430134597-14668-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1430134597-14668-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com, mturquette@linaro.org
Cc: kgene@kernel.org, inki.dae@samsung.com, chanho61.park@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jonghwa Lee <jonghwa3.lee@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Jonghwa Lee <jonghwa3.lee@samsung.com>

CLK_PCLK_MONOTONIC_CNT's register is now assigned with wrong one.
Its correct register is ENABLE_PCLK_MIF_SECURE_MONOTONIC_CNT.

Signed-off-by: Jonghwa Lee <jonghwa3.lee@samsung.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 543f9c7..b1a546e 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -1490,7 +1490,7 @@ static struct samsung_gate_clock mif_gate_clks[] __initdata = {
 
 	/* ENABLE_PCLK_MIF_SECURE_MONOTONIC_CNT */
 	GATE(CLK_PCLK_MONOTONIC_CNT, "pclk_monotonic_cnt", "div_aclk_mif_133",
-			ENABLE_PCLK_MIF_SECURE_RTC, 0, 0, 0),
+			ENABLE_PCLK_MIF_SECURE_MONOTONIC_CNT, 0, 0, 0),
 
 	/* ENABLE_PCLK_MIF_SECURE_RTC */
 	GATE(CLK_PCLK_RTC, "pclk_rtc", "div_aclk_mif_133",
-- 
1.8.5.5
