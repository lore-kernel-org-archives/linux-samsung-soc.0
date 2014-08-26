From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Subject: [PATCH 2/2 v2] input: cros_ec_keyb: Add of match table
Date: Tue, 26 Aug 2014 09:47:51 +0200
Message-ID: <1409039271-10687-3-git-send-email-sjoerd.simons@collabora.co.uk>
References: <1409039271-10687-1-git-send-email-sjoerd.simons@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:46641 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934084AbaHZHsl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Aug 2014 03:48:41 -0400
In-Reply-To: <1409039271-10687-1-git-send-email-sjoerd.simons@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>, Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>

To enable the cros_ec_keyb driver to be auto-loaded when build as
module add an of match table (and export it) to match the modalias
information passed on to userspace as the Cros EC MFD driver registers
the MFD subdevices with an of_compatibility string.

Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 Changes in v2: none

 drivers/input/keyboard/cros_ec_keyb.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index 791781a..e1903ec 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -342,10 +342,19 @@ static int cros_ec_keyb_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(cros_ec_keyb_pm_ops, NULL, cros_ec_keyb_resume);
 
+#ifdef CONFIG_OF
+static const struct of_device_id cros_ec_keyb_of_match[] = {
+	{ .compatible = "google,cros-ec-keyb" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, cros_ec_keyb_of_match);
+#endif
+
 static struct platform_driver cros_ec_keyb_driver = {
 	.probe = cros_ec_keyb_probe,
 	.driver = {
 		.name = "cros-ec-keyb",
+		.of_match_table = of_match_ptr(cros_ec_keyb_of_match),
 		.pm	= &cros_ec_keyb_pm_ops,
 	},
 };
-- 
2.1.0
