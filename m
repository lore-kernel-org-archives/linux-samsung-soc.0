From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v3 07/10] clk: samsung: exynos5433: Add DIV_CPIF to store it
 when the board is being suspended
Date: Mon, 27 Apr 2015 20:36:34 +0900
Message-ID: <1430134597-14668-8-git-send-email-cw00.choi@samsung.com>
References: <1430134597-14668-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1430134597-14668-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com, mturquette@linaro.org
Cc: kgene@kernel.org, inki.dae@samsung.com, chanho61.park@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Hyungwon Hwang <human.hwang@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Hyungwon Hwang <human.hwang@samsung.com>

This register must be stored when the device is suspended, and must be restored
when it is back. This patch adds the register to the list of storing registers.

Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index e4a6771..5d8b4a8 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -835,6 +835,7 @@ static unsigned long cpif_clk_regs[] __initdata = {
 	MPHY_PLL_CON1,
 	MPHY_PLL_FREQ_DET,
 	MUX_SEL_CPIF0,
+	DIV_CPIF,
 	ENABLE_SCLK_CPIF,
 };
 
-- 
1.8.5.5
