From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH 1/3] clk: samsung: exynos5250: Fix ACP gate register offset
Date: Thu, 12 Dec 2013 08:32:00 +0530
Message-ID: <1386817322-11265-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:50617 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750882Ab3LLDBJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Dec 2013 22:01:09 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MXO009XQB1W3KA0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Dec 2013 12:01:08 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dianders@chromium.org, tomasz.figa@gmail.com, kgene.kim@samsung.com, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Abhilash Kesavan <a.kesavan@samsung.com>

The CLK_GATE_IP_ACP register offset is incorrectly listed.
Fix this and the register ordering as well.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
---
 drivers/clk/samsung/clk-exynos5250.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index adf3234..cbba4a8 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -25,6 +25,7 @@
 #define MPLL_LOCK		0x4000
 #define MPLL_CON0		0x4100
 #define SRC_CORE1		0x4204
+#define GATE_IP_ACP		0x8800
 #define CPLL_LOCK		0x10020
 #define EPLL_LOCK		0x10030
 #define VPLL_LOCK		0x10040
@@ -75,7 +76,6 @@
 #define SRC_CDREX		0x20200
 #define PLL_DIV2_SEL		0x20a24
 #define GATE_IP_DISP1		0x10928
-#define GATE_IP_ACP		0x10000
 
 /* list of PLLs to be registered */
 enum exynos5250_plls {
-- 
1.7.9.5
