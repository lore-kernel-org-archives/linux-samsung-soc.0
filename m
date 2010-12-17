From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH V2 1/3] ARM: S5PV310: Update CMU registers for CUPFREQ
Date: Fri, 17 Dec 2010 17:14:33 +0900
Message-ID: <1292573675-15643-2-git-send-email-sbkim73@samsung.com>
References: <1292573675-15643-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:43199 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751842Ab0LQIbb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Dec 2010 03:31:31 -0500
In-Reply-To: <1292573675-15643-1-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, SangWook Ju <sw.ju@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>

From: SangWook Ju <sw.ju@samsung.com>

This patch adds CMU(Clock Management Unit) registers for S5PV310/S5PC210
CPUFREQ driver and modifies some register names according to datasheet.

Signed-off-by: Sangwook Ju <sw.ju@samsung.com>
Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 arch/arm/mach-s5pv310/clock.c                   |   10 ++--
 arch/arm/mach-s5pv310/include/mach/regs-clock.h |   77 ++++++++++++++++++++++-
 2 files changed, 81 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-s5pv310/clock.c b/arch/arm/mach-s5pv310/clock.c
index 58c9d33..db84d52 100644
--- a/arch/arm/mach-s5pv310/clock.c
+++ b/arch/arm/mach-s5pv310/clock.c
@@ -253,7 +253,7 @@ static struct clksrc_clk clk_sclk_dmc = {
 		.id		= -1,
 		.parent		= &clk_mout_corebus.clk,
 	},
-	.reg_div	= { .reg = S5P_CLKDIV_CORE0, .shift = 12, .size = 3 },
+	.reg_div	= { .reg = S5P_CLKDIV_DMC0, .shift = 12, .size = 3 },
 };
 
 static struct clksrc_clk clk_aclk_cored = {
@@ -262,7 +262,7 @@ static struct clksrc_clk clk_aclk_cored = {
 		.id		= -1,
 		.parent		= &clk_sclk_dmc.clk,
 	},
-	.reg_div	= { .reg = S5P_CLKDIV_CORE0, .shift = 16, .size = 3 },
+	.reg_div	= { .reg = S5P_CLKDIV_DMC0, .shift = 16, .size = 3 },
 };
 
 static struct clksrc_clk clk_aclk_corep = {
@@ -271,7 +271,7 @@ static struct clksrc_clk clk_aclk_corep = {
 		.id		= -1,
 		.parent		= &clk_aclk_cored.clk,
 	},
-	.reg_div	= { .reg = S5P_CLKDIV_CORE0, .shift = 20, .size = 3 },
+	.reg_div	= { .reg = S5P_CLKDIV_DMC0, .shift = 20, .size = 3 },
 };
 
 static struct clksrc_clk clk_aclk_acp = {
@@ -280,7 +280,7 @@ static struct clksrc_clk clk_aclk_acp = {
 		.id		= -1,
 		.parent		= &clk_mout_corebus.clk,
 	},
-	.reg_div	= { .reg = S5P_CLKDIV_CORE0, .shift = 0, .size = 3 },
+	.reg_div	= { .reg = S5P_CLKDIV_DMC0, .shift = 0, .size = 3 },
 };
 
 static struct clksrc_clk clk_pclk_acp = {
@@ -289,7 +289,7 @@ static struct clksrc_clk clk_pclk_acp = {
 		.id		= -1,
 		.parent		= &clk_aclk_acp.clk,
 	},
-	.reg_div	= { .reg = S5P_CLKDIV_CORE0, .shift = 4, .size = 3 },
+	.reg_div	= { .reg = S5P_CLKDIV_DMC0, .shift = 4, .size = 3 },
 };
 
 /* Core list of CMU_TOP side */
diff --git a/arch/arm/mach-s5pv310/include/mach/regs-clock.h b/arch/arm/mach-s5pv310/include/mach/regs-clock.h
index f1028ca..a95a890 100644
--- a/arch/arm/mach-s5pv310/include/mach/regs-clock.h
+++ b/arch/arm/mach-s5pv310/include/mach/regs-clock.h
@@ -19,6 +19,12 @@
 
 #define S5P_INFORM0			S5P_CLKREG(0x800)
 
+#define S5P_CLKDIV_LEFTBUS              S5P_CLKREG(0x04500)
+#define S5P_CLKDIV_STAT_LEFTBUS         S5P_CLKREG(0x04600)
+
+#define S5P_CLKDIV_RIGHTBUS             S5P_CLKREG(0x08500)
+#define S5P_CLKDIV_STAT_RIGHTBUS        S5P_CLKREG(0x08600)
+
 #define S5P_EPLL_CON0			S5P_CLKREG(0x0C110)
 #define S5P_EPLL_CON1			S5P_CLKREG(0x0C114)
 #define S5P_VPLL_CON0			S5P_CLKREG(0x0C120)
@@ -58,6 +64,8 @@
 #define S5P_CLKSRC_MASK_PERIL0		S5P_CLKREG(0x0C350)
 #define S5P_CLKSRC_MASK_PERIL1		S5P_CLKREG(0x0C354)
 
+#define S5P_CLKDIV_STAT_TOP		S5P_CLKREG(0x0C610)
+
 #define S5P_CLKGATE_IP_CAM		S5P_CLKREG(0x0C920)
 #define S5P_CLKGATE_IP_IMAGE		S5P_CLKREG(0x0C930)
 #define S5P_CLKGATE_IP_LCD0		S5P_CLKREG(0x0C934)
@@ -67,7 +75,8 @@
 #define S5P_CLKGATE_IP_PERIR		S5P_CLKREG(0x0C960)
 
 #define S5P_CLKSRC_CORE			S5P_CLKREG(0x10200)
-#define S5P_CLKDIV_CORE0		S5P_CLKREG(0x10500)
+#define S5P_CLKDIV_DMC0			S5P_CLKREG(0x10500)
+#define S5P_CLKDIV_STAT_DMC0            S5P_CLKREG(0x10600)
 
 #define S5P_APLL_LOCK			S5P_CLKREG(0x14000)
 #define S5P_MPLL_LOCK			S5P_CLKREG(0x14004)
@@ -80,10 +89,76 @@
 #define S5P_CLKMUX_STATCPU		S5P_CLKREG(0x14400)
 
 #define S5P_CLKDIV_CPU			S5P_CLKREG(0x14500)
+#define S5P_CLKDIV_CPU1			S5P_CLKREG(0x14504)
 #define S5P_CLKDIV_STATCPU		S5P_CLKREG(0x14600)
+#define S5P_CLKDIV_STATCPU1		S5P_CLKREG(0x14604)
 
 #define S5P_CLKGATE_SCLKCPU		S5P_CLKREG(0x14800)
 
+/* APLL_LOCK */
+#define S5P_APLL_LOCKTIME		(0x1C20)	/* 300us */
+
+/* APLL_CON0 */
+#define S5P_APLLCON0_ENABLE_SHIFT	(31)
+#define S5P_APLLCON0_LOCKED_SHIFT	(29)
+#define S5P_APLL_VAL_1000		((250<<16)|(6<<8)|(0x1))
+#define S5P_APLL_VAL_800		((200<<16)|(6<<8)|(0x1))
+
+/* CLK_SRC_CPU */
+#define S5P_CLKSRC_CPU_MUXCORE_SHIFT	(16)
+#define S5P_CLKMUX_STATCPU_MUXCORE_MASK	(0x7 << S5P_CLKSRC_CPU_MUXCORE_SHIFT)
+
+/* CLKDIV_CPU0 */
+#define S5P_CLKDIV_CPU0_CORE_SHIFT      (0)
+#define S5P_CLKDIV_CPU0_CORE_MASK       (0x7 << S5P_CLKDIV_CPU0_CORE_SHIFT)
+#define S5P_CLKDIV_CPU0_COREM0_SHIFT    (4)
+#define S5P_CLKDIV_CPU0_COREM0_MASK     (0x7 << S5P_CLKDIV_CPU0_COREM0_SHIFT)
+#define S5P_CLKDIV_CPU0_COREM1_SHIFT    (8)
+#define S5P_CLKDIV_CPU0_COREM1_MASK     (0x7 << S5P_CLKDIV_CPU0_COREM1_SHIFT)
+#define S5P_CLKDIV_CPU0_PERIPH_SHIFT    (12)
+#define S5P_CLKDIV_CPU0_PERIPH_MASK     (0x7 << S5P_CLKDIV_CPU0_PERIPH_SHIFT)
+#define S5P_CLKDIV_CPU0_ATB_SHIFT       (16)
+#define S5P_CLKDIV_CPU0_ATB_MASK        (0x7 << S5P_CLKDIV_CPU0_ATB_SHIFT)
+#define S5P_CLKDIV_CPU0_PCLKDBG_SHIFT   (20)
+#define S5P_CLKDIV_CPU0_PCLKDBG_MASK    (0x7 << S5P_CLKDIV_CPU0_PCLKDBG_SHIFT)
+#define S5P_CLKDIV_CPU0_APLL_SHIFT      (24)
+#define S5P_CLKDIV_CPU0_APLL_MASK       (0x7 << S5P_CLKDIV_CPU0_APLL_SHIFT)
+
+/* CLKDIV_DMC0 */
+#define S5P_CLKDIV_DMC0_ACP_SHIFT       (0)
+#define S5P_CLKDIV_DMC0_ACP_MASK        (0x7 << S5P_CLKDIV_DMC0_ACP_SHIFT)
+#define S5P_CLKDIV_DMC0_ACPPCLK_SHIFT   (4)
+#define S5P_CLKDIV_DMC0_ACPPCLK_MASK    (0x7 << S5P_CLKDIV_DMC0_ACPPCLK_SHIFT)
+#define S5P_CLKDIV_DMC0_DPHY_SHIFT      (8)
+#define S5P_CLKDIV_DMC0_DPHY_MASK       (0x7 << S5P_CLKDIV_DMC0_DPHY_SHIFT)
+#define S5P_CLKDIV_DMC0_DMC_SHIFT       (12)
+#define S5P_CLKDIV_DMC0_DMC_MASK        (0x7 << S5P_CLKDIV_DMC0_DMC_SHIFT)
+#define S5P_CLKDIV_DMC0_DMCD_SHIFT      (16)
+#define S5P_CLKDIV_DMC0_DMCD_MASK       (0x7 << S5P_CLKDIV_DMC0_DMCD_SHIFT)
+#define S5P_CLKDIV_DMC0_DMCP_SHIFT      (20)
+#define S5P_CLKDIV_DMC0_DMCP_MASK       (0x7 << S5P_CLKDIV_DMC0_DMCP_SHIFT)
+#define S5P_CLKDIV_DMC0_COPY2_SHIFT     (24)
+#define S5P_CLKDIV_DMC0_COPY2_MASK      (0x7 << S5P_CLKDIV_DMC0_COPY2_SHIFT)
+#define S5P_CLKDIV_DMC0_CORETI_SHIFT    (28)
+#define S5P_CLKDIV_DMC0_CORETI_MASK     (0x7 << S5P_CLKDIV_DMC0_CORETI_SHIFT)
+
+/* CLKDIV_TOP */
+#define S5P_CLKDIV_TOP_ACLK200_SHIFT	(0)
+#define S5P_CLKDIV_TOP_ACLK200_MASK	(0x7 << S5P_CLKDIV_TOP_ACLK200_SHIFT)
+#define S5P_CLKDIV_TOP_ACLK100_SHIFT	(4)
+#define S5P_CLKDIV_TOP_ACLK100_MASK	(0xf << S5P_CLKDIV_TOP_ACLK100_SHIFT)
+#define S5P_CLKDIV_TOP_ACLK160_SHIFT	(8)
+#define S5P_CLKDIV_TOP_ACLK160_MASK	(0x7 << S5P_CLKDIV_TOP_ACLK160_SHIFT)
+#define S5P_CLKDIV_TOP_ACLK133_SHIFT	(12)
+#define S5P_CLKDIV_TOP_ACLK133_MASK	(0x7 << S5P_CLKDIV_TOP_ACLK133_SHIFT)
+#define S5P_CLKDIV_TOP_ONENAND_SHIFT	(16)
+#define S5P_CLKDIV_TOP_ONENAND_MASK	(0x7 << S5P_CLKDIV_TOP_ONENAND_SHIFT)
+
+/* CLKDIV_LEFTBUS / CLKDIV_RIGHTBUS*/
+#define S5P_CLKDIV_BUS_GDLR_SHIFT	(0)
+#define S5P_CLKDIV_BUS_GDLR_MASK        (0x7 << S5P_CLKDIV_BUS_GDLR_SHIFT)
+#define S5P_CLKDIV_BUS_GPLR_SHIFT	(4)
+#define S5P_CLKDIV_BUS_GPLR_MASK        (0x7 << S5P_CLKDIV_BUS_GPLR_SHIFT)
 /* Compatibility defines */
 
 #define S5P_EPLL_CON			S5P_EPLL_CON0
-- 
1.6.3.3
