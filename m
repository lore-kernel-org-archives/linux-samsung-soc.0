From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 0120/1529] Fix typo
Date: Sat, 21 May 2016 13:51:51 +0200
Message-ID: <20160521115151.5653-1-andrea.gelmini@gelma.net>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f194.google.com ([209.85.217.194]:35937 "EHLO
	mail-lb0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751156AbcEULv7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 May 2016 07:51:59 -0400
Received: by mail-lb0-f194.google.com with SMTP id r5so6869564lbj.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 21 May 2016 04:51:58 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: andrea.gelmini@gelma.net
Cc: trivial@kernel.org, kgene@kernel.org, k.kozlowski@samsung.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/arm/mach-s3c64xx/include/mach/map.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c64xx/include/mach/map.h b/arch/arm/mach-s3c64xx/include/mach/map.h
index f55ccb1..d51873e 100644
--- a/arch/arm/mach-s3c64xx/include/mach/map.h
+++ b/arch/arm/mach-s3c64xx/include/mach/map.h
@@ -99,7 +99,7 @@
 
 #define S3C64XX_PA_USB_HSPHY	(0x7C100000)
 
-/* compatibiltiy defines. */
+/* compatibility defines. */
 #define S3C_PA_TIMER		S3C64XX_PA_TIMER
 #define S3C_PA_HSMMC0		S3C64XX_PA_HSMMC0
 #define S3C_PA_HSMMC1		S3C64XX_PA_HSMMC1
-- 
2.8.2.534.g1f66975
