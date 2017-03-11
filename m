From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 1/3] watchdog: s3c2410: Constify local structures
Date: Sat, 11 Mar 2017 19:42:53 +0200
Message-ID: <20170311174255.23327-2-krzk@kernel.org>
References: <20170311174255.23327-1-krzk@kernel.org>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170311174255.23327-1-krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Structures watchdog_device, watchdog_ops and s3c2410_wdt_variant are not
modified so they can be made const to increase code safeness.

Signed-off-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/watchdog/s3c2410_wdt.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 6ed97596ca80..5eaec319e499 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -131,7 +131,7 @@ struct s3c2410_wdt {
 	unsigned long		wtdat_save;
 	struct watchdog_device	wdt_device;
 	struct notifier_block	freq_transition;
-	struct s3c2410_wdt_variant *drv_data;
+	const struct s3c2410_wdt_variant *drv_data;
 	struct regmap *pmureg;
 };
 
@@ -401,7 +401,7 @@ static const struct watchdog_ops s3c2410wdt_ops = {
 	.restart = s3c2410wdt_restart,
 };
 
-static struct watchdog_device s3c2410_wdd = {
+static const struct watchdog_device s3c2410_wdd = {
 	.info = &s3c2410_wdt_ident,
 	.ops = &s3c2410wdt_ops,
 	.timeout = S3C2410_WATCHDOG_DEFAULT_TIME,
@@ -507,15 +507,15 @@ static inline unsigned int s3c2410wdt_get_bootstatus(struct s3c2410_wdt *wdt)
 	return 0;
 }
 
-static inline struct s3c2410_wdt_variant *
+static inline const struct s3c2410_wdt_variant *
 s3c2410_get_wdt_drv_data(struct platform_device *pdev)
 {
 	if (pdev->dev.of_node) {
 		const struct of_device_id *match;
 		match = of_match_node(s3c2410_wdt_match, pdev->dev.of_node);
-		return (struct s3c2410_wdt_variant *)match->data;
+		return (const struct s3c2410_wdt_variant *)match->data;
 	} else {
-		return (struct s3c2410_wdt_variant *)
+		return (const struct s3c2410_wdt_variant *)
 			platform_get_device_id(pdev)->driver_data;
 	}
 }
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
