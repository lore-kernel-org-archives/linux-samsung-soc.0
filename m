From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH 3/3] gpio: samsung: skip gpiolib registration if pinctrl
 support is enabled for exynos5420
Date: Wed, 12 Jun 2013 20:21:28 +0530
Message-ID: <1371048688-9089-4-git-send-email-l.krishna@samsung.com>
References: <1371048688-9089-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:10109 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753106Ab3FLO37 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Jun 2013 10:29:59 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOA00I6NAXY6TD0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 12 Jun 2013 23:29:58 +0900 (KST)
In-reply-to: <1371048688-9089-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, sjg@chromium.org, thomas.ab@samsung.com, t.figa@samsung.com

Skip exynos5420 gpiolib registration if pinctrl support is enabled.

Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
---
 drivers/gpio/gpio-samsung.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
index 83a0d71..b3dd984 100644
--- a/drivers/gpio/gpio-samsung.c
+++ b/drivers/gpio/gpio-samsung.c
@@ -3033,6 +3033,7 @@ static __init int samsung_gpiolib_init(void)
 		{ .compatible = "samsung,exynos4210-pinctrl", },
 		{ .compatible = "samsung,exynos4x12-pinctrl", },
 		{ .compatible = "samsung,exynos5250-pinctrl", },
+		{ .compatible = "samsung,exynos5420-pinctrl", },
 		{ .compatible = "samsung,exynos5440-pinctrl", },
 		{ }
 	};
-- 
1.7.10.4
