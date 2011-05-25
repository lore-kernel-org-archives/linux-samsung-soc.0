From: Inderpal Singh <inderpal.singh@linaro.org>
Subject: [PATCH] ARM: EXYNOS4: Enable SATA on SMDKV310
Date: Wed, 25 May 2011 09:01:47 +0530
Message-ID: <1306294307-17315-1-git-send-email-inderpal.s@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-px0-f173.google.com ([209.85.212.173]:43244 "EHLO
	mail-px0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756090Ab1EYDdV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 May 2011 23:33:21 -0400
Received: by pxi16 with SMTP id 16so4783428pxi.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 May 2011 20:33:20 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: samsung@lists.linaro.org, kgene.kim@samsung.com, patches@linaro.org, Inderpal Singh <inderpal.s@samsung.com>

Adds device definition to enable SATA on SMDKV310

Signed-off-by: Inderpal Singh <inderpal.s@samsung.com>
---
 arch/arm/mach-exynos4/Kconfig         |    1 +
 arch/arm/mach-exynos4/mach-smdkv310.c |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index 11b57a4..9cbf9b8 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -122,6 +122,7 @@ config MACH_SMDKV310
 	select S3C_DEV_HSMMC1
 	select S3C_DEV_HSMMC2
 	select S3C_DEV_HSMMC3
+	select EXYNOS4_DEV_AHCI
 	select SAMSUNG_DEV_KEYPAD
 	select EXYNOS4_DEV_PD
 	select EXYNOS4_DEV_SYSMMU
diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-exynos4/mach-smdkv310.c
index 1526764..666ebe5 100644
--- a/arch/arm/mach-exynos4/mach-smdkv310.c
+++ b/arch/arm/mach-exynos4/mach-smdkv310.c
@@ -188,6 +188,7 @@ static struct platform_device *smdkv310_devices[] __initdata = {
 	&exynos4_device_sysmmu,
 	&samsung_asoc_dma,
 	&smdkv310_smsc911x,
+	&exynos4_device_ahci,
 };
 
 static void __init smdkv310_smsc911x_init(void)
-- 
1.7.1
