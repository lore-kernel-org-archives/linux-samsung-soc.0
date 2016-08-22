From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 2/5] clk: samsung: exynos5410: Expose the peripheral DMA gate
 clocks
Date: Mon, 22 Aug 2016 18:31:00 +0200
Message-ID: <1471883463-1950-3-git-send-email-s.nawrocki@samsung.com>
References: <1471883463-1950-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1471883463-1950-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-clk@vger.kernel.org
Cc: tomasz.figa@gmail.com, sboyd@codeaurora.org, mturquette@baylibre.com, kgene@kernel.org, k.kozlowski@samsung.com, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

These clocks are needed in order to use the PL330 peripheral
DMA controllers.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/clk/samsung/clk-exynos5410.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos5410.c b/drivers/clk/samsung/clk-exynos5410.c
index 54ec486..cf6fb41 100644
--- a/drivers/clk/samsung/clk-exynos5410.c
+++ b/drivers/clk/samsung/clk-exynos5410.c
@@ -176,6 +176,8 @@ static const struct samsung_gate_clock exynos5410_gate_clks[] __initconst = {
 	GATE(CLK_MMC0, "sdmmc0", "aclk200", GATE_BUS_FSYS0, 12, 0, 0),
 	GATE(CLK_MMC1, "sdmmc1", "aclk200", GATE_BUS_FSYS0, 13, 0, 0),
 	GATE(CLK_MMC2, "sdmmc2", "aclk200", GATE_BUS_FSYS0, 14, 0, 0),
+	GATE(CLK_PDMA1, "pdma1", "aclk200", GATE_BUS_FSYS0, 2, 0, 0),
+	GATE(CLK_PDMA0, "pdma0", "aclk200", GATE_BUS_FSYS0, 1, 0, 0),
 
 	GATE(CLK_SCLK_USBPHY301, "sclk_usbphy301", "dout_usbphy301",
 	     GATE_TOP_SCLK_FSYS, 7, CLK_SET_RATE_PARENT, 0),
-- 
1.9.1

