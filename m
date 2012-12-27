From: Prathyush K <prathyush.k@samsung.com>
Subject: [PATCH] ARM: EXYNOS: Interchange control bits of sysmmu mfc_l and mfc_r
Date: Thu, 27 Dec 2012 03:44:06 -0500
Message-ID: <1356597846-5785-1-git-send-email-prathyush.k@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:33173 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751072Ab2L0IVv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Dec 2012 03:21:51 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MFO0072IKK2ZZC0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 27 Dec 2012 17:21:50 +0900 (KST)
Received: from chrome-ubuntu.sisodomain.com ([107.108.73.106])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MFO00GXLKK3SZ20@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 27 Dec 2012 17:21:50 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, pullip.cho@samsung.com

The control bits for mfc_l and mfc_r sysmmus are incorrectly set.
This patch interchanges the control bits so that the mfc sysmmus
function correctly.

Signed-off-by: Prathyush K <prathyush.k@samsung.com>
---
 arch/arm/mach-exynos/clock-exynos5.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/clock-exynos5.c
index 0208c3a..730d54c 100644
--- a/arch/arm/mach-exynos/clock-exynos5.c
+++ b/arch/arm/mach-exynos/clock-exynos5.c
@@ -873,13 +873,13 @@ static struct clk exynos5_init_clocks_off[] = {
 		.devname	= SYSMMU_CLOCK_DEVNAME(mfc_l, 0),
 		.enable		= &exynos5_clk_ip_mfc_ctrl,
 		.ops		= &exynos5_gate_clk_ops,
-		.ctrlbit	= (1 << 1),
+		.ctrlbit	= (1 << 2),
 	}, {
 		.name		= SYSMMU_CLOCK_NAME,
 		.devname	= SYSMMU_CLOCK_DEVNAME(mfc_r, 1),
 		.enable		= &exynos5_clk_ip_mfc_ctrl,
 		.ops		= &exynos5_gate_clk_ops,
-		.ctrlbit	= (1 << 2),
+		.ctrlbit	= (1 << 1),
 	}, {
 		.name		= SYSMMU_CLOCK_NAME,
 		.devname	= SYSMMU_CLOCK_DEVNAME(tv, 2),
-- 
1.8.0
