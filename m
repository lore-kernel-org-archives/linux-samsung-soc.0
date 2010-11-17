From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH] ARM: S3C24XX: Add support UART3 for S3C2443 and S3C2416
Date: Wed, 17 Nov 2010 09:50:33 +0900
Message-ID: <1289955033-27971-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:36994 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933145Ab0KQA7q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Nov 2010 19:59:46 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, ben-linux@fluff.org, Abhilash Kesavan <a.kesavan@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>

From: Abhilash Kesavan <a.kesavan@samsung.com>

Both S3C2443 and S3C2416 support 4 UART channels, this patch adds support
for the missing uart channel.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 arch/arm/mach-s3c2416/mach-smdk2416.c |    7 +++++++
 arch/arm/mach-s3c2443/mach-smdk2443.c |    7 +++++++
 2 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c2416/mach-smdk2416.c b/arch/arm/mach-s3c2416/mach-smdk2416.c
index 7fc3664..ce08704 100644
--- a/arch/arm/mach-s3c2416/mach-smdk2416.c
+++ b/arch/arm/mach-s3c2416/mach-smdk2416.c
@@ -110,6 +110,13 @@ static struct s3c2410_uartcfg smdk2416_uartcfgs[] __initdata = {
 		.ucon	     = UCON,
 		.ulcon	     = ULCON | 0x50,
 		.ufcon	     = UFCON,
+	},
+	[3] = {
+		.hwport	     = 3,
+		.flags	     = 0,
+		.ucon	     = UCON,
+		.ulcon	     = ULCON,
+		.ufcon	     = UFCON,
 	}
 };
 
diff --git a/arch/arm/mach-s3c2443/mach-smdk2443.c b/arch/arm/mach-s3c2443/mach-smdk2443.c
index 4337f0a..0f131c1 100644
--- a/arch/arm/mach-s3c2443/mach-smdk2443.c
+++ b/arch/arm/mach-s3c2443/mach-smdk2443.c
@@ -99,6 +99,13 @@ static struct s3c2410_uartcfg smdk2443_uartcfgs[] __initdata = {
 		.ucon	     = 0x3c5,
 		.ulcon	     = 0x43,
 		.ufcon	     = 0x51,
+	},
+	[3] = {
+		.hwport	     = 3,
+		.flags	     = 0,
+		.ucon	     = 0x3c5,
+		.ulcon	     = 0x03,
+		.ufcon	     = 0x51,
 	}
 };
 
-- 
1.6.2.5
