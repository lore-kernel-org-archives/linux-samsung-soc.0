Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FFBDC433DB
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Jan 2021 06:47:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18C20230FB
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Jan 2021 06:47:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbhAFGrr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Jan 2021 01:47:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726295AbhAFGrr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Jan 2021 01:47:47 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0DE9C06134D
        for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Jan 2021 22:47:06 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id c124so1545205wma.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Jan 2021 22:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xMHBCUZGG9sUTUF6+G1UEasXPArhsLjoOzd5gYYQRUI=;
        b=sdXysKMM4mjqWkND1TXIygHeROQWUW/dxNQBncIe4Xp/Bripdpg73iPzwYzjNd4g+j
         8NrTjeB3sTSKIwhq4m1UZ5oe5LbOSWzsjCmMNWxwW+5tb5bDE7P3B0QrkyaKFCXsqgiV
         kbbQv2mwb/nQuiruKcS/CNXRdXRQLNK5tcdJ09w8V96uIZPDh+19fA65L4l4PLUFW8xz
         8lWwzPt6HVPopC2wJfAQvChqwnU2kQ3aaspIaPy6ofTzWKYi1mBqEVsszLH5rdCqE0uo
         Scp/1gbh+DlFxE7003hSW6pkgtyUc5avVzx2+CV6rZIlOXd/Q6S0bMyp5Go9E+OzhtDU
         TLdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xMHBCUZGG9sUTUF6+G1UEasXPArhsLjoOzd5gYYQRUI=;
        b=SpTS7JrWb3E/fyYEdgQJO2l4o72J++lUeH2oqVTksE4ri/tYuVYYX94K0SpE0l+Gm6
         xk/5jdUPCA5oxFLTFVd9DYKtH1iW1TUd5EWnr2Xo5mqKuNWNHHyeAGdg8USyublwwjzv
         l+5CxDdkfwQcUDklD5hI3rEOPEPY9LS3/9z2ZKRO/7bIha75aZAxuWJNVdA4ST4meJQU
         MdhllJHdFokQJgujwlLNPBeGRVGDeUky6asH/CMD5lhISOVYuEqGZrnVtOsZEjqVq4pG
         /P9yKq+VBxN5WXyWavbCwLAKgR1wTLbXqYHkiQwYoq/HR7AL2DB45Lxh99kfTVSnRj9u
         aAjA==
X-Gm-Message-State: AOAM5315yeRIqyJpyKTv5rAAow7JeH42izv/AFy/vxYm1WKaNBZNRih7
        cZYqhx5D8S4Qc27cd4qRhL5MsQ==
X-Google-Smtp-Source: ABdhPJyI4V1Ge1LuIAFDBvNl6oGstBIhrAMnzxrD0v1JtGvfnA6kdxD6TGg90cczxECyNH2bh4AyCg==
X-Received: by 2002:a1c:9ac6:: with SMTP id c189mr2277464wme.137.1609915625531;
        Tue, 05 Jan 2021 22:47:05 -0800 (PST)
Received: from localhost.localdomain (pop.92-184-112-11.mobile.abo.orange.fr. [92.184.112.11])
        by smtp.gmail.com with ESMTPSA id i11sm1729980wmd.47.2021.01.05.22.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 22:47:05 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] rtc: s5m: use devm_i2c_new_dummy_device()
Date:   Wed,  6 Jan 2021 07:47:01 +0100
Message-Id: <20210106064701.30682-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the managed variant of i2c_new_dummy_device() to shrink code and
remove the goto label. We can drop the remove callback now too.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-s5m.c | 34 ++++++++--------------------------
 1 file changed, 8 insertions(+), 26 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index eb9dde4095a9..8d42592bc58e 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -760,7 +760,8 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	info->i2c = i2c_new_dummy_device(s5m87xx->i2c->adapter, RTC_I2C_ADDR);
+	info->i2c = devm_i2c_new_dummy_device(&pdev->dev, s5m87xx->i2c->adapter,
+					      RTC_I2C_ADDR);
 	if (IS_ERR(info->i2c)) {
 		dev_err(&pdev->dev, "Failed to allocate I2C for RTC\n");
 		return PTR_ERR(info->i2c);
@@ -768,10 +769,9 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 
 	info->regmap = devm_regmap_init_i2c(info->i2c, regmap_cfg);
 	if (IS_ERR(info->regmap)) {
-		ret = PTR_ERR(info->regmap);
 		dev_err(&pdev->dev, "Failed to allocate RTC register map: %d\n",
-				ret);
-		goto err;
+			ret);
+		return PTR_ERR(info->regmap);
 	}
 
 	info->dev = &pdev->dev;
@@ -781,10 +781,9 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	if (s5m87xx->irq_data) {
 		info->irq = regmap_irq_get_virq(s5m87xx->irq_data, alarm_irq);
 		if (info->irq <= 0) {
-			ret = -EINVAL;
 			dev_err(&pdev->dev, "Failed to get virtual IRQ %d\n",
 				alarm_irq);
-			goto err;
+			return -EINVAL;
 		}
 	}
 
@@ -797,10 +796,8 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	info->rtc_dev = devm_rtc_device_register(&pdev->dev, "s5m-rtc",
 						 &s5m_rtc_ops, THIS_MODULE);
 
-	if (IS_ERR(info->rtc_dev)) {
-		ret = PTR_ERR(info->rtc_dev);
-		goto err;
-	}
+	if (IS_ERR(info->rtc_dev))
+		return PTR_ERR(info->rtc_dev);
 
 	if (!info->irq) {
 		dev_info(&pdev->dev, "Alarm IRQ not available\n");
@@ -813,23 +810,9 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to request alarm IRQ: %d: %d\n",
 			info->irq, ret);
-		goto err;
+		return ret;
 	}
 
-	return 0;
-
-err:
-	i2c_unregister_device(info->i2c);
-
-	return ret;
-}
-
-static int s5m_rtc_remove(struct platform_device *pdev)
-{
-	struct s5m_rtc_info *info = platform_get_drvdata(pdev);
-
-	i2c_unregister_device(info->i2c);
-
 	return 0;
 }
 
@@ -874,7 +857,6 @@ static struct platform_driver s5m_rtc_driver = {
 		.pm	= &s5m_rtc_pm_ops,
 	},
 	.probe		= s5m_rtc_probe,
-	.remove		= s5m_rtc_remove,
 	.id_table	= s5m_rtc_id,
 };
 
-- 
2.29.1

