From: Shaik Ameer Basha <shaik.ameer@samsung.com>
Subject: [PATCH v3 15/16] clk: exynos5420: create clock ID for mout_sclk_vpll
Date: Thu, 24 Apr 2014 18:33:51 +0530
Message-ID: <1398344632-18623-16-git-send-email-shaik.ameer@samsung.com>
References: <1398344632-18623-1-git-send-email-shaik.ameer@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:60195 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753141AbaDXNKw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Apr 2014 09:10:52 -0400
In-reply-to: <1398344632-18623-1-git-send-email-shaik.ameer@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, shaik.samsung@gmail.com, r.sh.open@gmail.com, Shaik Ameer Basha <shaik.ameer@samsung.com>

This patch adds clock ID for mout_sclk_vpll clock

Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c   |    2 +-
 include/dt-bindings/clock/exynos5420.h |    1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 944ff20..33a48d2 100755
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -437,7 +437,7 @@ static struct samsung_mux_clock exynos5420_mux_clks[] __initdata = {
 			SRC_TOP5, 28, 1),
 
 	MUX(0, "mout_sclk_mpll", mout_mpll_p, SRC_TOP6, 0, 1),
-	MUX(0, "mout_sclk_vpll", mout_vpll_p, SRC_TOP6, 4, 1),
+	MUX(CLK_MOUT_VPLL, "mout_sclk_vpll", mout_vpll_p, SRC_TOP6, 4, 1),
 	MUX(0, "mout_sclk_spll", mout_spll_p, SRC_TOP6, 8, 1),
 	MUX(0, "mout_sclk_ipll", mout_ipll_p, SRC_TOP6, 12, 1),
 	MUX(0, "mout_sclk_rpll", mout_rpll_p, SRC_TOP6, 16, 1),
diff --git a/include/dt-bindings/clock/exynos5420.h b/include/dt-bindings/clock/exynos5420.h
index b2410bc..7c80443 100755
--- a/include/dt-bindings/clock/exynos5420.h
+++ b/include/dt-bindings/clock/exynos5420.h
@@ -190,6 +190,7 @@
 #define CLK_MOUT_HDMI		640
 #define CLK_MOUT_MAUDIO0	642
 #define CLK_MOUT_G3D		643
+#define CLK_MOUT_VPLL		644
 
 /* divider clocks */
 #define CLK_DOUT_PIXEL		768
-- 
1.7.9.5
