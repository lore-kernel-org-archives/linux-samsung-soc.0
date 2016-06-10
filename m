From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 1/3] clk: samsung: exynos5433: Add CLK_IGNORE_UNUSED flag for
 AUD Uart
Date: Fri, 10 Jun 2016 13:56:30 +0900
Message-ID: <1465534592-18860-2-git-send-email-cw00.choi@samsung.com>
References: <1465534592-18860-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1465534592-18860-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, kgene@kernel.org, k.kozlowski@samsung.com, jh80.chung@samsung.com, jonghwa3.lee@samsung.com, beomho.seo@samsung.com, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Beomho Seo <beomho.seo@samsung.com>

This patch adds the CLK_IGNORE_UNUSED flag for sclk_aud_uart gate clock
for uart3 opeation.

Signed-off-by: Beomho Seo <beomho.seo@samsung.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 128527b8fbeb..e1a9c24079a4 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -2976,7 +2976,7 @@ static struct samsung_gate_clock aud_gate_clks[] __initdata = {
 	GATE(CLK_SCLK_AUD_SLIMBUS, "sclk_aud_slimbus", "div_sclk_aud_slimbus",
 			ENABLE_SCLK_AUD1, 4, 0, 0),
 	GATE(CLK_SCLK_AUD_UART, "sclk_aud_uart", "div_sclk_aud_uart",
-			ENABLE_SCLK_AUD1, 3, 0, 0),
+			ENABLE_SCLK_AUD1, 3, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_SCLK_AUD_PCM, "sclk_aud_pcm", "div_sclk_aud_pcm",
 			ENABLE_SCLK_AUD1, 2, 0, 0),
 	GATE(CLK_SCLK_I2S_BCLK, "sclk_i2s_bclk", "ioclk_i2s_bclk",
-- 
1.9.1

