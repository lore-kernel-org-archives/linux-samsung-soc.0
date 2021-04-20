Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D02A5C433B4
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 17:01:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9AE436135F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 17:01:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233199AbhDTRCI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 20 Apr 2021 13:02:08 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50096 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233247AbhDTRCH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Apr 2021 13:02:07 -0400
Received: from mail-ej1-f69.google.com ([209.85.218.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYtkk-0004UO-Nt
        for linux-samsung-soc@vger.kernel.org; Tue, 20 Apr 2021 17:01:34 +0000
Received: by mail-ej1-f69.google.com with SMTP id o25-20020a1709061d59b029037c94676df5so5047015ejh.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Apr 2021 10:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3HCzipZq3msLcuy2WkjGbMNJtslSk5WuayCRwwGv1I8=;
        b=kOoCbyMdcRRuKOdHpHk+UrZ7L2+8szP8Sfz+VdUfG1jTM9A8UNXS6wTo0AwaAbMAS+
         trAkvCk1W8jAnVoo7DjUtPPBO917768DY3F0QVHDBU2Owo4ugIEVBMbwPozvOb7yBuEr
         ddVtHeKTx4uF3rH66OYWjkI+66IuTPP4uv3VfPzm4cD+S50fxUH0sxGB5xXWSB2+FYRY
         jGHMpYf/2pFoPS37l9YAL/1RbYt1OydooasvhKzWe9SG4t461vZ/nu0QXN3+V2xdMTGV
         num8iXS0Znd0dqVO+kFQEjeUZ21cU/vLfsKnrd5v1BjSX8rFtqL5gb9FUM28EFrpQR2P
         Pirg==
X-Gm-Message-State: AOAM533tTd0FlciyDHN8j/kVa17m9lEtvjUXaQuiWFjSa+WcGwXl7Mdz
        uV1YpkptRqGrwK+PbXi2XdQOk8QL7xMv+K+gJdYCM7EMBQnq5hFUMgbEbnaRMdzX4FxggEzVCw3
        ZhROcUYKrDJtXqNfiWkRKnUWDGku3FFElMC7mya21QqbDqE7z
X-Received: by 2002:a05:6402:485:: with SMTP id k5mr33466131edv.211.1618938094310;
        Tue, 20 Apr 2021 10:01:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxELCUSPyZrAOwt3tM3D+dUCVIuCF50hufvL6zlHUtYRnZrR2c+i038ZRqkVsJ8Am5+aEE28g==
X-Received: by 2002:a05:6402:485:: with SMTP id k5mr33466108edv.211.1618938094155;
        Tue, 20 Apr 2021 10:01:34 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id x7sm16334441eds.67.2021.04.20.10.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 10:01:33 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-rtc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 3/9] mfd: sec: Remove unused device_type in platform data
Date:   Tue, 20 Apr 2021 19:01:12 +0200
Message-Id: <20210420170118.12788-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420170118.12788-1-krzysztof.kozlowski@canonical.com>
References: <20210420170118.12788-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The 'device_type' field of platform data structure is not used and can
be safely dropped.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/mfd/sec-core.c           | 5 +----
 include/linux/mfd/samsung/core.h | 1 -
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 653d02b98d53..4c4db3171ce6 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -318,7 +318,6 @@ static int sec_pmic_probe(struct i2c_client *i2c,
 	struct sec_platform_data *pdata;
 	const struct mfd_cell *sec_devs;
 	struct sec_pmic_dev *sec_pmic;
-	unsigned long device_type;
 	int ret, num_sec_devs;
 
 	sec_pmic = devm_kzalloc(&i2c->dev, sizeof(struct sec_pmic_dev),
@@ -330,16 +329,14 @@ static int sec_pmic_probe(struct i2c_client *i2c,
 	sec_pmic->dev = &i2c->dev;
 	sec_pmic->i2c = i2c;
 	sec_pmic->irq = i2c->irq;
-	device_type = (unsigned long)of_device_get_match_data(sec_pmic->dev);
 
 	pdata = sec_pmic_i2c_parse_dt_pdata(sec_pmic->dev);
 	if (IS_ERR(pdata)) {
 		ret = PTR_ERR(pdata);
 		return ret;
 	}
-	pdata->device_type = device_type;
 
-	sec_pmic->device_type = pdata->device_type;
+	sec_pmic->device_type = (unsigned long)of_device_get_match_data(sec_pmic->dev);
 	sec_pmic->irq_base = pdata->irq_base;
 	sec_pmic->wakeup = pdata->wakeup;
 	sec_pmic->pdata = pdata;
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index 68afc2b97a41..bfde1b7c6303 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -81,7 +81,6 @@ int sec_irq_resume(struct sec_pmic_dev *sec_pmic);
 struct sec_platform_data {
 	struct sec_regulator_data	*regulators;
 	struct sec_opmode_data		*opmode;
-	int				device_type;
 	int				num_regulators;
 
 	int				irq_base;
-- 
2.25.1

