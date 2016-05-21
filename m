From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 0116/1529] Fix typo
Date: Sat, 21 May 2016 13:51:23 +0200
Message-ID: <20160521115123.5447-1-andrea.gelmini@gelma.net>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:36153 "EHLO
	mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751156AbcEULv3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 May 2016 07:51:29 -0400
Received: by mail-lf0-f67.google.com with SMTP id d132so1669340lfb.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 21 May 2016 04:51:29 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: andrea.gelmini@gelma.net
Cc: trivial@kernel.org, kgene@kernel.org, k.kozlowski@samsung.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/arm/mach-s3c24xx/include/mach/regs-gpio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c24xx/include/mach/regs-gpio.h b/arch/arm/mach-s3c24xx/include/mach/regs-gpio.h
index c6583cf..0d622f3 100644
--- a/arch/arm/mach-s3c24xx/include/mach/regs-gpio.h
+++ b/arch/arm/mach-s3c24xx/include/mach/regs-gpio.h
@@ -520,7 +520,7 @@
 #define S3C24XX_EXTINT1	   S3C24XX_GPIOREG2(0x8C)
 #define S3C24XX_EXTINT2	   S3C24XX_GPIOREG2(0x90)
 
-/* interrupt filtering conrrol for EINT16..EINT23 */
+/* interrupt filtering control for EINT16..EINT23 */
 #define S3C2410_EINFLT0	   S3C2410_GPIOREG(0x94)
 #define S3C2410_EINFLT1	   S3C2410_GPIOREG(0x98)
 #define S3C2410_EINFLT2	   S3C2410_GPIOREG(0x9C)
-- 
2.8.2.534.g1f66975
