From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH] platform/chrome: cros_ec_dev - Add a platform device ID table
Date: Thu, 14 May 2015 02:58:08 +0200
Message-ID: <1431565088-24070-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:46297 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933091AbbENA6c (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 May 2015 20:58:32 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Doug Anderson <dianders@chromium.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

If the cros_ec_dev driver is built as a module, modalias information is
not filled so the module is not autoloaded. Add a platform device table
and use the MODULE_DEVICE_TABLE() macro to export that information in
the module so user-space can match the modalias uevent and autoload it.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 drivers/platform/chrome/cros_ec_dev.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_dev.c b/drivers/platform/chrome/cros_ec_dev.c
index 6090d0b2826f..4232c8136939 100644
--- a/drivers/platform/chrome/cros_ec_dev.c
+++ b/drivers/platform/chrome/cros_ec_dev.c
@@ -216,6 +216,12 @@ static int ec_device_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct platform_device_id cros_ec_id[] = {
+	{ "cros-ec-ctl", 0 },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(platform, cros_ec_id);
+
 static struct platform_driver cros_ec_dev_driver = {
 	.driver = {
 		.name = "cros-ec-ctl",
-- 
2.1.4
