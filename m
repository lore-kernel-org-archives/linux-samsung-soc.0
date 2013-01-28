From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH 5/5] ARM: EXYNOS: Enable backlight and PWM support for Exynos4 DT machines
Date: Mon, 28 Jan 2013 11:14:32 +0530
Message-ID: <1359351872-20518-6-git-send-email-vikas.sajjan@linaro.org>
References: <1359351872-20518-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f51.google.com ([209.85.210.51]:50371 "EHLO
	mail-da0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751690Ab3A1FpA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jan 2013 00:45:00 -0500
Received: by mail-da0-f51.google.com with SMTP id i30so1081624dad.10
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Jan 2013 21:44:59 -0800 (PST)
In-Reply-To: <1359351872-20518-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, thomas.abraham@linaro.org, sachin.kamat@linaro.org, t.figa@samsung.com, sylvester.nawrocki@gmail.com

Enables support for Backlight and PWM on Exynos4 DT machines

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/mach-exynos/Kconfig |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index e103c29..8ecde22 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -416,6 +416,8 @@ config MACH_EXYNOS4_DT
 	select PINCTRL
 	select PINCTRL_EXYNOS4
 	select USE_OF
+	select SAMSUNG_DEV_BACKLIGHT
+	select SAMSUNG_DEV_PWM
 	help
 	  Machine support for Samsung Exynos4 machine with device tree enabled.
 	  Select this if a fdt blob is available for the Exynos4 SoC based board.
-- 
1.7.9.5
