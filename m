From: Richard Weinberger <richard@nod.at>
Subject: [PATCH 22/28] Remove S3C24XX_GPIO_EXTRA128
Date: Sun,  9 Feb 2014 19:48:00 +0100
Message-ID: <1391971686-9517-23-git-send-email-richard@nod.at>
References: <1391971686-9517-1-git-send-email-richard@nod.at>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.sigma-star.at ([95.130.255.111]:62424 "EHLO
	mail.sigma-star.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752315AbaBISsm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 9 Feb 2014 13:48:42 -0500
In-Reply-To: <1391971686-9517-1-git-send-email-richard@nod.at>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, "moderated list:ARM
	SUB-ARCHITECT..." <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/SAMSUNG ARM A..." <linux-samsung-soc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: Richard Weinberger <richard@nod.at>

The symbol is an orphan, get rid of it.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 arch/arm/mach-s3c24xx/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-s3c24xx/Kconfig b/arch/arm/mach-s3c24xx/Kconfig
index 1c67f04..bb1fa603 100644
--- a/arch/arm/mach-s3c24xx/Kconfig
+++ b/arch/arm/mach-s3c24xx/Kconfig
@@ -561,7 +561,6 @@ config MACH_OSIRIS
 	select S3C2410_IOTIMING if ARM_S3C2440_CPUFREQ
 	select S3C2440_XTAL_12000000
 	select S3C24XX_DCLK
-	select S3C24XX_GPIO_EXTRA128
 	select S3C24XX_SIMTEC_PM if PM
 	select S3C_DEV_NAND
 	select S3C_DEV_USB_HOST
-- 
1.8.4.2
