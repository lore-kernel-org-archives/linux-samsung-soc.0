From: Shaik Ameer Basha <shaik.ameer@samsung.com>
Subject: [PATCH v3 12/16] clk: exynos5420: fix register offset for sclk_bpll
Date: Thu, 24 Apr 2014 18:33:48 +0530
Message-ID: <1398344632-18623-13-git-send-email-shaik.ameer@samsung.com>
References: <1398344632-18623-1-git-send-email-shaik.ameer@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:15812 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753475AbaDXNKK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Apr 2014 09:10:10 -0400
In-reply-to: <1398344632-18623-1-git-send-email-shaik.ameer@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, shaik.samsung@gmail.com, r.sh.open@gmail.com, Shaik Ameer Basha <shaik.ameer@samsung.com>

This patch fixes the wrong register offset for sclk_bpll clock.

Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 6daf739..3afc112 100755
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -111,7 +111,6 @@
 #define TOP_SPARE2		0x10b08
 #define BPLL_LOCK		0x20010
 #define BPLL_CON0		0x20110
-#define SRC_CDREX		0x20200
 #define KPLL_LOCK		0x28000
 #define KPLL_CON0		0x28100
 #define SRC_KFC			0x28200
@@ -204,7 +203,6 @@ static unsigned long exynos5420_clk_regs[] __initdata = {
 	GATE_TOP_SCLK_FSYS,
 	GATE_TOP_SCLK_PERIC,
 	TOP_SPARE2,
-	SRC_CDREX,
 	SRC_KFC,
 	DIV_KFC0,
 };
@@ -380,7 +378,7 @@ static struct samsung_mux_clock exynos5420_mux_clks[] __initdata = {
 	MUX(0, "mout_kpll", mout_kpll_p, SRC_KFC, 0, 1),
 	MUX(0, "mout_kfc", mout_kfc_p, SRC_KFC, 16, 1),
 
-	MUX(0, "sclk_bpll", mout_bpll_p, SRC_CDREX, 0, 1),
+	MUX(0, "sclk_bpll", mout_bpll_p, TOP_SPARE2, 0, 1),
 
 	MUX_A(0, "mout_aclk400_mscl", mout_group1_p,
 			SRC_TOP0, 4, 2, "aclk400_mscl"),
-- 
1.7.9.5
