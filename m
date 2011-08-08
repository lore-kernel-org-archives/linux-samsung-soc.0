From: Kamil Debski <k.debski@samsung.com>
Subject: [PATCH 2/3] s5p-g2d: add G2D to mach-nuri
Date: Mon, 08 Aug 2011 19:16:58 +0200
Message-ID: <1312823819-14713-3-git-send-email-k.debski@samsung.com>
References: <1312823819-14713-1-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:43289 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751921Ab1HHRRR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Aug 2011 13:17:17 -0400
Received: from eu_spt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LPM004UADCSFW@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Aug 2011 18:17:16 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LPM007ZKDCQ9L@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Aug 2011 18:17:15 +0100 (BST)
In-reply-to: <1312823819-14713-1-git-send-email-k.debski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, k.debski@samsung.com

G2D is a 2D graphics accelerator engine present in the s5p family
of Samsung SoCs. It is capable of bitblt and raster operations on
images having dimensions of up to 8000x8000.

Signed-off-by: Kamil Debski <k.debski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos4/Kconfig     |    1 +
 arch/arm/mach-exynos4/mach-nuri.c |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index 876e216..374d1fc 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -218,6 +218,7 @@ config MACH_NURI
 	select S5P_DEV_MFC
 	select S3C_DEV_RTC
 	select S5P_DEV_USB_EHCI
+	select S5P_DEV_G2D
 	select S3C_DEV_USB_HSOTG
 	select EXYNOS4_DEV_PD
 	select EXYNOS4_SETUP_FIMD0
diff --git a/arch/arm/mach-exynos4/mach-nuri.c b/arch/arm/mach-exynos4/mach-nuri.c
index 120731d..0cc44c5 100644
--- a/arch/arm/mach-exynos4/mach-nuri.c
+++ b/arch/arm/mach-exynos4/mach-nuri.c
@@ -1134,6 +1134,7 @@ static struct platform_device *nuri_devices[] __initdata = {
 	&i2c9_gpio,
 	&s3c_device_usb_hsotg,
 	&s3c_device_adc,
+	&s5p_device_g2d,
 	&s3c_device_rtc,
 	&s5p_device_mfc,
 	&s5p_device_mfc_l,
-- 
1.6.3.3
