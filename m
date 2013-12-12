From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 1/3] clk: samsung: exynos4: Fix definition of div_mmc_pre4
 divider
Date: Thu, 12 Dec 2013 17:18:01 +0100
Message-ID: <1386865083-20082-2-git-send-email-t.figa@samsung.com>
References: <1386865083-20082-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:50417 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751497Ab3LLQS2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Dec 2013 11:18:28 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MXP008P9BYQIG60@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Dec 2013 16:18:26 +0000 (GMT)
In-reply-to: <1386865083-20082-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@wwwdotorg.org>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Tomasz Figa <t.figa@samsung.com>

The clock was missing CLK_SET_RATE_PARENT flag, which caused rate
setting failures due to inability of reconfiguration of second
divider behind it.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index ad5ff50..d967571 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -530,7 +530,8 @@ static struct samsung_div_clock exynos4_div_clks[] __initdata = {
 	DIV(sclk_i2s1, "sclk_i2s1", "sclk_audio1", DIV_PERIL5, 0, 6),
 	DIV(sclk_i2s2, "sclk_i2s2", "sclk_audio2", DIV_PERIL5, 8, 6),
 	DIV(none, "div_mmc4", "mout_mmc4", DIV_FSYS3, 0, 4),
-	DIV(none, "div_mmc_pre4", "div_mmc4", DIV_FSYS3, 8, 8),
+	DIV_F(none, "div_mmc_pre4", "div_mmc4", DIV_FSYS3, 8, 8,
+			CLK_SET_RATE_PARENT, 0),
 	DIV(none, "div_uart0", "mout_uart0", DIV_PERIL0, 0, 4),
 	DIV(none, "div_uart1", "mout_uart1", DIV_PERIL0, 4, 4),
 	DIV(none, "div_uart2", "mout_uart2", DIV_PERIL0, 8, 4),
-- 
1.8.4.3
