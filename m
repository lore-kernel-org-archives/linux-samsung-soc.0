From: Kamil Debski <k.debski@samsung.com>
Subject: [PATCH 3/3] exynos4: Enable MFC on universal_c210
Date: Wed, 27 Apr 2011 13:43:05 +0200
Message-ID: <1303904585-11818-4-git-send-email-k.debski@samsung.com>
References: <1303904585-11818-1-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:47987 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753324Ab1D0LnQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Apr 2011 07:43:16 -0400
Received: from spt2.w1.samsung.com ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LKB008Y3783VB90@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Apr 2011 12:43:15 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LKB000VN7824X@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Apr 2011 12:43:14 +0100 (BST)
In-reply-to: <1303904585-11818-1-git-send-email-k.debski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, k.debski@samsung.com, jaeryul.oh@samsung.com, kgene.kim@samsung.com, jtp.park@samsung.com

Enable MFC 5.1 device on the universal_c210 boards using the EXYNOS4 SoC.

Signed-off-by: Kamil Debski <k.debski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos4/Kconfig               |    1 +
 arch/arm/mach-exynos4/mach-universal_c210.c |    8 ++++++++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index 544a594..6a05016 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -152,6 +152,7 @@ config MACH_UNIVERSAL_C210
 	select S5P_DEV_FIMC1
 	select S5P_DEV_FIMC2
 	select S5P_DEV_FIMC3
+	select S5P_DEV_MFC
 	select S3C_DEV_HSMMC
 	select S3C_DEV_HSMMC2
 	select S3C_DEV_HSMMC3
diff --git a/arch/arm/mach-exynos4/mach-universal_c210.c b/arch/arm/mach-exynos4/mach-universal_c210.c
index 7ff2f5f..777d8f3 100644
--- a/arch/arm/mach-exynos4/mach-universal_c210.c
+++ b/arch/arm/mach-exynos4/mach-universal_c210.c
@@ -620,7 +620,11 @@ static struct platform_device *universal_devices[] __initdata = {
 	&s5p_device_fimc1,
 	&s5p_device_fimc2,
 	&s5p_device_fimc3,
+	&s5p_device_mfc,
 	&exynos4_device_pd[PD_CAM],
+	&exynos4_device_pd[PD_MFC],
+	&exynos4_device_sysmmu[S5P_SYSMMU_MFC_R],
+	&exynos4_device_sysmmu[S5P_SYSMMU_MFC_L],
 	&exynos4_device_sysmmu[S5P_SYSMMU_FIMC0],
 	&exynos4_device_sysmmu[S5P_SYSMMU_FIMC1],
 	&exynos4_device_sysmmu[S5P_SYSMMU_FIMC2],
@@ -651,6 +655,10 @@ static void __init universal_machine_init(void)
 	/* Last */
 	platform_add_devices(universal_devices, ARRAY_SIZE(universal_devices));
 
+	s5p_device_mfc.dev.parent = &exynos4_device_pd[PD_MFC].dev;
+	exynos4_device_sysmmu[S5P_SYSMMU_MFC_L].dev.parent = &exynos4_device_pd[PD_MFC].dev;
+	exynos4_device_sysmmu[S5P_SYSMMU_MFC_R].dev.parent = &exynos4_device_pd[PD_MFC].dev;
+
 	s5p_device_fimc0.dev.parent = &exynos4_device_pd[PD_CAM].dev;
 	s5p_device_fimc1.dev.parent = &exynos4_device_pd[PD_CAM].dev;
 	s5p_device_fimc2.dev.parent = &exynos4_device_pd[PD_CAM].dev;
-- 
1.6.3.3
