From: Kamil Debski <k.debski@samsung.com>
Subject: [PATCH 3/3] s5p-g2d: add G2D to mach-universal
Date: Fri, 09 Dec 2011 17:04:42 +0100
Message-ID: <1323446682-25252-4-git-send-email-k.debski@samsung.com>
References: <1323446682-25252-1-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:39644 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750780Ab1LIQFN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Dec 2011 11:05:13 -0500
Received: from euspt2 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LVY001T420OA0@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 09 Dec 2011 16:05:12 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LVY001UW20N2W@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 09 Dec 2011 16:05:11 +0000 (GMT)
In-reply-to: <1323446682-25252-1-git-send-email-k.debski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, k.debski@samsung.com, kgene.kim@samsung.com

Signed-off-by: Kamil Debski <k.debski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/Kconfig               |    1 +
 arch/arm/mach-exynos/mach-universal_c210.c |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 176092c..618396a 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -218,6 +218,7 @@ config MACH_UNIVERSAL_C210
 	select S5P_DEV_FIMC1
 	select S5P_DEV_FIMC2
 	select S5P_DEV_FIMC3
+	select S5P_DEV_G2D
 	select S5P_DEV_CSIS0
 	select S5P_DEV_FIMD0
 	select S3C_DEV_HSMMC
diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach-exynos/mach-universal_c210.c
index a2a177f..eecc201 100644
--- a/arch/arm/mach-exynos/mach-universal_c210.c
+++ b/arch/arm/mach-exynos/mach-universal_c210.c
@@ -960,6 +960,7 @@ static struct platform_device *universal_devices[] __initdata = {
 	&s5p_device_fimc1,
 	&s5p_device_fimc2,
 	&s5p_device_fimc3,
+	&s5p_device_g2d,
 	&mmc0_fixed_voltage,
 	&s3c_device_hsmmc0,
 	&s3c_device_hsmmc2,
-- 
1.7.0.4
