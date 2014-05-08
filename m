From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: [PATCH V3 3/3] CLK: EXYNOS: Add clk save/restore registers for 5420
Date: Thu, 08 May 2014 16:23:11 +0530
Message-ID: <1399546391-30571-1-git-send-email-vikas.sajjan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:46940 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753015AbaEHKyT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 May 2014 06:54:19 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5900IKJ4YI5M90@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 08 May 2014 19:54:18 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, pankaj.dubey@samsung.com, Vikas Sajjan <vikas.sajjan@samsung.com>

Adds clk save/restore registers for 5420

Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c |   30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 60b2681..01fd917 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -101,6 +101,18 @@
 #define KPLL_CON0		0x28100
 #define SRC_KFC			0x28200
 #define DIV_KFC0		0x28500
+#define SRC_MASK_CPERI		0x04300
+#define SRC_MASK_TOP0		0x10300
+#define SRC_MASK_TOP1		0x10304
+#define SRC_MASK_TOP2		0x10308
+#define SRC_MASK_TOP7		0x1031C
+#define SRC_MASK_MAU		0x10334
+#define SRC_MASK_FSYS		0x10340
+#define SRC_MASK_PERIC0		0x10350
+#define SRC_MASK_PERIC1		0x10354
+#define SRC_MASK_ISP		0x10370
+#define GATE_BUS_DISP1		0x10728
+#define GATE_IP_PERIC		0x10950
 
 /* list of PLLs */
 enum exynos5420_plls {
@@ -180,11 +192,29 @@ static unsigned long exynos5420_clk_regs[] __initdata = {
 	DIV_KFC0,
 };
 
+static const struct samsung_clk_reg_dump exynos5420_set_clksrc[] = {
+	{ .offset = SRC_MASK_CPERI,		.value = 0xffffffff, },
+	{ .offset = SRC_MASK_TOP0,		.value = 0x11111111, },
+	{ .offset = SRC_MASK_TOP1,		.value = 0x11101111, },
+	{ .offset = SRC_MASK_TOP2,		.value = 0x11111110, },
+	{ .offset = SRC_MASK_TOP7,		.value = 0x00111100, },
+	{ .offset = SRC_MASK_DISP10,		.value = 0x11111110, },
+	{ .offset = SRC_MASK_MAU,		.value = 0x10000000, },
+	{ .offset = SRC_MASK_FSYS,		.value = 0x11111110, },
+	{ .offset = SRC_MASK_PERIC0,		.value = 0x11111110, },
+	{ .offset = SRC_MASK_PERIC1,		.value = 0x11111100, },
+	{ .offset = SRC_MASK_ISP,		.value = 0x11111000, },
+	{ .offset = GATE_BUS_DISP1,		.value = 0xffffffff, },
+	{ .offset = GATE_IP_PERIC,		.value = 0xffffffff, },
+};
+
 static int exynos5420_clk_suspend(void)
 {
 	samsung_clk_save(reg_base, exynos5420_save,
 				ARRAY_SIZE(exynos5420_clk_regs));
 
+	samsung_clk_restore(reg_base, exynos5420_set_clksrc,
+				ARRAY_SIZE(exynos5420_set_clksrc));
 	return 0;
 }
 
-- 
1.7.9.5
