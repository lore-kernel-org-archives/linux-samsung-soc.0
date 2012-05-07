From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ARM: EXYNOS: Make BT platform data structure static in mach-origen.c file
Date: Mon,  7 May 2012 09:16:55 +0530
Message-ID: <1336362415-15144-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:34818 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753127Ab2EGD4f (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 6 May 2012 23:56:35 -0400
Received: by dady13 with SMTP id y13so729248dad.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 06 May 2012 20:56:34 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Adds missing storage class static to origen_bt_pdata structure.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/mach-origen.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-exynos/mach-origen.c
index 4a8b3ff..df32cf4 100644
--- a/arch/arm/mach-exynos/mach-origen.c
+++ b/arch/arm/mach-exynos/mach-origen.c
@@ -607,7 +607,7 @@ static struct s3c_fb_platdata origen_lcd_pdata __initdata = {
 };
 
 /* Bluetooth rfkill gpio platform data */
-struct rfkill_gpio_platform_data origen_bt_pdata = {
+static struct rfkill_gpio_platform_data origen_bt_pdata = {
 	.reset_gpio	= EXYNOS4_GPX2(2),
 	.shutdown_gpio	= -1,
 	.type		= RFKILL_TYPE_BLUETOOTH,
-- 
1.7.4.1
