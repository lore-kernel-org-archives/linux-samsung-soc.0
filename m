From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] i2c: s3c2410: check for NULL pinctrl handle
Date: Sat, 23 Feb 2013 18:57:46 +0100
Message-ID: <201302231857.46445.heiko@sntech.de>
References: <201302231855.47560.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201302231855.47560.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

When pinctrl is not built the fallback functions fail silently
and emit either 0 error codes or NULL pinctrl handles.

Therefore it's needed to also check for this NULL-handle when
falling back to parsing the i2c gpios from devicetree.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 drivers/i2c/busses/i2c-s3c2410.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index f6b880b..e58337f 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -1060,7 +1060,8 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 
 	if (i2c->pdata->cfg_gpio) {
 		i2c->pdata->cfg_gpio(to_platform_device(i2c->dev));
-	} else if (IS_ERR(i2c->pctrl) && s3c24xx_i2c_parse_dt_gpio(i2c)) {
+	} else if ((!i2c->pctrl || IS_ERR(i2c->pctrl)) &&
+		   s3c24xx_i2c_parse_dt_gpio(i2c)) {
 		return -EINVAL;
 	}
 
-- 
1.7.2.3
