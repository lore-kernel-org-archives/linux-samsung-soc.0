From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5PV210: fix unused LDO supply field from wm8994_pdata
Date: Thu,  5 Apr 2012 15:52:22 -0700
Message-ID: <1333666342-31059-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:61404 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751431Ab2DEW6x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Apr 2012 18:58:53 -0400
Received: by pbcun15 with SMTP id un15so2033581pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Apr 2012 15:58:52 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>

According to commit 719a4240("mfd: Remove unused LDO supply field
from WM8994 pdata"), the LDO supply field should be removed from
the initializer.

Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv210/mach-aquila.c |    4 ++--
 arch/arm/mach-s5pv210/mach-goni.c   |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-s5pv210/mach-aquila.c b/arch/arm/mach-s5pv210/mach-aquila.c
index a9ea64e..48d018f 100644
--- a/arch/arm/mach-s5pv210/mach-aquila.c
+++ b/arch/arm/mach-s5pv210/mach-aquila.c
@@ -484,8 +484,8 @@ static struct wm8994_pdata wm8994_platform_data = {
 	.gpio_defaults[8] = 0x0100,
 	.gpio_defaults[9] = 0x0100,
 	.gpio_defaults[10] = 0x0100,
-	.ldo[0]	= { S5PV210_MP03(6), NULL, &wm8994_ldo1_data },	/* XM0FRNB_2 */
-	.ldo[1]	= { 0, NULL, &wm8994_ldo2_data },
+	.ldo[0]	= { S5PV210_MP03(6), &wm8994_ldo1_data },	/* XM0FRNB_2 */
+	.ldo[1]	= { 0, &wm8994_ldo2_data },
 };
 
 /* GPIO I2C PMIC */
diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index 2cf5ed7..a8933de 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -674,8 +674,8 @@ static struct wm8994_pdata wm8994_platform_data = {
 	.gpio_defaults[8] = 0x0100,
 	.gpio_defaults[9] = 0x0100,
 	.gpio_defaults[10] = 0x0100,
-	.ldo[0]	= { S5PV210_MP03(6), NULL, &wm8994_ldo1_data },	/* XM0FRNB_2 */
-	.ldo[1]	= { 0, NULL, &wm8994_ldo2_data },
+	.ldo[0]	= { S5PV210_MP03(6), &wm8994_ldo1_data },	/* XM0FRNB_2 */
+	.ldo[1]	= { 0, &wm8994_ldo2_data },
 };
 
 /* GPIO I2C PMIC */
-- 
1.7.2.3
