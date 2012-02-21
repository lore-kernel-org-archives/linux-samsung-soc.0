From: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Subject: [PATCH 1/2] ARM: Exynos: Register JPEG on universal_c210
Date: Tue, 21 Feb 2012 11:04:47 +0100
Message-ID: <1329818688-27337-2-git-send-email-andrzej.p@samsung.com>
References: <1329818688-27337-1-git-send-email-andrzej.p@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:45421 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753086Ab2BUKE5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Feb 2012 05:04:57 -0500
Received: from euspt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LZQ00NWCMO70F@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 21 Feb 2012 10:04:55 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LZQ000ALMO73R@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 21 Feb 2012 10:04:55 +0000 (GMT)
In-reply-to: <1329818688-27337-1-git-send-email-andrzej.p@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

ARM: Exynos: Register JPEG on universal_c210

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/Kconfig               |    1 +
 arch/arm/mach-exynos/mach-universal_c210.c |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index cf29c35..23b6971 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -235,6 +235,7 @@ config MACH_UNIVERSAL_C210
 	select S5P_DEV_FIMC3
 	select S5P_DEV_G2D
 	select S5P_DEV_CSIS0
+	select S5P_DEV_JPEG
 	select S5P_DEV_FIMD0
 	select S3C_DEV_HSMMC
 	select S3C_DEV_HSMMC2
diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach-exynos/mach-universal_c210.c
index 220de1c..c525f42 100644
--- a/arch/arm/mach-exynos/mach-universal_c210.c
+++ b/arch/arm/mach-exynos/mach-universal_c210.c
@@ -981,6 +981,7 @@ static struct platform_device *universal_devices[] __initdata = {
 	&universal_gpio_keys,
 	&s5p_device_onenand,
 	&s5p_device_fimd0,
+	&s5p_device_jpeg,
 	&s5p_device_mfc,
 	&s5p_device_mfc_l,
 	&s5p_device_mfc_r,
-- 
1.7.0.4
