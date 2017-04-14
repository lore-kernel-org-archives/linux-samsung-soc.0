From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 2/2] regulator: s2mps11: Use devm_kmalloc_array() in
 s2mps11_pmic_probe()
Date: Fri, 14 Apr 2017 23:02:55 +0200
Message-ID: <57e9c3a5-3751-41ee-3b70-f532fb928571@users.sourceforge.net>
References: <b0fc50c2-4552-93d1-1ae0-42f78d255fe9@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.14]:54136 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752573AbdDNVDF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 14 Apr 2017 17:03:05 -0400
In-Reply-To: <b0fc50c2-4552-93d1-1ae0-42f78d255fe9@users.sourceforge.net>
Content-Language: en-GB
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 14 Apr 2017 22:40:19 +0200

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus use the corresponding function "devm_kmalloc_array".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/regulator/s2mps11.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index b4e588cce03d..b397a2e0bcd1 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -1139,9 +1139,11 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	s2mps11->ext_control_gpio = devm_kmalloc(&pdev->dev,
-			sizeof(*s2mps11->ext_control_gpio) * rdev_num,
-			GFP_KERNEL);
+	s2mps11->ext_control_gpio
+		= devm_kmalloc_array(&pdev->dev,
+				     rdev_num,
+				     sizeof(*s2mps11->ext_control_gpio),
+				     GFP_KERNEL);
 	if (!s2mps11->ext_control_gpio)
 		return -ENOMEM;
 	/*
-- 
2.12.2
