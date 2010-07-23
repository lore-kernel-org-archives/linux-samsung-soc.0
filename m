From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 7/8] ARM: S5PC100: enable FIMC on SMDKC100
Date: Fri, 23 Jul 2010 18:21:22 +0200
Message-ID: <1279902083-21250-8-git-send-email-s.nawrocki@samsung.com>
References: <1279902083-21250-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:31055 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757719Ab0GWQVv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Jul 2010 12:21:51 -0400
Received: from eu_spt2 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L6000JMXQS0IV@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Jul 2010 17:21:36 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L6000KDJQRZ3M@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Jul 2010 17:21:36 +0100 (BST)
In-reply-to: <1279902083-21250-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: p.osciak@samsung.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

Add support for FIMC on Samsung SMDKC100 board.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/mach-s5pc100/Kconfig         |    3 +++
 arch/arm/mach-s5pc100/mach-smdkc100.c |    4 ++++
 2 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pc100/Kconfig b/arch/arm/mach-s5pc100/Kconfig
index cd7f4e9..6cc254c 100644
--- a/arch/arm/mach-s5pc100/Kconfig
+++ b/arch/arm/mach-s5pc100/Kconfig
@@ -65,6 +65,9 @@ config MACH_SMDKC100
 	select S5PC100_SETUP_IDE
 	select S5PC100_SETUP_KEYPAD
 	select S5PC100_SETUP_SDHCI
+	select S5P_DEV_FIMC0
+	select S5P_DEV_FIMC1
+	select S5P_DEV_FIMC2
 	help
 	  Machine support for the Samsung SMDKC100
 
diff --git a/arch/arm/mach-s5pc100/mach-smdkc100.c b/arch/arm/mach-s5pc100/mach-smdkc100.c
index a00dd09..53ea3c2 100644
--- a/arch/arm/mach-s5pc100/mach-smdkc100.c
+++ b/arch/arm/mach-s5pc100/mach-smdkc100.c
@@ -47,6 +47,7 @@
 #include <plat/adc.h>
 #include <plat/keypad.h>
 #include <plat/ts.h>
+#include <plat/fimc.h>
 
 /* Following are default values for UCON, ULCON and UFCON UART registers */
 #define S5PC100_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
@@ -192,6 +193,9 @@ static struct platform_device *smdkc100_devices[] __initdata = {
 	&s5pc100_device_iis0,
 	&samsung_device_keypad,
 	&s5pc100_device_ac97,
+	&s5p_device_fimc0,
+	&s5p_device_fimc1,
+	&s5p_device_fimc2,
 };
 
 static struct s3c2410_ts_mach_info s3c_ts_platform __initdata = {
-- 
1.7.2
