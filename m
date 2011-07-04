From: KyongHo Cho <pullip.cho@samsung.com>
Subject: [PATCH 5/6] ARM: EXYNOS4: SYSMMU: Add SYSMMU_NONE
Date: Mon,  4 Jul 2011 10:41:46 +0900
Message-ID: <1309743708-1505-6-git-send-email-pullip.cho@samsung.com>
References: <1309743708-1505-1-git-send-email-pullip.cho@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:35569 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752362Ab1GDCO1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 Jul 2011 22:14:27 -0400
In-Reply-To: <1309743708-1505-1-git-send-email-pullip.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Cc: Joerg Roedel <joro@8bytes.org>, Sanghyun Lee <sanghyun75.lee@samsung.com>, Kwanghyun La <nala.la@samsung.com>, Ilho Lee <ilho215.lee@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, KyongHo Cho <pullip.cho@samsung.com>

Added new value 'SYSMMU_NONE' to sysmmu_ips.
This value represents invalid System MMU.

Signed-off-by: KyongHo Cho <pullip.cho@samsung.com>
---
 arch/arm/mach-exynos4/include/mach/sysmmu.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/include/mach/sysmmu.h b/arch/arm/mach-exynos4/include/mach/sysmmu.h
index 2d5d78b..05e282c 100644
--- a/arch/arm/mach-exynos4/include/mach/sysmmu.h
+++ b/arch/arm/mach-exynos4/include/mach/sysmmu.h
@@ -33,6 +33,7 @@ enum exynos4_sysmmu_ips {
 };
 
 #define S5P_SYSMMU_TOTAL_IPNUM		EXYNOS4_SYSMMU_TOTAL_IPNUM
+#define SYSMMU_NONE			S5P_SYSMMU_TOTAL_IPNUM
 
 extern const char *sysmmu_ips_name[EXYNOS4_SYSMMU_TOTAL_IPNUM];
 
-- 
1.7.1
