From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] pinctrl: exynos5440: fix issues reported by prevent tool
Date: Thu, 06 Jun 2013 10:22:03 +0900
Message-ID: <09d101ce6254$40813eb0$c183bc10$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:46811 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755377Ab3FFBWG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Jun 2013 21:22:06 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MNY00F306GSXC90@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Jun 2013 10:22:04 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Linus Walleij' <linus.walleij@linaro.org>, 'Thomas Abraham' <thomas.ab@samsung.com>

From: Thomas Abraham <thomas.ab@samsung.com>

This patch fixes issues reported by prevent tool.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/pinctrl/pinctrl-exynos5440.c |   15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-exynos5440.c b/drivers/pinctrl/pinctrl-exynos5440.c
index 6436a02..063be17 100644
--- a/drivers/pinctrl/pinctrl-exynos5440.c
+++ b/drivers/pinctrl/pinctrl-exynos5440.c
@@ -220,7 +220,7 @@ static int exynos5440_dt_node_to_map(struct pinctrl_dev *pctldev,
 		dev_err(dev, "failed to alloc memory for group name\n");
 		goto free_map;
 	}
-	sprintf(gname, "%s%s", np->name, GROUP_SUFFIX);
+	snprintf(gname, strlen(np->name) + 4, "%s%s", np->name, GROUP_SUFFIX);
 
 	/*
 	 * don't have config options? then skip over to creating function
@@ -259,7 +259,8 @@ skip_cfgs:
 			dev_err(dev, "failed to alloc memory for func name\n");
 			goto free_cfg;
 		}
-		sprintf(fname, "%s%s", np->name, FUNCTION_SUFFIX);
+		snprintf(fname, strlen(np->name) + 4, "%s%s", np->name,
+			 FUNCTION_SUFFIX);
 
 		map[*nmaps].data.mux.group = gname;
 		map[*nmaps].data.mux.function = fname;
@@ -713,7 +714,8 @@ static int exynos5440_pinctrl_parse_dt(struct platform_device *pdev,
 			dev_err(dev, "failed to alloc memory for group name\n");
 			return -ENOMEM;
 		}
-		sprintf(gname, "%s%s", cfg_np->name, GROUP_SUFFIX);
+		snprintf(gname, strlen(cfg_np->name) + 4, "%s%s", cfg_np->name,
+			 GROUP_SUFFIX);
 
 		grp->name = gname;
 		grp->pins = pin_list;
@@ -733,7 +735,8 @@ skip_to_pin_function:
 			dev_err(dev, "failed to alloc memory for func name\n");
 			return -ENOMEM;
 		}
-		sprintf(fname, "%s%s", cfg_np->name, FUNCTION_SUFFIX);
+		snprintf(fname, strlen(cfg_np->name) + 4, "%s%s", cfg_np->name,
+			 FUNCTION_SUFFIX);
 
 		func->name = fname;
 		func->groups = devm_kzalloc(dev, sizeof(char *), GFP_KERNEL);
@@ -806,7 +809,7 @@ static int exynos5440_pinctrl_register(struct platform_device *pdev,
 
 	/* for each pin, set the name of the pin */
 	for (pin = 0; pin < ctrldesc->npins; pin++) {
-		sprintf(pin_names, "gpio%02d", pin);
+		snprintf(pin_names, 6, "gpio%02d", pin);
 		pdesc = pindesc + pin;
 		pdesc->name = pin_names;
 		pin_names += PIN_NAME_LENGTH;
@@ -993,7 +996,7 @@ static int exynos5440_pinctrl_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	priv = devm_kzalloc(dev, sizeof(priv), GFP_KERNEL);
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv) {
 		dev_err(dev, "could not allocate memory for private data\n");
 		return -ENOMEM;
-- 
1.7.10.4
