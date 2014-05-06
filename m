From: Shaik Ameer Basha <shaik.ameer-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 11/15] clk: exynos5420: correct sysmmu-mfc parent clocks
Date: Tue, 06 May 2014 21:56:46 +0530
Message-ID: <1399393610-23394-12-git-send-email-shaik.ameer@samsung.com>
References: <1399393610-23394-1-git-send-email-shaik.ameer@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1399393610-23394-1-git-send-email-shaik.ameer-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, shaik.samsung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, r.sh.open-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Shaik Ameer Basha <shaik.ameer-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patch corrects the wrong parent-child relationship
between sysmmu-mfc clocks.

Signed-off-by: Shaik Ameer Basha <shaik.ameer-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Reviewed-by: Alim Akhtar <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/clk/samsung/clk-exynos5420.c |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 6d88ae2..1449aee 100644
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
@@ -626,6 +628,9 @@ static struct samsung_div_clock exynos5420_div_clks[] __initdata = {
 	DIV(0, "dout_spi1", "mout_spi1", DIV_PERIC1, 24, 4),
 	DIV(0, "dout_spi2", "mout_spi2", DIV_PERIC1, 28, 4),
 
+	/* Mfc Block */
+	DIV(0, "dout_mfc_blk", "mout_user_aclk333", DIV4_RATIO, 0, 2),
+
 	/* PCM */
 	DIV(0, "dout_pcm1", "dout_audio1", DIV_PERIC2, 16, 8),
 	DIV(0, "dout_pcm2", "dout_audio2", DIV_PERIC2, 24, 8),
@@ -946,8 +951,10 @@ static struct samsung_gate_clock exynos5420_gate_clks[] __initdata = {
 			GATE_TOP_SCLK_ISP, 12, CLK_SET_RATE_PARENT, 0),
 
 	GATE(CLK_MFC, "mfc", "aclk333", GATE_IP_MFC, 0, 0, 0),
-	GATE(CLK_SMMU_MFCL, "smmu_mfcl", "aclk333", GATE_IP_MFC, 1, 0, 0),
-	GATE(CLK_SMMU_MFCR, "smmu_mfcr", "aclk333", GATE_IP_MFC, 2, 0, 0),
+	GATE(CLK_SMMU_MFCL, "smmu_mfcl", "dout_mfc_blk",
+			GATE_IP_MFC, 1, CLK_SET_RATE_PARENT, 0),
+	GATE(CLK_SMMU_MFCR, "smmu_mfcr", "dout_mfc_blk",
+			GATE_IP_MFC, 2, CLK_SET_RATE_PARENT, 0),
 
 	GATE(CLK_G3D, "g3d", "mout_user_aclk_g3d", GATE_IP_G3D, 9, 0, 0),
 };
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
