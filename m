From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH] pwm: samsung: Use MODULE_DEVICE_TABLE() to include OF modalias
Date: Thu, 14 May 2015 02:32:31 +0200
Message-ID: <1431563551-9461-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:46273 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754674AbbENAct (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 May 2015 20:32:49 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

If the pwm-samsung driver is built as a module, modalias information is
not filled so the module is not autoloaded. Use the MODULE_DEVICE_TABLE()
macro to export the OF device ID so the module contains that information.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 drivers/pwm/pwm-samsung.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pwm/pwm-samsung.c b/drivers/pwm/pwm-samsung.c
index ff201e1b9219..ada2d326dc3e 100644
--- a/drivers/pwm/pwm-samsung.c
+++ b/drivers/pwm/pwm-samsung.c
@@ -456,6 +456,7 @@ static const struct of_device_id samsung_pwm_matches[] = {
 	{ .compatible = "samsung,exynos4210-pwm", .data = &s5p64x0_variant },
 	{},
 };
+MODULE_DEVICE_TABLE(of, samsung_pwm_matches);
 
 static int pwm_samsung_parse_dt(struct samsung_pwm_chip *chip)
 {
-- 
2.1.4
