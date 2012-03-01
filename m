From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/4] ARM: EXYNOS: Enable JPEG on Origen
Date: Thu,  1 Mar 2012 09:35:50 +0530
Message-ID: <1330574752-14088-3-git-send-email-sachin.kamat@linaro.org>
References: <1330574752-14088-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:63053 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754146Ab2CAESM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Feb 2012 23:18:12 -0500
Received: by pbcup15 with SMTP id up15so391477pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Feb 2012 20:18:12 -0800 (PST)
In-Reply-To: <1330574752-14088-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Enables JPEG support on Origen board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/Kconfig       |    1 +
 arch/arm/mach-exynos/mach-origen.c |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 8757124..41eead3 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -305,6 +305,7 @@ config MACH_ORIGEN
 	select S5P_DEV_FIMD0
 	select S5P_DEV_G2D
 	select S5P_DEV_I2C_HDMIPHY
+	select S5P_DEV_JPEG
 	select S5P_DEV_MFC
 	select S5P_DEV_TV
 	select S5P_DEV_USB_EHCI
diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-exynos/mach-origen.c
index 02c242e..827cb99 100644
--- a/arch/arm/mach-exynos/mach-origen.c
+++ b/arch/arm/mach-exynos/mach-origen.c
@@ -637,6 +637,7 @@ static struct platform_device *origen_devices[] __initdata = {
 	&s5p_device_g2d,
 	&s5p_device_hdmi,
 	&s5p_device_i2c_hdmiphy,
+	&s5p_device_jpeg,
 	&s5p_device_mfc,
 	&s5p_device_mfc_l,
 	&s5p_device_mfc_r,
-- 
1.7.4.1
