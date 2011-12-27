From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH] ARM: Exynos: Remove duplicated SROMC static memory mapping
Date: Tue, 27 Dec 2011 11:42:23 +0530
Message-ID: <1324966343-7560-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:24674 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751044Ab1L0GKY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Dec 2011 01:10:24 -0500
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWU00BCZMH80AK0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Dec 2011 15:10:22 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWU00IU1MH3CM50@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 27 Dec 2011 15:10:22 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org

SROMC static memory mapping is included in the common s5p initialization
code. Hence, remove the duplicated SROMC static memory mapping for Exynos.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
This was identified while testing Nicolas Pitre's vmalloc.h removal
patch series for Exynos. The duplicated static memory mapping caused
the detection of overlapped memory region (in vm_area_add_early) which
resulted in boot failure.	

 arch/arm/mach-exynos/cpu.c |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-exynos/cpu.c b/arch/arm/mach-exynos/cpu.c
index 1213027..574f4b9 100644
--- a/arch/arm/mach-exynos/cpu.c
+++ b/arch/arm/mach-exynos/cpu.c
@@ -118,11 +118,6 @@ static struct map_desc exynos4_iodesc[] __initdata = {
 		.length		= SZ_64K,
 		.type		= MT_DEVICE,
 	}, {
-		.virtual	= (unsigned long)S5P_VA_SROMC,
-		.pfn		= __phys_to_pfn(EXYNOS4_PA_SROMC),
-		.length		= SZ_4K,
-		.type		= MT_DEVICE,
-	}, {
 		.virtual	= (unsigned long)S3C_VA_USB_HSPHY,
 		.pfn		= __phys_to_pfn(EXYNOS4_PA_HSPHY),
 		.length		= SZ_4K,
-- 
1.6.6.rc2
