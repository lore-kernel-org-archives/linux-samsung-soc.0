From: Paul Bolle <pebolle@tiscali.nl>
Subject: [PATCH] ARM: S3C64XX: remove obsolete Makefile line
Date: Fri, 29 Mar 2013 23:51:42 +0100
Message-ID: <1364597502.1345.103.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cpsmtpb-ews06.kpnxchange.com ([213.75.39.9]:57101 "EHLO
	cpsmtpb-ews06.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757234Ab3C2Wvp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 29 Mar 2013 18:51:45 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Commit a07613a54d700a974f3a4a657da78ef5d097315d ("Merge branch
'samsung/dt' into samsung/cleanup") added this line to
arch/arm/mach-s3c64xx/Makefile:
    obj-$(CONFIG_S3C64XX_DEV_SPI)	+= dev-spi.o

But at that time CONFIG_S3C64XX_DEV_SPI wasn't a valid Kconfig macro
anymore and arch/arm/mach-s3c64xx/dev-spi.c was already removed. So we
can remove this line.

Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
---
Untested.

 arch/arm/mach-s3c64xx/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-s3c64xx/Makefile b/arch/arm/mach-s3c64xx/Makefile
index f9ce1dc..31d0c91 100644
--- a/arch/arm/mach-s3c64xx/Makefile
+++ b/arch/arm/mach-s3c64xx/Makefile
@@ -32,7 +32,6 @@ obj-$(CONFIG_S3C64XX_DMA)	+= dma.o
 
 obj-y				+= dev-uart.o
 obj-y				+= dev-audio.o
-obj-$(CONFIG_S3C64XX_DEV_SPI)	+= dev-spi.o
 
 # Device setup
 
-- 
1.7.11.7
