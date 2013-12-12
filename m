From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH 2/3] clk: samsung: exynos5250: Add MDMA0 clocks
Date: Thu, 12 Dec 2013 08:32:01 +0530
Message-ID: <1386817322-11265-2-git-send-email-a.kesavan@samsung.com>
References: <1386817322-11265-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:50617 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750971Ab3LLDBK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Dec 2013 22:01:10 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MXO009I6B1XJBA0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Dec 2013 12:01:09 +0900 (KST)
In-reply-to: <1386817322-11265-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dianders@chromium.org, tomasz.figa@gmail.com, kgene.kim@samsung.com, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Abhilash Kesavan <a.kesavan@samsung.com>

Adds gate clock for MDMA0 on Exynos5250 SoC.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
---
 .../devicetree/bindings/clock/exynos5250-clock.txt |    2 ++
 drivers/clk/samsung/clk-exynos5250.c               |    5 ++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
index 24765c1..5883ec8 100644
--- a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
+++ b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
@@ -159,6 +159,8 @@ clock which they consume.
   mixer			343
   hdmi			344
   g2d			345
+  mdma0			346
+  smmu_mdma0		347
 
 
    [Clock Muxes]
diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index cbba4a8..27ffe2f 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -120,7 +120,8 @@ enum exynos5250_clks {
 	spi2, i2s1, i2s2, pcm1, pcm2, pwm, spdif, ac97, hsi2c0, hsi2c1, hsi2c2,
 	hsi2c3, chipid, sysreg, pmu, cmu_top, cmu_core, cmu_mem, tzpc0, tzpc1,
 	tzpc2, tzpc3, tzpc4, tzpc5, tzpc6, tzpc7, tzpc8, tzpc9, hdmi_cec, mct,
-	wdt, rtc, tmu, fimd1, mie1, dsim0, dp, mixer, hdmi, g2d,
+	wdt, rtc, tmu, fimd1, mie1, dsim0, dp, mixer, hdmi, g2d, mdma0,
+	smmu_mdma0,
 
 	/* mux clocks */
 	mout_hdmi = 1024,
@@ -492,6 +493,8 @@ static struct samsung_gate_clock exynos5250_gate_clks[] __initdata = {
 	GATE(mixer, "mixer", "mout_aclk200_disp1", GATE_IP_DISP1, 5, 0, 0),
 	GATE(hdmi, "hdmi", "mout_aclk200_disp1", GATE_IP_DISP1, 6, 0, 0),
 	GATE(g2d, "g2d", "aclk200", GATE_IP_ACP, 3, 0, 0),
+	GATE(mdma0, "mdma0", "aclk266", GATE_IP_ACP, 1, 0, 0),
+	GATE(smmu_mdma0, "smmu_mdma0", "aclk266", GATE_IP_ACP, 5, 0, 0),
 };
 
 static struct samsung_pll_rate_table vpll_24mhz_tbl[] __initdata = {
-- 
1.7.9.5
