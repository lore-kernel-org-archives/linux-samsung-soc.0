From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 18/21] clk: samsung: exynos4: Add E4210 prefix to GATE_IP_PERIR
 register
Date: Wed, 27 Mar 2013 12:02:55 +0100
Message-ID: <1364382178-25248-19-git-send-email-t.figa@samsung.com>
References: <1364382178-25248-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:33110 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751978Ab3C0LI3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Mar 2013 07:08:29 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MKB00G2WGA4ZGL0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Mar 2013 20:08:28 +0900 (KST)
In-reply-to: <1364382178-25248-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com, s.nawrocki@samsung.com, mturquette@linaro.org, thomas.abraham@linaro.org, a.hajda@samsung.com, l.majewski@samsung.com

This definition is specific for Exynos4210 (which has another location
than the same register on Exynos4x12 SoCs) and so needs appropriate
prefix.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index c84dbc9..a89cac9 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -91,7 +91,7 @@
 #define GATE_IP_FSYS		0xc940
 #define GATE_IP_GPS		0xc94c
 #define GATE_IP_PERIL		0xc950
-#define GATE_IP_PERIR		0xc960
+#define E4210_GATE_IP_PERIR	0xc960
 #define E4X12_MPLL_CON0		0x10108
 #define E4X12_SRC_DMC		0x10200
 #define APLL_CON0		0x14100
@@ -731,9 +731,9 @@ struct samsung_gate_clock exynos4210_gate_clks[] __initdata = {
 	GATE(pcie, "pcie", "aclk133", GATE_IP_FSYS, 14, 0, 0),
 	GATE(smmu_pcie, "smmu_pcie", "aclk133", GATE_IP_FSYS, 18, 0, 0),
 	GATE(modemif, "modemif", "aclk100", GATE_IP_PERIL, 28, 0, 0),
-	GATE(chipid, "chipid", "aclk100", GATE_IP_PERIR, 0, 0, 0),
-	GATE(sysreg, "sysreg", "aclk100", GATE_IP_PERIR, 0, 0, 0),
-	GATE(hdmi_cec, "hdmi_cec", "aclk100", GATE_IP_PERIR, 11, 0, 0),
+	GATE(chipid, "chipid", "aclk100", E4210_GATE_IP_PERIR, 0, 0, 0),
+	GATE(sysreg, "sysreg", "aclk100", E4210_GATE_IP_PERIR, 0, 0, 0),
+	GATE(hdmi_cec, "hdmi_cec", "aclk100", E4210_GATE_IP_PERIR, 11, 0, 0),
 	GATE(smmu_rotator, "smmu_rotator", "aclk200",
 			E4210_GATE_IP_IMAGE, 4, 0, 0),
 	GATE(sclk_mipi1, "sclk_mipi1", "div_mipi_pre1",
@@ -743,10 +743,10 @@ struct samsung_gate_clock exynos4210_gate_clks[] __initdata = {
 	GATE(sclk_mixer, "sclk_mixer", "mout_mixer", SRC_MASK_TV, 4, 0, 0),
 	GATE(sclk_dac, "sclk_dac", "mout_dac", SRC_MASK_TV, 8, 0, 0),
 	GATE_A(tsadc, "tsadc", "aclk100", GATE_IP_PERIL, 15, 0, 0, "adc"),
-	GATE_A(mct, "mct", "aclk100", GATE_IP_PERIR, 13, 0, 0, "mct"),
-	GATE_A(wdt, "watchdog", "aclk100", GATE_IP_PERIR, 14, 0, 0, "watchdog"),
-	GATE_A(rtc, "rtc", "aclk100", GATE_IP_PERIR, 15, 0, 0, "rtc"),
-	GATE_A(keyif, "keyif", "aclk100", GATE_IP_PERIR, 16, 0, 0, "keypad"),
+	GATE_A(mct, "mct", "aclk100", E4210_GATE_IP_PERIR, 13, 0, 0, "mct"),
+	GATE_A(wdt, "watchdog", "aclk100", E4210_GATE_IP_PERIR, 14, 0, 0, "watchdog"),
+	GATE_A(rtc, "rtc", "aclk100", E4210_GATE_IP_PERIR, 15, 0, 0, "rtc"),
+	GATE_A(keyif, "keyif", "aclk100", E4210_GATE_IP_PERIR, 16, 0, 0, "keypad"),
 	GATE_DA(sclk_fimd1, "exynos4-fb.1", "sclk_fimd1", "div_fimd1",
 			E4210_SRC_MASK_LCD1, 0, CLK_SET_RATE_PARENT, 0, "sclk_fimd"),
 };
-- 
1.8.1.5
