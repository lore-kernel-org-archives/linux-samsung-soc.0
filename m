From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] i2c: exynos5: register driver early in subsys initcall to
 avoid probe defer
Date: Fri, 30 Oct 2015 15:23:28 +0100
Message-ID: <1446215008-30506-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Wolfram Sang <wsa@the-dreams.de>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

i2c bus drivers should be registered earlier than typical drivers to let
important i2c devices (like PMICs/regulators) get registered early
enough to avoid probe defer of all devices in typical embedded system.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/i2c/busses/i2c-exynos5.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index b29c7500461a..934a5cbcbdd3 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -867,7 +867,17 @@ static struct platform_driver exynos5_i2c_driver = {
 	},
 };
 
-module_platform_driver(exynos5_i2c_driver);
+static int __init i2c_adap_exynos5_i2c_init(void)
+{
+	return platform_driver_register(&exynos5_i2c_driver);
+}
+subsys_initcall(i2c_adap_exynos5_i2c_init);
+
+static void __exit i2c_adap_exynos5_i2c_exit(void)
+{
+	platform_driver_unregister(&exynos5_i2c_driver);
+}
+module_exit(i2c_adap_exynos5_i2c_exit);
 
 MODULE_DESCRIPTION("Exynos5 HS-I2C Bus driver");
 MODULE_AUTHOR("Naveen Krishna Chatradhi, <ch.naveen@samsung.com>");
-- 
1.9.2
