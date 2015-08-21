From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 3/7] regulators: max77693: register driver earlier to avoid
 deferred probe
Date: Fri, 21 Aug 2015 14:38:39 +0200
Message-ID: <1440160723-6636-4-git-send-email-m.szyprowski@samsung.com>
References: <1440160723-6636-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1440160723-6636-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, John Youn <johnyoun@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Mark Brown <broonie@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

MAX77693 based regulators are used by USB gadget subsystem, which
doesn't support deferred probe, so the driver should be registered
before USB gadget drivers get probed.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/regulator/max77693.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/max77693.c b/drivers/regulator/max77693.c
index 788379b87962..de730fd3f8a5 100644
--- a/drivers/regulator/max77693.c
+++ b/drivers/regulator/max77693.c
@@ -300,7 +300,17 @@ static struct platform_driver max77693_pmic_driver = {
 	.id_table = max77693_pmic_id,
 };
 
-module_platform_driver(max77693_pmic_driver);
+static int __init max77693_pmic_init(void)
+{
+	return platform_driver_register(&max77693_pmic_driver);
+}
+subsys_initcall(max77693_pmic_init);
+
+static void __exit max77693_pmic_cleanup(void)
+{
+	platform_driver_unregister(&max77693_pmic_driver);
+}
+module_exit(max77693_pmic_cleanup);
 
 MODULE_DESCRIPTION("MAXIM 77693/77843 regulator driver");
 MODULE_AUTHOR("Jonghwa Lee <jonghwa3.lee@samsung.com>");
-- 
1.9.2
