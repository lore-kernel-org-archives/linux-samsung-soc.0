From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 14/14] SMDKC100: add SDHCI controllers 0, 1 and 2 support
Date: Tue, 17 Nov 2009 08:41:24 +0100
Message-ID: <1258443684-19525-15-git-send-email-m.szyprowski@samsung.com>
References: <1258443684-19525-1-git-send-email-m.szyprowski@samsung.com>
 <1258443684-19525-2-git-send-email-m.szyprowski@samsung.com>
 <1258443684-19525-3-git-send-email-m.szyprowski@samsung.com>
 <1258443684-19525-4-git-send-email-m.szyprowski@samsung.com>
 <1258443684-19525-5-git-send-email-m.szyprowski@samsung.com>
 <1258443684-19525-6-git-send-email-m.szyprowski@samsung.com>
 <1258443684-19525-7-git-send-email-m.szyprowski@samsung.com>
 <1258443684-19525-8-git-send-email-m.szyprowski@samsung.com>
 <1258443684-19525-9-git-send-email-m.szyprowski@samsung.com>
 <1258443684-19525-10-git-send-email-m.szyprowski@samsung.com>
 <1258443684-19525-11-git-send-email-m.szyprowski@samsung.com>
 <1258443684-19525-12-git-send-email-m.szyprowski@samsung.com>
 <1258443684-19525-13-git-send-email-m.szyprowski@samsung.com>
 <1258443684-19525-14-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:12188 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754985AbZKQHmL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Nov 2009 02:42:11 -0500
Received: from eu_spt2 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KT800FGUTE9HE@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Nov 2009 07:42:09 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0KT800CHTTE7DG@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Nov 2009 07:42:09 +0000 (GMT)
In-reply-to: <1258443684-19525-14-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, bhmin@samsung.com

From: Kyungmin Park <kyungmin.park@samsung.com>

Add required machine definitions for SDHCI controller 0, 1 and 2. SMDKC100
has 2 SDHCI/MMC ports. Port 1 is directly connected to controller 0. Port
1 can be conntected to controler 1 or 2, depending on jumper setup.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/mach-s5pc100/Kconfig         |    4 ++++
 arch/arm/mach-s5pc100/mach-smdkc100.c |    3 +++
 2 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pc100/Kconfig b/arch/arm/mach-s5pc100/Kconfig
index 21b1821..0dd2b8c 100644
--- a/arch/arm/mach-s5pc100/Kconfig
+++ b/arch/arm/mach-s5pc100/Kconfig
@@ -25,8 +25,12 @@ config MACH_SMDKC100
 	select CPU_S5PC100
 	select S3C_DEV_FB
 	select S3C_DEV_I2C1
+	select S3C_DEV_HSMMC
+	select S3C_DEV_HSMMC1
+	select S3C_DEV_HSMMC2
 	select S5PC1XX_SETUP_I2C0
 	select S5PC1XX_SETUP_I2C1
 	select S5PC1XX_SETUP_FB_24BPP
+	select S5PC100_SETUP_SDHCI
 	help
 	  Machine support for the Samsung SMDKC100
diff --git a/arch/arm/mach-s5pc100/mach-smdkc100.c b/arch/arm/mach-s5pc100/mach-smdkc100.c
index 844f6ba..ae3c52c 100644
--- a/arch/arm/mach-s5pc100/mach-smdkc100.c
+++ b/arch/arm/mach-s5pc100/mach-smdkc100.c
@@ -147,6 +147,9 @@ static struct platform_device *smdkc100_devices[] __initdata = {
 	&s3c_device_i2c0,
 	&s3c_device_i2c1,
 	&s3c_device_fb,
+	&s3c_device_hsmmc0,
+	&s3c_device_hsmmc1,
+	&s3c_device_hsmmc2,
 	&smdkc100_lcd_powerdev,
 };
 
-- 
1.6.4
