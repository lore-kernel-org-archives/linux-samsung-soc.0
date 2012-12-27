From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] gpio: samsung: fix pinctrl condition for exynos and exynos5440
Date: Thu, 27 Dec 2012 10:11:10 -0800
Message-ID: <1356631870-1499-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:30993 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751204Ab2L0SLi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Dec 2012 13:11:38 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MFP00N5NBV832J0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 28 Dec 2012 03:11:37 +0900 (KST)
Received: from localhost.localdomain ([105.128.18.183])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MFP00J5NBV8EKA0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 28 Dec 2012 03:11:36 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>

Since EXYNOS5440 can select PINCTRL_EXYNOS5440 without PINCTRL_SAMSUNG,
it should be fixed. In detail, PINCTRL_SAMSUNG is a kind of frame work
for supporting pinctrl on most Samsung SoCs including S3C, S5P as well
except EXYNOS5440 so PINCTRL_EXYNOS5440 has been implemented separated.

Cc: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/gpio/gpio-samsung.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
index 365ecce..509c08c 100644
--- a/drivers/gpio/gpio-samsung.c
+++ b/drivers/gpio/gpio-samsung.c
@@ -3010,7 +3010,7 @@ static __init int samsung_gpiolib_init(void)
 	int i, nr_chips;
 	int group = 0;
 
-#ifdef CONFIG_PINCTRL_SAMSUNG
+#if defined(CONFIG_PINCTRL_EXYNOS) || defined(CONFIG_PINCTRL_EXYNOS5440)
 	/*
 	* This gpio driver includes support for device tree support and there
 	* are platforms using it. In order to maintain compatibility with those
-- 
1.7.10.4
