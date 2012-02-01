From: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Subject: [PATCHv3 2/3] ARM: Exynos: Register JPEG on universal_c210
Date: Wed, 01 Feb 2012 12:19:24 +0100
Message-ID: <1328095165-31628-3-git-send-email-andrzej.p@samsung.com>
References: <1328095165-31628-1-git-send-email-andrzej.p@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:58596 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754112Ab2BALTc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Feb 2012 06:19:32 -0500
Received: from euspt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LYP002POOSIM640@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Feb 2012 11:19:30 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LYP00GGWOSIDA@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Feb 2012 11:19:30 +0000 (GMT)
In-reply-to: <1328095165-31628-1-git-send-email-andrzej.p@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

ARM: Exynos: Register JPEG on universal_c210

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/Kconfig               |    1 +
 arch/arm/mach-exynos/mach-universal_c210.c |    2 ++
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index bd4600e..042803a 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -232,6 +232,7 @@ config MACH_UNIVERSAL_C210
 	select S5P_DEV_FIMC3
 	select S5P_DEV_G2D
 	select S5P_DEV_CSIS0
+	select S5P_DEV_JPEG
 	select S5P_DEV_FIMD0
 	select S3C_DEV_HSMMC
 	select S3C_DEV_HSMMC2
diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach-exynos/mach-universal_c210.c
index dd75101..4c6dd86 100644
--- a/arch/arm/mach-exynos/mach-universal_c210.c
+++ b/arch/arm/mach-exynos/mach-universal_c210.c
@@ -980,6 +980,7 @@ static struct platform_device *universal_devices[] __initdata = {
 	&universal_gpio_keys,
 	&s5p_device_onenand,
 	&s5p_device_fimd0,
+	&s5p_device_jpeg,
 	&s5p_device_mfc,
 	&s5p_device_mfc_l,
 	&s5p_device_mfc_r,
@@ -1045,6 +1046,7 @@ static void __init universal_machine_init(void)
 	s5p_device_mfc.dev.parent = &exynos4_device_pd[PD_MFC].dev;
 	s5p_device_fimd0.dev.parent = &exynos4_device_pd[PD_LCD0].dev;
 
+	s5p_device_jpeg.dev.parent =  &exynos4_device_pd[PD_CAM].dev;
 	s5p_device_fimc0.dev.parent = &exynos4_device_pd[PD_CAM].dev;
 	s5p_device_fimc1.dev.parent = &exynos4_device_pd[PD_CAM].dev;
 	s5p_device_fimc2.dev.parent = &exynos4_device_pd[PD_CAM].dev;
-- 
1.7.0.4
