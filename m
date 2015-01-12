From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH] i2c: exynos5: Move initialization code to subsys_initcall()
Date: Mon, 12 Jan 2015 11:53:02 +0900
Message-ID: <1421031182-18992-1-git-send-email-jy0922.shim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:20447 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751044AbbALCws (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 11 Jan 2015 21:52:48 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-i2c@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, wsa@the-dreams.de, kgene.kim@samsung.com, naveenkrishna.ch@gmail.com, broonie@kernel.org, jy0922.shim@samsung.com

This is required in order to ensure that core system devices such as
voltage regulators attached via I2C are available early in boot.

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
---
 drivers/i2c/busses/i2c-exynos5.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index b29c750..18ca097 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -867,7 +867,17 @@ static struct platform_driver exynos5_i2c_driver = {
 	},
 };
 
-module_platform_driver(exynos5_i2c_driver);
+static int __init exynos5_i2c_init_driver(void)
+{
+	return platform_driver_register(&exynos5_i2c_driver);
+}
+subsys_initcall(exynos5_i2c_init_driver);
+
+static void __exit exynos5_i2c_exit_driver(void)
+{
+	platform_driver_unregister(&exynos5_i2c_driver);
+}
+module_exit(exynos5_i2c_exit_driver);
 
 MODULE_DESCRIPTION("Exynos5 HS-I2C Bus driver");
 MODULE_AUTHOR("Naveen Krishna Chatradhi, <ch.naveen@samsung.com>");
-- 
1.9.1
