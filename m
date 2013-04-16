From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH 2/2] pinctrl: samsung: Fix link error with CONFIG_PINCTRL_EXYNOS disabled
Date: Wed, 17 Apr 2013 00:24:39 +0200
Message-ID: <1398545.9FqHoC0WZW@flatron>
References: <1366060483-20342-1-git-send-email-tomasz.figa@gmail.com> <20130416163331.GP26958@opensource.wolfsonmicro.com> <30362001.FF4K7WsZvh@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f54.google.com ([74.125.83.54]:46498 "EHLO
	mail-ee0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965353Ab3DPWYi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Apr 2013 18:24:38 -0400
Received: by mail-ee0-f54.google.com with SMTP id e51so475126eek.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Apr 2013 15:24:37 -0700 (PDT)
In-Reply-To: <30362001.FF4K7WsZvh@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>, linus.walleij@linaro.org, thomas.abraham@linaro.org

Commit f67faf487 added driver data for Exynos5250, which is available
only if CONFIG_PINCTRL_EXYNOS is enabled. However probably due to merge
error, the reference to this driver data structure was located outside
of relevant ifdef and compiled unconditionally, leading to link error
with CONFIG_PINCTRL_EXYNOS.

This patch fixes mentioned link error by moving driver data entry under
ifdef CONFIG_PINCTRL_EXYNOS.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 drivers/pinctrl/pinctrl-samsung.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-samsung.c b/drivers/pinctrl/pinctrl-
samsung.c
index f95dd69..9763668 100644
--- a/drivers/pinctrl/pinctrl-samsung.c
+++ b/drivers/pinctrl/pinctrl-samsung.c
@@ -970,13 +970,13 @@ static const struct of_device_id 
samsung_pinctrl_dt_match[] = {
 		.data = (void *)exynos4210_pin_ctrl },
 	{ .compatible = "samsung,exynos4x12-pinctrl",
 		.data = (void *)exynos4x12_pin_ctrl },
+	{ .compatible = "samsung,exynos5250-pinctrl",
+		.data = (void *)exynos5250_pin_ctrl },
 #endif
 #ifdef CONFIG_PINCTRL_S3C64XX
 	{ .compatible = "samsung,s3c64xx-pinctrl",
 		.data = s3c64xx_pin_ctrl },
 #endif
-	{ .compatible = "samsung,exynos5250-pinctrl",
-		.data = (void *)exynos5250_pin_ctrl },
 	{},
 };
 MODULE_DEVICE_TABLE(of, samsung_pinctrl_dt_match);
-- 
1.8.1.5
