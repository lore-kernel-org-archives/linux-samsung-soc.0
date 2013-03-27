From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 16/21] clk: samsung: exynos4: Remove SoC-specific registers
 from save list
Date: Wed, 27 Mar 2013 12:02:53 +0100
Message-ID: <1364382178-25248-17-git-send-email-t.figa@samsung.com>
References: <1364382178-25248-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:33055 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752261Ab3C0LHy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Mar 2013 07:07:54 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MKB00JOCG90KHI0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Mar 2013 20:07:53 +0900 (KST)
In-reply-to: <1364382178-25248-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com, s.nawrocki@samsung.com, mturquette@linaro.org, thomas.abraham@linaro.org, a.hajda@samsung.com, l.majewski@samsung.com

Current clock save list is shared for all Exynos4 SoCs, so it must
contain only registers present in all supported SoCs, because accessing
unavailable registers might have undefined effect.

This patch removes registers specific for particular SoCs from shared
save list, as they should be supported by separate SoC-specific lists.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index e7c6acd..aa8e907 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -172,27 +172,21 @@ enum exynos4_clks {
  */
 static __initdata unsigned long exynos4_clk_regs[] = {
 	SRC_LEFTBUS,
-	E4X12_GATE_IP_IMAGE,
 	GATE_IP_RIGHTBUS,
-	E4X12_GATE_IP_PERIR,
 	SRC_TOP0,
 	SRC_TOP1,
 	SRC_CAM,
 	SRC_TV,
 	SRC_MFC,
 	SRC_G3D,
-	E4210_SRC_IMAGE,
 	SRC_LCD0,
-	SRC_LCD1,
 	SRC_MAUDIO,
 	SRC_FSYS,
 	SRC_PERIL0,
 	SRC_PERIL1,
-	E4X12_SRC_CAM1,
 	SRC_MASK_CAM,
 	SRC_MASK_TV,
 	SRC_MASK_LCD0,
-	SRC_MASK_LCD1,
 	SRC_MASK_MAUDIO,
 	SRC_MASK_FSYS,
 	SRC_MASK_PERIL0,
@@ -204,8 +198,6 @@ static __initdata unsigned long exynos4_clk_regs[] = {
 	DIV_G3D,
 	DIV_IMAGE,
 	DIV_LCD0,
-	E4210_DIV_LCD1,
-	E4X12_DIV_ISP,
 	DIV_MAUDIO,
 	DIV_FSYS0,
 	DIV_FSYS1,
@@ -217,24 +209,16 @@ static __initdata unsigned long exynos4_clk_regs[] = {
 	DIV_PERIL3,
 	DIV_PERIL4,
 	DIV_PERIL5,
-	E4X12_DIV_CAM1,
 	GATE_SCLK_CAM,
 	GATE_IP_CAM,
 	GATE_IP_TV,
 	GATE_IP_MFC,
 	GATE_IP_G3D,
-	E4210_GATE_IP_IMAGE,
 	GATE_IP_LCD0,
-	GATE_IP_LCD1,
-	E4X12_GATE_IP_MAUDIO,
 	GATE_IP_FSYS,
 	GATE_IP_GPS,
 	GATE_IP_PERIL,
-	GATE_IP_PERIR,
-	E4X12_MPLL_CON0,
-	E4X12_SRC_DMC,
 	APLL_CON0,
-	E4210_MPLL_CON0,
 	SRC_CPU,
 	DIV_CPU0,
 };
-- 
1.8.1.5
