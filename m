From: Vladimir Zapolskiy <vzapolskiy@gmail.com>
Subject: [PATCH 1/4] ARM: S5P: add security subsystem memory region defines
Date: Tue, 12 Apr 2011 01:02:54 +0300
Message-ID: <1302559377-14857-2-git-send-email-vzapolskiy@gmail.com>
References: <1302559377-14857-1-git-send-email-vzapolskiy@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:37830 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754404Ab1DKWDW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Apr 2011 18:03:22 -0400
Received: by mail-ew0-f46.google.com with SMTP id 4so1854201ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Apr 2011 15:03:21 -0700 (PDT)
In-Reply-To: <1302559377-14857-1-git-send-email-vzapolskiy@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Vladimir Zapolskiy <vzapolskiy@gmail.com>

This change adds macro definitions for starting addresses of security
subsystems found on Samsung S3C64xx, S5PC100 and S5PV210 SoCs.

Signed-off-by: Vladimir Zapolskiy <vzapolskiy@gmail.com>
---
 arch/arm/mach-s3c64xx/include/mach/map.h |    2 ++
 arch/arm/mach-s5pc100/include/mach/map.h |    2 ++
 arch/arm/mach-s5pv210/include/mach/map.h |    3 +++
 3 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/include/mach/map.h b/arch/arm/mach-s3c64xx/include/mach/map.h
index a1f13f0..5aa747b 100644
--- a/arch/arm/mach-s3c64xx/include/mach/map.h
+++ b/arch/arm/mach-s3c64xx/include/mach/map.h
@@ -101,6 +101,8 @@
 #define S3C64XX_PA_USB_HSPHY	(0x7C100000)
 #define S3C64XX_VA_USB_HSPHY	S3C_ADDR_CPU(0x00200000)
 
+#define S3C64XX_PA_SECSS	0x7D000000
+
 /* place VICs close together */
 #define VA_VIC0			(S3C_VA_IRQ + 0x00)
 #define VA_VIC1			(S3C_VA_IRQ + 0x10000)
diff --git a/arch/arm/mach-s5pc100/include/mach/map.h b/arch/arm/mach-s5pc100/include/mach/map.h
index ccbe6b7..9cce448 100644
--- a/arch/arm/mach-s5pc100/include/mach/map.h
+++ b/arch/arm/mach-s5pc100/include/mach/map.h
@@ -84,6 +84,8 @@
 
 #define S5PC100_PA_KEYPAD		0xF3100000
 
+#define S5PC100_PA_SECSS		0xF4000000
+
 /* Compatibiltiy Defines */
 
 #define S3C_PA_FB			S5PC100_PA_FB
diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/mach-s5pv210/include/mach/map.h
index 1dd5883..6161508 100644
--- a/arch/arm/mach-s5pv210/include/mach/map.h
+++ b/arch/arm/mach-s5pv210/include/mach/map.h
@@ -59,6 +59,8 @@
 
 #define S5PV210_PA_CFCON		0xE8200000
 
+#define S5PV210_PA_SECSS		0xEA000000
+
 #define S5PV210_PA_HSMMC(x)		(0xEB000000 + ((x) * 0x100000))
 
 #define S5PV210_PA_HSOTG		0xEC000000
@@ -113,6 +115,7 @@
 #define S5P_PA_SROMC			S5PV210_PA_SROMC
 #define S5P_PA_SYSCON			S5PV210_PA_SYSCON
 #define S5P_PA_TIMER			S5PV210_PA_TIMER
+#define S5P_PA_SECSS			S5PV210_PA_SECSS
 
 #define SAMSUNG_PA_ADC			S5PV210_PA_ADC
 #define SAMSUNG_PA_CFCON		S5PV210_PA_CFCON
-- 
1.7.2.3
