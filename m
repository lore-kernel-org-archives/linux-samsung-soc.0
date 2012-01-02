From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ARM: EXYNOS: Enable G2D on SMDKV310
Date: Mon,  2 Jan 2012 13:55:11 +0530
Message-ID: <1325492711-15012-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:60782 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751454Ab2ABI2v (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Jan 2012 03:28:51 -0500
Received: by iaeh11 with SMTP id h11so28947991iae.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Jan 2012 00:28:50 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: sachin.kamat@linaro.org, kgene.kim@samsung.com, patches@linaro.org

This patch enables G2D support on SMDKV310 board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/Kconfig         |    1 +
 arch/arm/mach-exynos/mach-smdkv310.c |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index bd4600e..a673d0d 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -183,6 +183,7 @@ config MACH_SMDKV310
 	select S5P_DEV_FIMC1
 	select S5P_DEV_FIMC2
 	select S5P_DEV_FIMC3
+	select S5P_DEV_G2D
 	select S5P_DEV_I2C_HDMIPHY
 	select S5P_DEV_MFC
 	select S5P_DEV_TV
diff --git a/arch/arm/mach-exynos/mach-smdkv310.c b/arch/arm/mach-exynos/mach-smdkv310.c
index b2c5557..8a5c23b 100644
--- a/arch/arm/mach-exynos/mach-smdkv310.c
+++ b/arch/arm/mach-exynos/mach-smdkv310.c
@@ -270,6 +270,7 @@ static struct platform_device *smdkv310_devices[] __initdata = {
 	&s5p_device_fimc1,
 	&s5p_device_fimc2,
 	&s5p_device_fimc3,
+	&s5p_device_g2d,
 	&exynos4_device_ac97,
 	&exynos4_device_i2s0,
 	&exynos4_device_ohci,
-- 
1.7.4.1
