Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92DC9C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 13 Oct 2021 20:21:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75D1F60FDA
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 13 Oct 2021 20:21:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbhJMUXS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 13 Oct 2021 16:23:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbhJMUXS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 13 Oct 2021 16:23:18 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 226CFC061746
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Oct 2021 13:21:13 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id y26so17045594lfa.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Oct 2021 13:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RbA7/LD/rhEB29ruXSyNNb5KcRtY+w7Bp+w/XxGwImY=;
        b=UjmDMbHfkU/Xe4U7o1i1uANVmXdeDB03wJ+7Kcklqh73teRvmJTAo+0pxT7SATRUQF
         e935YAVvEKaI9lI8v4pYo9mOjG4/+UkADksTp4Omimgdk93OIHriyaVqdEW4ECFUTaVz
         CesRv/7StRnmmtWt4wFV8qv0YpjoSdhmUohD8doMNDyAVQICkMlGUByFsRHvfSexxpAE
         /COqrmRn29bOJUCQNy8kUXVFPeKIi6XbG5uindqdzBrZQmSmC438mdHSzfSphaxxztvh
         grlDcMZ2R9UzyZ6gBK4IN1i+jclJNilh8Gf55OsCDS4QYA65m8nKX7qgfhOP6E0IcTex
         c/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RbA7/LD/rhEB29ruXSyNNb5KcRtY+w7Bp+w/XxGwImY=;
        b=sJa6n778N482s3wHTgo3h9IJ7VpyJdSKdCtT5ev5t5lae7fn9M1pVuaxniW0R2/jY6
         QoDEEOfvM1wc0k+BQZXShU/OTF8xVMJ9OwqBP/RCEtkTZoG10Jx6SgBFHOs7rjRwQaFE
         ZglcxrkiufeSIe59EPfVZ5z73LpXnH8iLA7oWDBfosS1phP1DwSDDx1MXhxikPufx9a3
         g2SI/iPJJyvqu+D1x6ABuJUICFgpz9t/TrJYt/ew8qMkiwwoRvxsQfwjj+vnb5n1xtwf
         dDNRvygD9NGZpjJ+QcmC7QMzfOyOFN/20qY3vi4giSHTOgavycISW6vi6re3w9iPNroW
         RCZQ==
X-Gm-Message-State: AOAM530sjBD2FVtlFqnzq+F2b6Fa9/g+D1ENb6YgtFb3aRBJHJ4dYlG8
        nfR8k0/eyPa3yWcwmhIeTNauew==
X-Google-Smtp-Source: ABdhPJwl4ASfYCFpwJLodrxzX2aNa8b0wg9OwhDDKPSAv00qOBYlfV2LuhoXd0gY6v92EjDf9qtW4w==
X-Received: by 2002:a05:6512:1399:: with SMTP id p25mr1029026lfa.277.1634156471985;
        Wed, 13 Oct 2021 13:21:11 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id t2sm52840ljt.88.2021.10.13.13.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 13:21:11 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] soc: samsung: exynos-chipid: Pass revision reg offsets
Date:   Wed, 13 Oct 2021 23:21:08 +0300
Message-Id: <20211013202110.31701-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Old Exynos SoCs have both Product ID and Revision ID in one single
register, while new SoCs tend to have two separate registers for those
IDs. Implement handling of both cases by passing Revision ID register
offsets in driver data.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c       | 67 +++++++++++++++++++----
 include/linux/soc/samsung/exynos-chipid.h |  6 +-
 2 files changed, 58 insertions(+), 15 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 5c1d0f97f766..7837331fb753 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -16,6 +16,7 @@
 #include <linux/errno.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
@@ -24,6 +25,17 @@
 
 #include "exynos-asv.h"
 
+struct exynos_chipid_variant {
+	unsigned int rev_reg;		/* revision register offset */
+	unsigned int main_rev_shift;	/* main revision offset in rev_reg */
+	unsigned int sub_rev_shift;	/* sub revision offset in rev_reg */
+};
+
+struct exynos_chipid_info {
+	u32 product_id;
+	u32 revision;
+};
+
 static const struct exynos_soc_id {
 	const char *name;
 	unsigned int id;
@@ -49,31 +61,55 @@ static const char *product_id_to_soc_id(unsigned int product_id)
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(soc_ids); i++)
-		if ((product_id & EXYNOS_MASK) == soc_ids[i].id)
+		if (product_id == soc_ids[i].id)
 			return soc_ids[i].name;
 	return NULL;
 }
 
+static int exynos_chipid_get_chipid_info(struct regmap *regmap,
+		const struct exynos_chipid_variant *data,
+		struct exynos_chipid_info *soc_info)
+{
+	int ret;
+	unsigned int val, main_rev, sub_rev;
+
+	ret = regmap_read(regmap, EXYNOS_CHIPID_REG_PRO_ID, &val);
+	if (ret < 0)
+		return ret;
+	soc_info->product_id = val & EXYNOS_MASK;
+
+	ret = regmap_read(regmap, data->rev_reg, &val);
+	if (ret < 0)
+		return ret;
+	main_rev = (val >> data->main_rev_shift) & EXYNOS_REV_PART_MASK;
+	sub_rev = (val >> data->sub_rev_shift) & EXYNOS_REV_PART_MASK;
+	soc_info->revision = (main_rev << EXYNOS_REV_PART_SHIFT) | sub_rev;
+
+	return 0;
+}
+
 static int exynos_chipid_probe(struct platform_device *pdev)
 {
+	const struct exynos_chipid_variant *drv_data;
+	struct exynos_chipid_info soc_info;
 	struct soc_device_attribute *soc_dev_attr;
 	struct soc_device *soc_dev;
 	struct device_node *root;
 	struct regmap *regmap;
-	u32 product_id;
-	u32 revision;
 	int ret;
 
+	drv_data = of_device_get_match_data(&pdev->dev);
+	if (!drv_data)
+		return -EINVAL;
+
 	regmap = device_node_to_regmap(pdev->dev.of_node);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	ret = regmap_read(regmap, EXYNOS_CHIPID_REG_PRO_ID, &product_id);
+	ret = exynos_chipid_get_chipid_info(regmap, drv_data, &soc_info);
 	if (ret < 0)
 		return ret;
 
-	revision = product_id & EXYNOS_REV_MASK;
-
 	soc_dev_attr = devm_kzalloc(&pdev->dev, sizeof(*soc_dev_attr),
 				    GFP_KERNEL);
 	if (!soc_dev_attr)
@@ -86,8 +122,8 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	of_node_put(root);
 
 	soc_dev_attr->revision = devm_kasprintf(&pdev->dev, GFP_KERNEL,
-						"%x", revision);
-	soc_dev_attr->soc_id = product_id_to_soc_id(product_id);
+						"%x", soc_info.revision);
+	soc_dev_attr->soc_id = product_id_to_soc_id(soc_info.product_id);
 	if (!soc_dev_attr->soc_id) {
 		pr_err("Unknown SoC\n");
 		return -ENODEV;
@@ -106,7 +142,7 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 
 	dev_info(soc_device_to_device(soc_dev),
 		 "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
-		 soc_dev_attr->soc_id, product_id, revision);
+		 soc_dev_attr->soc_id, soc_info.product_id, soc_info.revision);
 
 	return 0;
 
@@ -125,9 +161,18 @@ static int exynos_chipid_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct exynos_chipid_variant exynos4210_chipid_drv_data = {
+	.rev_reg	= 0x0,
+	.main_rev_shift	= 0,
+	.sub_rev_shift	= 4,
+};
+
 static const struct of_device_id exynos_chipid_of_device_ids[] = {
-	{ .compatible = "samsung,exynos4210-chipid" },
-	{}
+	{
+		.compatible	= "samsung,exynos4210-chipid",
+		.data		= &exynos4210_chipid_drv_data,
+	},
+	{ }
 };
 
 static struct platform_driver exynos_chipid_driver = {
diff --git a/include/linux/soc/samsung/exynos-chipid.h b/include/linux/soc/samsung/exynos-chipid.h
index 8bca6763f99c..62f0e2531068 100644
--- a/include/linux/soc/samsung/exynos-chipid.h
+++ b/include/linux/soc/samsung/exynos-chipid.h
@@ -9,10 +9,8 @@
 #define __LINUX_SOC_EXYNOS_CHIPID_H
 
 #define EXYNOS_CHIPID_REG_PRO_ID	0x00
-#define EXYNOS_SUBREV_MASK		(0xf << 4)
-#define EXYNOS_MAINREV_MASK		(0xf << 0)
-#define EXYNOS_REV_MASK			(EXYNOS_SUBREV_MASK | \
-					 EXYNOS_MAINREV_MASK)
+#define EXYNOS_REV_PART_MASK		0xf
+#define EXYNOS_REV_PART_SHIFT		4
 #define EXYNOS_MASK			0xfffff000
 
 #define EXYNOS_CHIPID_REG_PKG_ID	0x04
-- 
2.30.2

