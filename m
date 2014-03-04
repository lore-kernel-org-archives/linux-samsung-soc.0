From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: exynos_defconfig: Enable HS-I2C
Date: Tue,  4 Mar 2014 17:52:56 +0530
Message-ID: <1393935776-22657-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:46567 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757184AbaCDM3N (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Mar 2014 07:29:13 -0500
Received: by mail-pd0-f180.google.com with SMTP id v10so3052456pde.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Mar 2014 04:29:13 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org

High speed I2C is used on Exynos5 based SoCs. Enable it.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/configs/exynos_defconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 4ce7b70ea901..e07a227ec0db 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -65,6 +65,7 @@ CONFIG_TCG_TIS_I2C_INFINEON=y
 CONFIG_I2C=y
 CONFIG_I2C_MUX=y
 CONFIG_I2C_ARB_GPIO_CHALLENGE=y
+CONFIG_I2C_EXYNOS5=y
 CONFIG_I2C_S3C2410=y
 CONFIG_DEBUG_GPIO=y
 # CONFIG_HWMON is not set
-- 
1.7.9.5
