From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/4] ARM: EXYNOS: Enable JPEG on SMDKV310
Date: Thu,  1 Mar 2012 09:35:49 +0530
Message-ID: <1330574752-14088-2-git-send-email-sachin.kamat@linaro.org>
References: <1330574752-14088-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:56907 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755583Ab2CAEMX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Feb 2012 23:12:23 -0500
Received: by mail-pw0-f46.google.com with SMTP id up15so386443pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Feb 2012 20:12:22 -0800 (PST)
In-Reply-To: <1330574752-14088-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Enables JPEG support on SMDKV310 board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/Kconfig         |    1 +
 arch/arm/mach-exynos/mach-smdkv310.c |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 92c145b..8757124 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -180,6 +180,7 @@ config MACH_SMDKV310
 	select S5P_DEV_FIMC2
 	select S5P_DEV_FIMC3
 	select S5P_DEV_I2C_HDMIPHY
+	select S5P_DEV_JPEG
 	select S5P_DEV_MFC
 	select S5P_DEV_TV
 	select S5P_DEV_USB_EHCI
diff --git a/arch/arm/mach-exynos/mach-smdkv310.c b/arch/arm/mach-exynos/mach-smdkv310.c
index 2b71f18..51db8af 100644
--- a/arch/arm/mach-exynos/mach-smdkv310.c
+++ b/arch/arm/mach-exynos/mach-smdkv310.c
@@ -267,6 +267,7 @@ static struct platform_device *smdkv310_devices[] __initdata = {
 	&s5p_device_fimc2,
 	&s5p_device_fimc3,
 	&s5p_device_fimc_md,
+	&s5p_device_jpeg,
 	&exynos4_device_ac97,
 	&exynos4_device_i2s0,
 	&exynos4_device_ohci,
-- 
1.7.4.1
