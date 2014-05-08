From: Shaik Ameer Basha <shaik.ameer@samsung.com>
Subject: [PATCH v5 11/15] clk: exynos5420: correct sysmmu-mfc parent clocks
Date: Thu, 08 May 2014 16:58:00 +0530
Message-ID: <1399548484-20626-12-git-send-email-shaik.ameer@samsung.com>
References: <1399548484-20626-1-git-send-email-shaik.ameer@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:16594 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753261AbaEHLa3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 May 2014 07:30:29 -0400
In-reply-to: <1399548484-20626-1-git-send-email-shaik.ameer@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, t.figa@samsung.com, kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, shaik.samsung@gmail.com, r.sh.open@gmail.com, alim.akhtar@samsung.com, Shaik Ameer Basha <shaik.ameer@samsung.com>

This patch corrects the wrong parent-child relationship
between sysmmu-mfc clocks.

Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 9e04677..7790675 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -82,6 +82,7 @@
 #define SCLK_DIV_ISP0		0x10580
 #define SCLK_DIV_ISP1		0x10584
 #define DIV2_RATIO0		0x10590
+#define DIV4_RATIO		0x105a0
 #define GATE_BUS_TOP		0x10700
 #define GATE_BUS_GEN		0x1073c
 #define GATE_BUS_FSYS0		0x10740
@@ -176,6 +177,7 @@ static unsigned long exynos5420_clk_regs[] __initdata = {
 	SCLK_DIV_ISP0,
 	SCLK_DIV_ISP1,
 	DIV2_RATIO0,
+	DIV4_RATIO,
 	GATE_BUS_TOP,
 	GATE_BUS_GEN,
 	GATE_BUS_FSYS0,
@@ -624,6 +626,9 @@ static struct samsung_div_clock exynos5420_div_clks[] __initdata = {
 	DIV(0, "dout_spi1", "mout_spi1", DIV_PERIC1, 24, 4),
 	DIV(0, "dout_spi2", "mout_spi2", DIV_PERIC1, 28, 4),
 
+	/* Mfc Block */
+	DIV(0, "dout_mfc_blk", "mout_user_aclk333", DIV4_RATIO, 0, 2),
+
 	/* PCM */
 	DIV(0, "dout_pcm1", "dout_audio1", DIV_PERIC2, 16, 8),
 	DIV(0, "dout_pcm2", "dout_audio2", DIV_PERIC2, 24, 8),
@@ -935,8 +940,8 @@ static struct samsung_gate_clock exynos5420_gate_clks[] __initdata = {
 			GATE_TOP_SCLK_ISP, 12, CLK_SET_RATE_PARENT, 0),
 
 	GATE(CLK_MFC, "mfc", "aclk333", GATE_IP_MFC, 0, 0, 0),
-	GATE(CLK_SMMU_MFCL, "smmu_mfcl", "aclk333", GATE_IP_MFC, 1, 0, 0),
-	GATE(CLK_SMMU_MFCR, "smmu_mfcr", "aclk333", GATE_IP_MFC, 2, 0, 0),
+	GATE(CLK_SMMU_MFCL, "smmu_mfcl", "dout_mfc_blk", GATE_IP_MFC, 1, 0, 0),
+	GATE(CLK_SMMU_MFCR, "smmu_mfcr", "dout_mfc_blk", GATE_IP_MFC, 2, 0, 0),
 
 	GATE(CLK_G3D, "g3d", "mout_user_aclk_g3d", GATE_IP_G3D, 9, 0, 0),
 };
-- 
1.7.9.5
