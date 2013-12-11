From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH 1/5] clk: samsung: exynos5250: Add CLK_IGNORE_UNUSED flag for
 the sysreg clock
Date: Wed, 11 Dec 2013 17:27:05 +0530
Message-ID: <1386763029-8516-2-git-send-email-a.kesavan@samsung.com>
References: <1386763029-8516-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:16440 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751408Ab3LKL40 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Dec 2013 06:56:26 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MXN008JG560F820@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Dec 2013 20:56:24 +0900 (KST)
In-reply-to: <1386763029-8516-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dianders@chromium.org, olof@lixom.net, kgene.kim@samsung.com, jonghwa3.lee@samsung.com, yadi.brar@samsung.com, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: Abhilash Kesavan <a.kesavan@samsung.com>

The sysreg (system register) generates control signals for various blocks
like disp1blk, i2c, mipi etc. However, it gets disabled as an unused clock
at boot-up.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
---
 drivers/clk/samsung/clk-exynos5250.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index adf3234..0833501 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -406,7 +406,8 @@ static struct samsung_gate_clock exynos5250_gate_clks[] __initdata = {
 	GATE(hsi2c2, "hsi2c2", "aclk66", GATE_IP_PERIC, 30, 0, 0),
 	GATE(hsi2c3, "hsi2c3", "aclk66", GATE_IP_PERIC, 31, 0, 0),
 	GATE(chipid, "chipid", "aclk66", GATE_IP_PERIS, 0, 0, 0),
-	GATE(sysreg, "sysreg", "aclk66", GATE_IP_PERIS, 1, 0, 0),
+	GATE(sysreg, "sysreg", "aclk66",
+			GATE_IP_PERIS, 1, CLK_IGNORE_UNUSED, 0),
 	GATE(pmu, "pmu", "aclk66", GATE_IP_PERIS, 2, CLK_IGNORE_UNUSED, 0),
 	GATE(tzpc0, "tzpc0", "aclk66", GATE_IP_PERIS, 6, 0, 0),
 	GATE(tzpc1, "tzpc1", "aclk66", GATE_IP_PERIS, 7, 0, 0),
-- 
1.7.9.5
