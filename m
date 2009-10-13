From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 16/17] SMDKC100: add SDHCI controllers 0, 1 and 2 support
Date: Tue, 13 Oct 2009 09:57:11 +0200
Message-ID: <1255420632-21116-17-git-send-email-m.szyprowski@samsung.com>
References: <1255420632-21116-1-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-2-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-3-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-4-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-5-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-6-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-7-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-8-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-9-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-10-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-11-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-12-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-13-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-14-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-15-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-16-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:11613 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933757AbZJMIM5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Oct 2009 04:12:57 -0400
Received: from eu_spt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0KRG00BM80V2A980@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Oct 2009 08:59:26 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0KRG0052L0V2CO@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Oct 2009 08:59:26 +0100 (BST)
In-reply-to: <1255420632-21116-16-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.arm.linux.org.uk, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, bhmin@samsung.com

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
index 2c0119f..8dee48e 100644
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
