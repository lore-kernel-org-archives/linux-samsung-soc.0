From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Subject: [PATCH 2/2] input: cros_ec_keyb: Add of match table
Date: Sat, 23 Aug 2014 01:03:02 +0200
Message-ID: <1408748582-29029-3-git-send-email-sjoerd.simons@collabora.co.uk>
References: <1408748582-29029-1-git-send-email-sjoerd.simons@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cube.luon.net ([37.72.100.20]:45504 "EHLO cube.luon.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752232AbaHVXDO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Aug 2014 19:03:14 -0400
In-Reply-To: <1408748582-29029-1-git-send-email-sjoerd.simons@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>, Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Sjoerd Simons <sjoerd.simons@collabora.co.uk>

To enable the cros_ec_keyb driver to be auto-loaded when build as
module add an of match table (and export it) to match the modalias
information passed on to userspace as the Cros EC MFD driver registers
the MFD subdevices with an of_compatibility string.

Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
---
 drivers/input/keyboard/cros_ec_keyb.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index 791781a..0bdbf2d 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -342,10 +342,20 @@ static int cros_ec_keyb_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(cros_ec_keyb_pm_ops, NULL, cros_ec_keyb_resume);
 
+#ifdef CONFIG_OF
+static const struct of_device_id cros_ec_keyb_of_match[] = {
+	{ .compatible = "google,cros-ec-keyb" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, cros_ec_keyb_of_match);
+#endif
+
+
 static struct platform_driver cros_ec_keyb_driver = {
 	.probe = cros_ec_keyb_probe,
 	.driver = {
 		.name = "cros-ec-keyb",
+		.of_match_table = of_match_ptr (cros_ec_keyb_of_match),
 		.pm	= &cros_ec_keyb_pm_ops,
 	},
 };
-- 
2.1.0
