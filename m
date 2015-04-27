From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v3 04/10] clk: samsung: exynos5433: Fix wrong parent clock of
 sclk_apollo clock
Date: Mon, 27 Apr 2015 20:36:31 +0900
Message-ID: <1430134597-14668-5-git-send-email-cw00.choi@samsung.com>
References: <1430134597-14668-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:55099 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932624AbbD0Lib (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Apr 2015 07:38:31 -0400
In-reply-to: <1430134597-14668-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com, mturquette@linaro.org
Cc: kgene@kernel.org, inki.dae@samsung.com, chanho61.park@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

This patch fixes the wrong parent clock of sclk_apollo clock
from 'div_apollo_pll' to 'div_apollo2'.

Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index b1a546e..ec29426 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -3665,7 +3665,7 @@ static struct samsung_gate_clock apollo_gate_clks[] __initdata = {
 			ENABLE_SCLK_APOLLO, 3, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_SCLK_HPM_APOLLO, "sclk_hpm_apollo", "div_sclk_hpm_apollo",
 			ENABLE_SCLK_APOLLO, 1, CLK_IGNORE_UNUSED, 0),
-	GATE(CLK_SCLK_APOLLO, "sclk_apollo", "div_apollo_pll",
+	GATE(CLK_SCLK_APOLLO, "sclk_apollo", "div_apollo2",
 			ENABLE_SCLK_APOLLO, 0, CLK_IGNORE_UNUSED, 0),
 };
 
-- 
1.8.5.5
