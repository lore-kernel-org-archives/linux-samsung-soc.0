From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH 3/3] ARM: EXYNOS: Add mfc-v7 to memory reserve
Date: Wed, 19 Jun 2013 14:22:49 +0530
Message-ID: <1371631969-10076-3-git-send-email-arun.kk@samsung.com>
References: <1371631969-10076-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:20952 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932873Ab3FSI3L (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Jun 2013 04:29:11 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOM00HXCSWIV1L0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Jun 2013 17:29:08 +0900 (KST)
In-reply-to: <1371631969-10076-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, k.debski@samsung.com, s.nawrocki@samsung.com, arunkk.samsung@gmail.com

The patch updates the exynos5 memory reservation to reserve
memory for mfc-v7 also in addition to v6.

Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
---
 arch/arm/mach-exynos/mach-exynos5-dt.c |   14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index f874b77..fdb6181 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -60,13 +60,17 @@ static char const *exynos5_dt_compat[] __initdata = {
 static void __init exynos5_reserve(void)
 {
 #ifdef CONFIG_S5P_DEV_MFC
-	struct s5p_mfc_dt_meminfo mfc_mem;
+	int i;
+	struct s5p_mfc_dt_meminfo mfc_mem[] = {
+		{.compatible = "samsung,mfc-v6"},
+		{.compatible = "samsung,mfc-v7"},
+	};
 
 	/* Reserve memory for MFC only if it's available */
-	mfc_mem.compatible = "samsung,mfc-v6";
-	if (of_scan_flat_dt(s5p_fdt_find_mfc_mem, &mfc_mem))
-		s5p_mfc_reserve_mem(mfc_mem.roff, mfc_mem.rsize, mfc_mem.loff,
-				mfc_mem.lsize);
+	for (i = 0; i < ARRAY_SIZE(mfc_mem); i++)
+		if (of_scan_flat_dt(s5p_fdt_find_mfc_mem, &mfc_mem[i]))
+			s5p_mfc_reserve_mem(mfc_mem[i].roff, mfc_mem[i].rsize,
+					mfc_mem[i].loff, mfc_mem[i].lsize);
 #endif
 }
 
-- 
1.7.9.5
