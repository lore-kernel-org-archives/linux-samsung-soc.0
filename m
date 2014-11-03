From: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: [PATCH v4 05/14] regulator: max1586: zero-initialize regulator match table array
Date: Mon,  3 Nov 2014 15:40:40 +0100
Message-ID: <1415025649-8119-6-git-send-email-javier.martinez@collabora.co.uk>
References: <1415025649-8119-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415025649-8119-1-git-send-email-javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Abhilash Kesavan <kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

The struct of_regulator_match rmatch[] is declared as a non-static local
variable so the structure members are not auto-initialized.

Initialize the array at declaration time to avoid the structure members
values to be indeterminate and have sane defaults instead.

Signed-off-by: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
---
 drivers/regulator/max1586.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/max1586.c b/drivers/regulator/max1586.c
index 86db310..d2a8c64 100644
--- a/drivers/regulator/max1586.c
+++ b/drivers/regulator/max1586.c
@@ -163,7 +163,7 @@ static int of_get_max1586_platform_data(struct device *dev,
 				 struct max1586_platform_data *pdata)
 {
 	struct max1586_subdev_data *sub;
-	struct of_regulator_match rmatch[ARRAY_SIZE(max1586_reg)];
+	struct of_regulator_match rmatch[ARRAY_SIZE(max1586_reg)] = { };
 	struct device_node *np = dev->of_node;
 	int i, matched;
 
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
