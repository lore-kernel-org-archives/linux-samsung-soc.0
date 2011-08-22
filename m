From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ARM: EXYNOS4: Add FIMC device on SMDKV310 board
Date: Mon, 22 Aug 2011 17:31:29 +0530
Message-ID: <1314014489-10479-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:64964 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751726Ab1HVMEI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Aug 2011 08:04:08 -0400
Received: by gya6 with SMTP id 6so3494532gya.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Aug 2011 05:04:08 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org, sachin.kamat@linaro.org

This patch adds definitions to enable support for s5p-fimc driver on
SMDKV310 board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos4/Kconfig         |    4 ++++
 arch/arm/mach-exynos4/mach-smdkv310.c |    4 ++++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index e6925de..95f778e 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -135,6 +135,10 @@ config MACH_SMDKC210
 config MACH_SMDKV310
 	bool "SMDKV310"
 	select CPU_EXYNOS4210
+	select S5P_DEV_FIMC0
+	select S5P_DEV_FIMC1
+	select S5P_DEV_FIMC2
+	select S5P_DEV_FIMC3
 	select S5P_DEV_FIMD0
 	select S3C_DEV_RTC
 	select S3C_DEV_WDT
diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-exynos4/mach-smdkv310.c
index 5f62b2b..4380b02 100644
--- a/arch/arm/mach-exynos4/mach-smdkv310.c
+++ b/arch/arm/mach-exynos4/mach-smdkv310.c
@@ -168,6 +168,10 @@ static struct i2c_board_info i2c_devs1[] __initdata = {
 };
 
 static struct platform_device *smdkv310_devices[] __initdata = {
+	&s5p_device_fimc0,
+	&s5p_device_fimc1,
+	&s5p_device_fimc2,
+	&s5p_device_fimc3,
 	&s3c_device_hsmmc0,
 	&s3c_device_hsmmc1,
 	&s3c_device_hsmmc2,
-- 
1.7.4.1
