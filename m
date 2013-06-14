From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH V2 3/3] gpio: samsung: skip gpiolib registration if pinctrl
 support is enabled for exynos5420
Date: Fri, 14 Jun 2013 18:32:34 +0530
Message-ID: <1371214954-29358-4-git-send-email-l.krishna@samsung.com>
References: <1371214954-29358-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:15015 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752639Ab3FNMm0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Jun 2013 08:42:26 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOD00NZBVAP1CZ0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Jun 2013 21:42:25 +0900 (KST)
In-reply-to: <1371214954-29358-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, sjg@chromium.org, thomas.ab@samsung.com, t.figa@samsung.com, s.nawrocki@samsung.com, linus.walleij@linaro.org

Skip exynos5420 gpiolib registration if pinctrl support is enabled.

Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
Reviewed-by: Doug Anderson <dianders@chromium.org>
Reviewed-by: Tomasz Figa <t.figa@samsung.com>
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
1.7.9.5
