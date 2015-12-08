From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] clk: samsung: exynos542x: fix MFC clock hierarchy parent
Date: Tue, 08 Dec 2015 14:29:32 +0100
Message-ID: <1449581372-29378-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:15855 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755646AbbLHN3u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Dec 2015 08:29:50 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Proper source for MFC block is mout_user_aclk333 (in datasheet named
USER_MUX_ACLK_333), not the output of CLKDIV_ACLK_333 MUX.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 389af3c15ec4..b2055c4ba237 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -926,7 +926,7 @@ static struct samsung_gate_clock exynos5x_gate_clks[] __initdata = {
 			GATE_BUS_TOP, 13, 0, 0),
 	GATE(0, "aclk166", "mout_user_aclk166",
 			GATE_BUS_TOP, 14, CLK_IGNORE_UNUSED, 0),
-	GATE(0, "aclk333", "mout_aclk333",
+	GATE(0, "aclk333", "mout_user_aclk333",
 			GATE_BUS_TOP, 15, CLK_IGNORE_UNUSED, 0),
 	GATE(0, "aclk400_isp", "mout_user_aclk400_isp",
 			GATE_BUS_TOP, 16, 0, 0),
-- 
1.9.2
