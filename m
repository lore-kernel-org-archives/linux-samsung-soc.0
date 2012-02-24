From: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Subject: [PATCHv5] ARM: Exynos: Register JPEG on nuri
Date: Fri, 24 Feb 2012 12:44:54 +0100
Message-ID: <1330083894-18769-1-git-send-email-andrzej.p@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:30859 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754817Ab2BXLpF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Feb 2012 06:45:05 -0500
Received: from euspt2 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LZW00AA0BB2ID80@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 24 Feb 2012 11:45:02 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LZW005ZPBB22J@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 24 Feb 2012 11:45:02 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>

ARM: Exynos: Register JPEG on nuri

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---

This is in response to:
http://www.spinics.net/lists/linux-samsung-soc/msg09530.html

Now it should apply cleanly.

@Sachin: Thank you for spotting the problem.

 arch/arm/mach-exynos/Kconfig     |    1 +
 arch/arm/mach-exynos/mach-nuri.c |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index a95146b..6db7dd2 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -265,6 +265,7 @@ config MACH_NURI
 	select S3C_DEV_I2C5
 	select S3C_DEV_I2C6
 	select S5P_DEV_CSIS0
+	select S5P_DEV_JPEG
 	select S5P_DEV_FIMC0
 	select S5P_DEV_FIMC1
 	select S5P_DEV_FIMC2
diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/mach-nuri.c
index a6b9162..8016649 100644
--- a/arch/arm/mach-exynos/mach-nuri.c
+++ b/arch/arm/mach-exynos/mach-nuri.c
@@ -1320,6 +1320,7 @@ static struct platform_device *nuri_devices[] __initdata = {
 	&i2c9_gpio,
 	&s3c_device_adc,
 	&s5p_device_g2d,
+	&s5p_device_jpeg,
 	&s3c_device_rtc,
 	&s5p_device_mfc,
 	&s5p_device_mfc_l,
-- 
1.7.0.4
