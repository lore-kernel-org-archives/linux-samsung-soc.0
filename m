From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/6] clk: samsung: exynos5410: Add TMU clock
Date: Tue, 31 May 2016 20:39:01 +0200
Message-ID: <1464719945-3417-2-git-send-email-krzk@kernel.org>
References: <1464719945-3417-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464719945-3417-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Javier Martinez Canillas <javier@osg.samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Add clock for TMU to the Exynos5410 clock driver.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/samsung/clk-exynos5410.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/samsung/clk-exynos5410.c b/drivers/clk/samsung/clk-exynos5410.c
index 6c2e59c576ee..db9978dc6e83 100644
--- a/drivers/clk/samsung/clk-exynos5410.c
+++ b/drivers/clk/samsung/clk-exynos5410.c
@@ -160,6 +160,7 @@ static struct samsung_div_clock exynos5410_div_clks[] __initdata = {
 static struct samsung_gate_clock exynos5410_gate_clks[] __initdata = {
 	GATE(CLK_MCT, "mct", "aclk66", GATE_IP_PERIS, 18, 0, 0),
 	GATE(CLK_RTC, "rtc", "aclk66", GATE_IP_PERIS, 20, 0, 0),
+	GATE(CLK_TMU, "tmu", "aclk66", GATE_IP_PERIS, 21, 0, 0),
 
 	GATE(CLK_SCLK_MMC0, "sclk_mmc0", "div_mmc_pre0",
 			SRC_MASK_FSYS, 0, CLK_SET_RATE_PARENT, 0),
-- 
2.7.4
