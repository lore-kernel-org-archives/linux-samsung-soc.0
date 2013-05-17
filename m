From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 3/6] ARM: SAMSUNG: pm: Adjust for pinctrl- and DT-enabled
 platforms
Date: Fri, 17 May 2013 18:24:29 +0200
Message-ID: <1368807872-2601-4-git-send-email-t.figa@samsung.com>
References: <1368807872-2601-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:17618 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755763Ab3EQQZD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 May 2013 12:25:03 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MMY003AFAXG67C0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 17 May 2013 17:25:01 +0100 (BST)
In-reply-to: <1368807872-2601-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, arnd@arndb.de, olof@lixom.net, Doug Anderson <dianders@chromium.org>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Prathyush K <prathyush.k@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Tomasz Figa <t.figa@samsung.com>

This patch makes legacy code on suspend/resume path being executed
conditionally, on non-DT platforms only, to fix suspend/resume of
DT-enabled systems, for which the code is inappropriate.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-samsung/pm.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/arm/plat-samsung/pm.c b/arch/arm/plat-samsung/pm.c
index 53210ec..8ac2b2d 100644
--- a/arch/arm/plat-samsung/pm.c
+++ b/arch/arm/plat-samsung/pm.c
@@ -261,7 +261,8 @@ static int s3c_pm_enter(suspend_state_t state)
 	 * require a full power-cycle)
 	*/
 
-	if (!any_allowed(s3c_irqwake_intmask, s3c_irqwake_intallow) &&
+	if (!of_have_populated_dt() &&
+	    !any_allowed(s3c_irqwake_intmask, s3c_irqwake_intallow) &&
 	    !any_allowed(s3c_irqwake_eintmask, s3c_irqwake_eintallow)) {
 		printk(KERN_ERR "%s: No wake-up sources!\n", __func__);
 		printk(KERN_ERR "%s: Aborting sleep\n", __func__);
@@ -270,8 +271,11 @@ static int s3c_pm_enter(suspend_state_t state)
 
 	/* save all necessary core registers not covered by the drivers */
 
-	samsung_pm_save_gpios();
-	samsung_pm_saved_gpios();
+	if (!of_have_populated_dt()) {
+		samsung_pm_save_gpios();
+		samsung_pm_saved_gpios();
+	}
+
 	s3c_pm_save_uarts();
 	s3c_pm_save_core();
 
@@ -310,8 +314,11 @@ static int s3c_pm_enter(suspend_state_t state)
 
 	s3c_pm_restore_core();
 	s3c_pm_restore_uarts();
-	samsung_pm_restore_gpios();
-	s3c_pm_restored_gpios();
+
+	if (!of_have_populated_dt()) {
+		samsung_pm_restore_gpios();
+		s3c_pm_restored_gpios();
+	}
 
 	s3c_pm_debug_init();
 
-- 
1.8.2.1
