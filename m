From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: Fix Section mismatch in samsung_bl_set()
Date: Fri, 29 Jul 2011 10:31:32 +0900
Message-ID: <1311903092-14308-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:37621 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756215Ab1G2Bo4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Jul 2011 21:44:56 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

WARNING: vmlinux.o(.text+0xf47c): Section mismatch in reference from the function samsung_bl_set() to the (unknown reference) .init.data:(unknown)
The function samsung_bl_set() references
the (unknown reference) __initdata (unknown).
This is often because samsung_bl_set lacks a __initdata
annotation or the annotation of (unknown) is wrong.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/plat-samsung/include/plat/backlight.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/backlight.h b/arch/arm/plat-samsung/include/plat/backlight.h
index 51d8da8..ad530c7 100644
--- a/arch/arm/plat-samsung/include/plat/backlight.h
+++ b/arch/arm/plat-samsung/include/plat/backlight.h
@@ -20,7 +20,7 @@ struct samsung_bl_gpio_info {
 	int func;
 };
 
-extern void samsung_bl_set(struct samsung_bl_gpio_info *gpio_info,
+extern void __init samsung_bl_set(struct samsung_bl_gpio_info *gpio_info,
 	struct platform_pwm_backlight_data *bl_data);
 
 #endif /* __ASM_PLAT_BACKLIGHT_H */
-- 
1.7.1
