From: Kamil Debski <k.debski@samsung.com>
Subject: [PATCH 3/3] s5p-g2d: add G2D to mach-universal
Date: Mon, 08 Aug 2011 19:16:59 +0200
Message-ID: <1312823819-14713-4-git-send-email-k.debski@samsung.com>
References: <1312823819-14713-1-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:25724 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752926Ab1HHRRR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Aug 2011 13:17:17 -0400
Received: from spt2.w1.samsung.com ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LPM00EK5DCSCR50@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Aug 2011 18:17:16 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LPM0081GDCRVZ@spt2.w1.samsung.com> for
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
 arch/arm/mach-exynos4/Kconfig               |    1 +
 arch/arm/mach-exynos4/mach-universal_c210.c |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index 374d1fc..8e6a3f0 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -182,6 +182,7 @@ config MACH_UNIVERSAL_C210
 	select S5P_DEV_FIMC1
 	select S5P_DEV_FIMC2
 	select S5P_DEV_FIMC3
+	select S5P_DEV_G2D
 	select S3C_DEV_HSMMC
 	select S3C_DEV_HSMMC2
 	select S3C_DEV_HSMMC3
diff --git a/arch/arm/mach-exynos4/mach-universal_c210.c b/arch/arm/mach-exynos4/mach-universal_c210.c
index bd9a54e..a212758 100644
--- a/arch/arm/mach-exynos4/mach-universal_c210.c
+++ b/arch/arm/mach-exynos4/mach-universal_c210.c
@@ -973,6 +973,7 @@ static struct platform_device *universal_devices[] __initdata = {
 	&s5p_device_fimc1,
 	&s5p_device_fimc2,
 	&s5p_device_fimc3,
+	&s5p_device_g2d,
 	&mmc0_fixed_voltage,
 	&s3c_device_hsmmc0,
 	&s3c_device_hsmmc2,
-- 
1.6.3.3
