From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH 1/3] gpio: samsung: add PINCTRL_S3C24XX to exclude options
Date: Fri, 14 Jun 2013 00:45:27 +0200
Message-ID: <201306140045.27744.heiko@sntech.de>
References: <201306140044.15568.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:54457 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757435Ab3FMWpe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Jun 2013 18:45:34 -0400
In-Reply-To: <201306140044.15568.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, linus.walleij@linaro.org

When a pinctrl driver is loaded legacy gpio support has to be disabled.
The code checking for the pinctrl presence is contained in an #ifdef
checking for the presence of a valid samsung pinctrl driver.

There the new PINCTRL_S3C24XX was missing resulting in the check never
being run and the gpio being enabled breaking the pinctrl driver.

Fix this by adding the missing CONFIG_PINCTRL_S3C24XX

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/gpio/gpio-samsung.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
index a1392f4..c84503e 100644
--- a/drivers/gpio/gpio-samsung.c
+++ b/drivers/gpio/gpio-samsung.c
@@ -2949,7 +2949,8 @@ static __init int samsung_gpiolib_init(void)
 	int i, nr_chips;
 	int group = 0;
 
-#if defined(CONFIG_PINCTRL_EXYNOS) || defined(CONFIG_PINCTRL_EXYNOS5440)
+#if defined(CONFIG_PINCTRL_EXYNOS) || defined(CONFIG_PINCTRL_EXYNOS5440) || \
+    defined(CONFIG_PINCTRL_S3C24XX)
 	/*
 	* This gpio driver includes support for device tree support and there
 	* are platforms using it. In order to maintain compatibility with those
-- 
1.7.10.4
