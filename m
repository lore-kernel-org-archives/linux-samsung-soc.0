From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/3] ARM: Exynos4: Universal_C210: add FIMC device
Date: Tue, 07 Jun 2011 09:02:57 +0200
Message-ID: <1307430179-15891-2-git-send-email-m.szyprowski@samsung.com>
References: <1307430179-15891-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:61570 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751299Ab1FGHDE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jun 2011 03:03:04 -0400
Received: from eu_spt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LME0041RRL11F50@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 07 Jun 2011 08:03:02 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LME000MZRL08L@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 07 Jun 2011 08:03:01 +0100 (BST)
In-reply-to: <1307430179-15891-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

This patch adds definitions to enable support for s5p-fimc driver for
Universal C210 board.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

---
 arch/arm/mach-exynos4/Kconfig               |    4 ++++
 arch/arm/mach-exynos4/mach-universal_c210.c |    4 ++++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index 1435fc3..32a96f4 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -153,6 +153,10 @@ config MACH_ARMLEX4210
 config MACH_UNIVERSAL_C210
 	bool "Mobile UNIVERSAL_C210 Board"
 	select CPU_EXYNOS4210
+	select S5P_DEV_FIMC0
+	select S5P_DEV_FIMC1
+	select S5P_DEV_FIMC2
+	select S5P_DEV_FIMC3
 	select S3C_DEV_HSMMC
 	select S3C_DEV_HSMMC2
 	select S3C_DEV_HSMMC3
diff --git a/arch/arm/mach-exynos4/mach-universal_c210.c b/arch/arm/mach-exynos4/mach-universal_c210.c
index 97d329f..65f8d62 100644
--- a/arch/arm/mach-exynos4/mach-universal_c210.c
+++ b/arch/arm/mach-exynos4/mach-universal_c210.c
@@ -608,6 +608,10 @@ static struct i2c_board_info i2c1_devs[] __initdata = {
 
 static struct platform_device *universal_devices[] __initdata = {
 	/* Samsung Platform Devices */
+	&s5p_device_fimc0,
+	&s5p_device_fimc1,
+	&s5p_device_fimc2,
+	&s5p_device_fimc3,
 	&mmc0_fixed_voltage,
 	&s3c_device_hsmmc0,
 	&s3c_device_hsmmc2,
-- 
1.7.1.569.g6f426
