From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH] gpio: samsung: more generic pinctrl exclude ifdef
Date: Tue, 9 Jul 2013 02:12:31 +0200
Message-ID: <201307090212.31422.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:51646 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753400Ab3GIAMj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Jul 2013 20:12:39 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linus.walleij@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

The exclude check should run any time when either the PINCTRL_SAMSUNG
or PINCTRL_EXYNOS5440 are selected.

As the real check for the presence of a pinctrl driver is done via a
dt lookup it's not necessary to specifiy every pinctrl option in the
ifdef individually.

This fixes a breakage on s3c2416, when both the legacy and
dt boards are selected.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
Extracted from Tomasz pinctrl series, as it fixes a bug in the current
3.11 development.

 drivers/gpio/gpio-samsung.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
index a1392f4..ceb7971 100644
--- a/drivers/gpio/gpio-samsung.c
+++ b/drivers/gpio/gpio-samsung.c
@@ -2949,7 +2949,7 @@ static __init int samsung_gpiolib_init(void)
 	int i, nr_chips;
 	int group = 0;
 
-#if defined(CONFIG_PINCTRL_EXYNOS) || defined(CONFIG_PINCTRL_EXYNOS5440)
+#if defined(CONFIG_PINCTRL_SAMSUNG) || defined(CONFIG_PINCTRL_EXYNOS5440)
 	/*
 	* This gpio driver includes support for device tree support and there
 	* are platforms using it. In order to maintain compatibility with those
-- 
1.7.10.4
