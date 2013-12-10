From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: exynos_defconfig: Enable S2MPS11 voltage regulator
Date: Tue, 10 Dec 2013 12:08:41 +0530
Message-ID: <1386657521-30924-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:33038 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751522Ab3LJGlj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Dec 2013 01:41:39 -0500
Received: by mail-pd0-f175.google.com with SMTP id w10so6701598pde.34
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Dec 2013 22:41:38 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org

S2MPS11 voltage regulator is commonly used on the latest Exynos
boards like SMDK5420, Arndale-Octa, etc. Hence it makes sense to
enable it like S5M8767A voltage regulator.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/configs/exynos_defconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index aec8a3ea1436..dbe1f1c47bb0 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -79,6 +79,7 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_GPIO=y
 CONFIG_REGULATOR_MAX8997=y
 CONFIG_REGULATOR_MAX77686=y
+CONFIG_REGULATOR_S2MPS11=y
 CONFIG_REGULATOR_S5M8767=y
 CONFIG_REGULATOR_TPS65090=y
 CONFIG_FB=y
-- 
1.7.9.5
