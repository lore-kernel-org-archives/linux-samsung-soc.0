From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: EXYNOS: fix build error when MFC is not selected
Date: Mon, 10 Dec 2012 10:06:05 +0900
Message-ID: <030b01cdd672$89b21e60$9d165b20$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:62275 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753802Ab2LJBGK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 9 Dec 2012 20:06:10 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MES00HD4J26W4D0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Dec 2012 10:06:09 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MES00JIHJ2857A0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Dec 2012 10:06:08 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org


This fixes following:
arch/arm/mach-exynos/built-in.o: In function `exynos5_reserve':
arch/arm/mach-exynos/mach-exynos5-dt.c:177: undefined reference to `s5p_fdt_find_mfc_mem'
arch/arm/mach-exynos/mach-exynos5-dt.c:177: undefined reference to `s5p_fdt_find_mfc_mem'
arch/arm/mach-exynos/mach-exynos5-dt.c:178: undefined reference to `s5p_mfc_reserve_mem'

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos/mach-exynos5-dt.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index f5c6976..133abfd 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -169,6 +169,7 @@ static char const *exynos5_dt_compat[] __initdata = {
 
 static void __init exynos5_reserve(void)
 {
+#ifdef CONFIG_S5P_DEV_MFC
 	struct s5p_mfc_dt_meminfo mfc_mem;
 
 	/* Reserve memory for MFC only if it's available */
@@ -176,6 +177,7 @@ static void __init exynos5_reserve(void)
 	if (of_scan_flat_dt(s5p_fdt_find_mfc_mem, &mfc_mem))
 		s5p_mfc_reserve_mem(mfc_mem.roff, mfc_mem.rsize, mfc_mem.loff,
 				mfc_mem.lsize);
+#endif
 }
 
 DT_MACHINE_START(EXYNOS5_DT, "SAMSUNG EXYNOS5 (Flattened Device Tree)")
-- 
1.7.4.1
