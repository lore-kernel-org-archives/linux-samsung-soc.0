From: Shaik Ameer Basha <shaik.ameer@samsung.com>
Subject: [PATCH v3 16/16] clk: exynos5420: add more registers to restore list
Date: Thu, 24 Apr 2014 18:33:52 +0530
Message-ID: <1398344632-18623-17-git-send-email-shaik.ameer@samsung.com>
References: <1398344632-18623-1-git-send-email-shaik.ameer@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:48236 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753141AbaDXNLF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Apr 2014 09:11:05 -0400
In-reply-to: <1398344632-18623-1-git-send-email-shaik.ameer@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, shaik.samsung@gmail.com, r.sh.open@gmail.com, Shaik Ameer Basha <shaik.ameer@samsung.com>

This patch adds more register offsets to the restore list.

Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 33a48d2..6dfd3fd 100755
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -27,6 +27,7 @@
 #define DIV_CPU1		0x504
 #define GATE_BUS_CPU		0x700
 #define GATE_SCLK_CPU		0x800
+#define CLKOUT_CMU_CPU		0xa00
 #define GATE_IP_G2D		0x8800
 #define CPLL_LOCK		0x10020
 #define DPLL_LOCK		0x10030
@@ -39,7 +40,11 @@
 #define CPLL_CON0		0x10120
 #define DPLL_CON0		0x10128
 #define EPLL_CON0		0x10130
+#define EPLL_CON1		0x10134
+#define EPLL_CON2		0x10138
 #define RPLL_CON0		0x10140
+#define RPLL_CON1		0x10144
+#define RPLL_CON2		0x10148
 #define IPLL_CON0		0x10150
 #define SPLL_CON0		0x10160
 #define VPLL_CON0		0x10170
@@ -139,6 +144,13 @@ static unsigned long exynos5420_clk_regs[] __initdata = {
 	DIV_CPU1,
 	GATE_BUS_CPU,
 	GATE_SCLK_CPU,
+	CLKOUT_CMU_CPU,
+	EPLL_CON0,
+	EPLL_CON1,
+	EPLL_CON2,
+	RPLL_CON0,
+	RPLL_CON1,
+	RPLL_CON2,
 	SRC_TOP0,
 	SRC_TOP1,
 	SRC_TOP2,
-- 
1.7.9.5
