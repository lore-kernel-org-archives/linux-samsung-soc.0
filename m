From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 22/23] ARM: S3C24XX: Remove S3C2410_GPJ numbering
Date: Fri,  7 May 2010 08:15:44 +0900
Message-ID: <1273187745-6566-23-git-send-email-ben-linux@fluff.org>
References: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [121.136.51.148] ([121.136.51.148]:60665 "EHLO ben-laptop"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754160Ab0EFXQK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 May 2010 19:16:10 -0400
In-Reply-To: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Remove the old S3C2410_GPJ as we will be moving to the new gpiolib
based driver code and these numbers will become invalid.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/mach-s3c2410/include/mach/regs-gpioj.h |   19 -------------------
 1 files changed, 0 insertions(+), 19 deletions(-)

diff --git a/arch/arm/mach-s3c2410/include/mach/regs-gpioj.h b/arch/arm/mach-s3c2410/include/mach/regs-gpioj.h
index de463bc..5025757 100644
--- a/arch/arm/mach-s3c2410/include/mach/regs-gpioj.h
+++ b/arch/arm/mach-s3c2410/include/mach/regs-gpioj.h
@@ -22,81 +22,62 @@
  * pull up works like all other ports.
 */
 
-#define S3C2440_GPIO_BANKJ  (416)
-
 #define S3C2413_GPJCON		S3C2410_GPIOREG(0x80)
 #define S3C2413_GPJDAT		S3C2410_GPIOREG(0x84)
 #define S3C2413_GPJUP		S3C2410_GPIOREG(0x88)
 #define S3C2413_GPJSLPCON	S3C2410_GPIOREG(0x8C)
 
-#define S3C2440_GPJ0            S3C2410_GPIONO(S3C2440_GPIO_BANKJ, 0)
 #define S3C2440_GPJ0_INP        (0x00 << 0)
 #define S3C2440_GPJ0_OUTP       (0x01 << 0)
 #define S3C2440_GPJ0_CAMDATA0   (0x02 << 0)
 
-#define S3C2440_GPJ1            S3C2410_GPIONO(S3C2440_GPIO_BANKJ, 1)
 #define S3C2440_GPJ1_INP        (0x00 << 2)
 #define S3C2440_GPJ1_OUTP       (0x01 << 2)
 #define S3C2440_GPJ1_CAMDATA1   (0x02 << 2)
 
-#define S3C2440_GPJ2            S3C2410_GPIONO(S3C2440_GPIO_BANKJ, 2)
 #define S3C2440_GPJ2_INP        (0x00 << 4)
 #define S3C2440_GPJ2_OUTP       (0x01 << 4)
 #define S3C2440_GPJ2_CAMDATA2   (0x02 << 4)
 
-#define S3C2440_GPJ3            S3C2410_GPIONO(S3C2440_GPIO_BANKJ, 3)
 #define S3C2440_GPJ3_INP        (0x00 << 6)
 #define S3C2440_GPJ3_OUTP       (0x01 << 6)
 #define S3C2440_GPJ3_CAMDATA3   (0x02 << 6)
 
-#define S3C2440_GPJ4            S3C2410_GPIONO(S3C2440_GPIO_BANKJ, 4)
 #define S3C2440_GPJ4_INP        (0x00 << 8)
 #define S3C2440_GPJ4_OUTP       (0x01 << 8)
 #define S3C2440_GPJ4_CAMDATA4   (0x02 << 8)
 
-#define S3C2440_GPJ5            S3C2410_GPIONO(S3C2440_GPIO_BANKJ, 5)
 #define S3C2440_GPJ5_INP        (0x00 << 10)
 #define S3C2440_GPJ5_OUTP       (0x01 << 10)
 #define S3C2440_GPJ5_CAMDATA5   (0x02 << 10)
 
-#define S3C2440_GPJ6            S3C2410_GPIONO(S3C2440_GPIO_BANKJ, 6)
 #define S3C2440_GPJ6_INP        (0x00 << 12)
 #define S3C2440_GPJ6_OUTP       (0x01 << 12)
 #define S3C2440_GPJ6_CAMDATA6   (0x02 << 12)
 
-#define S3C2440_GPJ7            S3C2410_GPIONO(S3C2440_GPIO_BANKJ, 7)
 #define S3C2440_GPJ7_INP        (0x00 << 14)
 #define S3C2440_GPJ7_OUTP       (0x01 << 14)
 #define S3C2440_GPJ7_CAMDATA7   (0x02 << 14)
 
-#define S3C2440_GPJ8            S3C2410_GPIONO(S3C2440_GPIO_BANKJ, 8)
 #define S3C2440_GPJ8_INP        (0x00 << 16)
 #define S3C2440_GPJ8_OUTP       (0x01 << 16)
 #define S3C2440_GPJ8_CAMPCLK    (0x02 << 16)
 
-#define S3C2440_GPJ9            S3C2410_GPIONO(S3C2440_GPIO_BANKJ, 9)
 #define S3C2440_GPJ9_INP        (0x00 << 18)
 #define S3C2440_GPJ9_OUTP       (0x01 << 18)
 #define S3C2440_GPJ9_CAMVSYNC   (0x02 << 18)
 
-#define S3C2440_GPJ10           S3C2410_GPIONO(S3C2440_GPIO_BANKJ, 10)
 #define S3C2440_GPJ10_INP       (0x00 << 20)
 #define S3C2440_GPJ10_OUTP      (0x01 << 20)
 #define S3C2440_GPJ10_CAMHREF   (0x02 << 20)
 
-#define S3C2440_GPJ11           S3C2410_GPIONO(S3C2440_GPIO_BANKJ, 11)
 #define S3C2440_GPJ11_INP       (0x00 << 22)
 #define S3C2440_GPJ11_OUTP      (0x01 << 22)
 #define S3C2440_GPJ11_CAMCLKOUT (0x02 << 22)
 
-#define S3C2440_GPJ12           S3C2410_GPIONO(S3C2440_GPIO_BANKJ, 12)
 #define S3C2440_GPJ12_INP       (0x00 << 24)
 #define S3C2440_GPJ12_OUTP      (0x01 << 24)
 #define S3C2440_GPJ12_CAMRESET  (0x02 << 24)
 
-#define S3C2443_GPJ13		S3C2410_GPIONO(S3C2440_GPIO_BANKJ, 13)
-#define S3C2443_GPJ14		S3C2410_GPIONO(S3C2440_GPIO_BANKJ, 14)
-#define S3C2443_GPJ15		S3C2410_GPIONO(S3C2440_GPIO_BANKJ, 15)
-
 #endif	/* __ASM_ARCH_REGS_GPIOJ_H */
 
-- 
1.7.0.4
