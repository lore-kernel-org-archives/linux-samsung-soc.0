From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ARM: EXYNOS4: Register HSMMC2 before HSMMC0 on SMDKV310 board
Date: Wed, 13 Apr 2011 10:08:54 +0530
Message-ID: <1302669534-28926-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:41309 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751071Ab1DMEjU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Apr 2011 00:39:20 -0400
Received: by pwi15 with SMTP id 15so121990pwi.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Apr 2011 21:39:19 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, linaro-dev@lists.linaro.org, patches@linaro.org

On Exynos4210 SOC, of all the HSMMC controllers only HSMMC2 can
be used as a boot media. Hence the default SD/MMC card should be
connected to HSMMC2. The secondary card is connected to HSMMC0.

If HSMMC0 is registered before HSMMC2, the device node for default
MMC card changes depending on whether secondary card is connected
or not. It creates problem in mounting the file-system present in
default SD/MMC card. Hence HSMMC2 should be registered before HSMMC0.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-exynos4/mach-smdkv310.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-exynos4/mach-smdkv310.c
index f6b1c7e..4f34d43 100644
--- a/arch/arm/mach-exynos4/mach-smdkv310.c
+++ b/arch/arm/mach-exynos4/mach-smdkv310.c
@@ -168,9 +168,9 @@ static struct i2c_board_info i2c_devs1[] __initdata = {
 };
 
 static struct platform_device *smdkv310_devices[] __initdata = {
+	&s3c_device_hsmmc2,
 	&s3c_device_hsmmc0,
 	&s3c_device_hsmmc1,
-	&s3c_device_hsmmc2,
 	&s3c_device_hsmmc3,
 	&s3c_device_i2c1,
 	&s3c_device_rtc,
-- 
1.7.1
