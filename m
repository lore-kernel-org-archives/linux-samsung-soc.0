From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 1/2] regulator: s2mps11: Use kcalloc() in s2mps11_pmic_probe()
Date: Fri, 14 Apr 2017 23:01:25 +0200
Message-ID: <542252e0-817f-ce13-fbd5-8fd8dda4c746@users.sourceforge.net>
References: <b0fc50c2-4552-93d1-1ae0-42f78d255fe9@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b0fc50c2-4552-93d1-1ae0-42f78d255fe9@users.sourceforge.net>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 14 Apr 2017 22:00:35 +0200

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus use the corresponding function "kcalloc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/regulator/s2mps11.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 7726b874e539..b4e588cce03d 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -1162,7 +1162,7 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 		}
 	}
 
-	rdata = kzalloc(sizeof(*rdata) * rdev_num, GFP_KERNEL);
+	rdata = kcalloc(rdev_num, sizeof(*rdata), GFP_KERNEL);
 	if (!rdata)
 		return -ENOMEM;
 
-- 
2.12.2
