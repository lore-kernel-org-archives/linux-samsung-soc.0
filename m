From: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Subject: [PATCHv3 3/3] ARM: Exynos: Register JPEG on nuri
Date: Wed, 01 Feb 2012 12:19:25 +0100
Message-ID: <1328095165-31628-4-git-send-email-andrzej.p@samsung.com>
References: <1328095165-31628-1-git-send-email-andrzej.p@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:56947 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753473Ab2BALTc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Feb 2012 06:19:32 -0500
Received: from euspt2 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LYP002PLOSJA140@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Feb 2012 11:19:31 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LYP001T1OSIJ2@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Feb 2012 11:19:31 +0000 (GMT)
In-reply-to: <1328095165-31628-1-git-send-email-andrzej.p@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

ARM: Exynos: Register JPEG on nuri

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/Kconfig     |    1 +
 arch/arm/mach-exynos/mach-nuri.c |    2 ++
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 042803a..d8ab22f 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -271,6 +271,7 @@ config MACH_NURI
 	select S3C_DEV_I2C3
 	select S3C_DEV_I2C5
 	select S5P_DEV_CSIS0
+	select S5P_DEV_JPEG
 	select S5P_DEV_FIMC0
 	select S5P_DEV_FIMC1
 	select S5P_DEV_FIMC2
diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/mach-nuri.c
index 165c876..adeb166 100644
--- a/arch/arm/mach-exynos/mach-nuri.c
+++ b/arch/arm/mach-exynos/mach-nuri.c
@@ -1260,6 +1260,7 @@ static struct platform_device *nuri_devices[] __initdata = {
 	&i2c9_gpio,
 	&s3c_device_adc,
 	&s5p_device_g2d,
+	&s5p_device_jpeg,
 	&s3c_device_rtc,
 	&s5p_device_mfc,
 	&s5p_device_mfc_l,
@@ -1319,6 +1320,7 @@ static void __init nuri_machine_init(void)
 	s5p_device_mfc.dev.parent = &exynos4_device_pd[PD_MFC].dev;
 	s5p_device_fimd0.dev.parent = &exynos4_device_pd[PD_LCD0].dev;
 
+	s5p_device_jpeg.dev.parent =  &exynos4_device_pd[PD_CAM].dev;
 	s5p_device_fimc0.dev.parent = &exynos4_device_pd[PD_CAM].dev;
 	s5p_device_fimc1.dev.parent = &exynos4_device_pd[PD_CAM].dev;
 	s5p_device_fimc2.dev.parent = &exynos4_device_pd[PD_CAM].dev;
-- 
1.7.0.4
