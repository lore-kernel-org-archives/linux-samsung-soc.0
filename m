From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH] pinctrl: exynos: Remove eint_gpio_init call-back for exynos7 alive pinctrl block
Date: Sun,  1 Mar 2015 21:51:16 +0530
Message-ID: <1425226876-5122-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:36504 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751557AbbCAQV2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 1 Mar 2015 11:21:28 -0500
Received: by padfa1 with SMTP id fa1so1096767pad.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 01 Mar 2015 08:21:28 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: tomasz.figa@gmail.com, linus.walleij@linaro.org
Cc: kesavan.abhilash@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

The alive pin controller on exynos7 does not support external gpio
interrupts. Hence, remove the eint_gpio_init call-back for it. This
fixes the following error message seen during exynos7 boot-up:
"samsung-pinctrl 10580000.pinctrl: irq number not available"

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
---
 drivers/pinctrl/samsung/pinctrl-exynos.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index c8f83f9..a7e9c42 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -1324,7 +1324,6 @@ const struct samsung_pin_ctrl exynos7_pin_ctrl[] __initconst = {
 		/* pin-controller instance 0 Alive data */
 		.pin_banks	= exynos7_pin_banks0,
 		.nr_banks	= ARRAY_SIZE(exynos7_pin_banks0),
-		.eint_gpio_init = exynos_eint_gpio_init,
 		.eint_wkup_init = exynos_eint_wkup_init,
 	}, {
 		/* pin-controller instance 1 BUS0 data */
-- 
2.1.0
