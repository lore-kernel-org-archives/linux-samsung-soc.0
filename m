From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 3/4] ARM: SAMSUNG: Add __init attribute to samsung_bl_set()
Date: Thu,  1 Mar 2012 14:47:25 +0530
Message-ID: <1330593446-663-4-git-send-email-tushar.behera@linaro.org>
References: <1330593446-663-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f51.google.com ([209.85.210.51]:46862 "EHLO
	mail-pz0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964878Ab2CAJYN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Mar 2012 04:24:13 -0500
Received: by mail-pz0-f51.google.com with SMTP id y9so637188dad.10
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Mar 2012 01:24:13 -0800 (PST)
In-Reply-To: <1330593446-663-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: ben-linux@fluff.org, linux@arm.linux.org.uk, kgene.kim@samsung.com, kyungmin.park@samsung.com, patches@linaro.org

s3c_set_platdata() is defined with __init attribute, hence all functions
referencing this function should also be defined with __init attribute.

samsung_bl_set() is referenced only in '__init xxx_machine_init()' functions,
thus this change won't put any additional constraint on the usage of
samsung_bl_set().

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/plat-samsung/dev-backlight.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-samsung/dev-backlight.c b/arch/arm/plat-samsung/dev-backlight.c
index 2254920..5f197dc 100644
--- a/arch/arm/plat-samsung/dev-backlight.c
+++ b/arch/arm/plat-samsung/dev-backlight.c
@@ -77,7 +77,7 @@ static struct platform_device samsung_dfl_bl_device __initdata = {
  * @gpio_info:	structure containing GPIO info for PWM timer
  * @bl_data:	structure containing Backlight control data
  */
-void samsung_bl_set(struct samsung_bl_gpio_info *gpio_info,
+void __init samsung_bl_set(struct samsung_bl_gpio_info *gpio_info,
 	struct platform_pwm_backlight_data *bl_data)
 {
 	int ret = 0;
-- 
1.7.4.1
