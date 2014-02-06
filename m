From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 02/12] ARM: SAMSUNG: Add soc_is_s3c2410() helper
Date: Thu, 06 Feb 2014 20:12:47 +0100
Message-ID: <1391713977-22300-3-git-send-email-t.figa@samsung.com>
References: <1391713977-22300-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:19084 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756838AbaBFTNH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Feb 2014 14:13:07 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N0L00K5W9DUO2B0@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Feb 2014 19:13:06 +0000 (GMT)
In-reply-to: <1391713977-22300-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <t.figa@samsung.com>

Due to the S3C2410 SoC being quite different from other S3C24xx SoCs
in some aspects, such as availability of DIVSLOT register in its UART
blocks, there is a need sometimes to check whether we are running on
this SoC, not just the S3C24xx series. This patch adds soc_is_s3c2410()
helper function for this purpose.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-samsung/include/plat/cpu.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/plat-samsung/include/plat/cpu.h b/arch/arm/plat-samsung/include/plat/cpu.h
index 335beb3..6bf86f6 100644
--- a/arch/arm/plat-samsung/include/plat/cpu.h
+++ b/arch/arm/plat-samsung/include/plat/cpu.h
@@ -20,6 +20,9 @@
 
 extern unsigned long samsung_cpu_id;
 
+#define S3C2410_CPU_ID		0x32410000
+#define S3C2410_CPU_MASK	0xFFFFFFFF
+
 #define S3C24XX_CPU_ID		0x32400000
 #define S3C24XX_CPU_MASK	0xFFF00000
 
@@ -56,6 +59,7 @@ static inline int is_samsung_##name(void)	\
 	return ((samsung_cpu_id & mask) == (id & mask));	\
 }
 
+IS_SAMSUNG_CPU(s3c2410, S3C2410_CPU_ID, S3C2410_CPU_MASK)
 IS_SAMSUNG_CPU(s3c24xx, S3C24XX_CPU_ID, S3C24XX_CPU_MASK)
 IS_SAMSUNG_CPU(s3c2412, S3C2412_CPU_ID, S3C2412_CPU_MASK)
 IS_SAMSUNG_CPU(s3c6400, S3C6400_CPU_ID, S3C64XX_CPU_MASK)
@@ -76,8 +80,10 @@ IS_SAMSUNG_CPU(exynos5440, EXYNOS5440_SOC_ID, EXYNOS5_SOC_MASK)
     defined(CONFIG_CPU_S3C2442) || defined(CONFIG_CPU_S3C244X) || \
     defined(CONFIG_CPU_S3C2443)
 # define soc_is_s3c24xx()	is_samsung_s3c24xx()
+# define soc_is_s3c2410()	is_samsung_s3c2410()
 #else
 # define soc_is_s3c24xx()	0
+# define soc_is_s3c2410()	0
 #endif
 
 #if defined(CONFIG_CPU_S3C2412)
-- 
1.8.5.2
