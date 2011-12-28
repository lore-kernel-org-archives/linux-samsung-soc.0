From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ARM: EXYNOS: Enable G2D on Origen
Date: Wed, 28 Dec 2011 16:09:34 +0530
Message-ID: <1325068774-26334-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:61508 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753504Ab1L1KnA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Dec 2011 05:43:00 -0500
Received: by iaeh11 with SMTP id h11so21856152iae.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Dec 2011 02:42:59 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, k.debski@samsung.com, sachin.kamat@linaro.org

This patch enables G2D support on Origen board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/Kconfig       |    1 +
 arch/arm/mach-exynos/mach-origen.c |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index e931924..febfd53 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -303,6 +303,7 @@ config MACH_ORIGEN
 	select S5P_DEV_FIMC2
 	select S5P_DEV_FIMC3
 	select S5P_DEV_FIMD0
+	select S5P_DEV_G2D
 	select S5P_DEV_I2C_HDMIPHY
 	select S5P_DEV_MFC
 	select S5P_DEV_TV
diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-exynos/mach-origen.c
index a0116036..0ec2a63 100644
--- a/arch/arm/mach-exynos/mach-origen.c
+++ b/arch/arm/mach-exynos/mach-origen.c
@@ -632,6 +632,7 @@ static struct platform_device *origen_devices[] __initdata = {
 	&s5p_device_fimc2,
 	&s5p_device_fimc3,
 	&s5p_device_fimd0,
+	&s5p_device_g2d,
 	&s5p_device_hdmi,
 	&s5p_device_i2c_hdmiphy,
 	&s5p_device_mfc,
-- 
1.7.4.1
