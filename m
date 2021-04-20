Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60240C433B4
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 17:02:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 294A0613C9
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 17:02:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233285AbhDTRDY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 20 Apr 2021 13:03:24 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50144 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233363AbhDTRDX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Apr 2021 13:03:23 -0400
Received: from mail-ej1-f70.google.com ([209.85.218.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYtly-0004cQ-Ou
        for linux-samsung-soc@vger.kernel.org; Tue, 20 Apr 2021 17:02:50 +0000
Received: by mail-ej1-f70.google.com with SMTP id c18-20020a17090603d2b029037c77ad778eso5026432eja.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Apr 2021 10:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CZHnNFNaMNa8a85SBpXammff3rvFDkP+H98gsBQ8d3o=;
        b=bTKPqrPTne0D9maIs6GNY+3WyBLsQA4gbeLZZBbwvIxf9PWdSF0qk6bC0vNlVgobh1
         DVZadiMWZo6KU8AjWTMEpriZ1HK5PRLEMeZbpNP0KADhf0x9SfS0zOYSGZv2EVetgLxd
         KNiDEmPtc3oG/bitNrOTizSWJ/Nuw7BBO5qJAfBy2jMHUvIGesHx2SZW4PrfIQg4/efH
         jCzjAdgQGW+aAMVd+qFvu+oo888p7b/+AjBDFY8a3HWSX145fF711o3VRrY1jcCnaM9/
         38gUzOV28WHhWlruEMk4kibW6LY5Krsy21nmzhYcuPJeb4PKAeR07dcLFPzzt5a+OirZ
         vnBg==
X-Gm-Message-State: AOAM533Dhhh6L4jXggio2zJOGNuSBcTnu475uNFUCSwKZFHU4IBnh+UF
        phubpJSWKD713qy6dLeIpjaBh30y2jHPhwF0U2dInplTbt5bNHuya/Mv9HvBiABOtobEdNijjLU
        JWy73SR/s75II3w8sWxkRnqLiU33mM1ehoXlRrVHMwvWa0NIa
X-Received: by 2002:a17:906:4913:: with SMTP id b19mr28867179ejq.439.1618938170533;
        Tue, 20 Apr 2021 10:02:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOLsxZKglCAv77mKXcTh7j9A7OdejF9kWYftWrwmpV/d4re5KZPtRxzK5D7Kz9pjhQCLFxOg==
X-Received: by 2002:a17:906:4913:: with SMTP id b19mr28867163ejq.439.1618938170410;
        Tue, 20 Apr 2021 10:02:50 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id s20sm16590714edu.93.2021.04.20.10.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 10:02:49 -0700 (PDT)
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
Subject: [PATCH 7/9] rtc: s5m: Remove reference to parent's device pdata
Date:   Tue, 20 Apr 2021 19:02:42 +0200
Message-Id: <20210420170244.13467-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420170244.13467-1-krzysztof.kozlowski@canonical.com>
References: <20210420170118.12788-1-krzysztof.kozlowski@canonical.com>
 <20210420170244.13467-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The S5M RTC driver does not use parent's device (sec-core PMIC driver)
platform data so there is no need to check for it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/rtc/rtc-s5m.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 80b66f16db89..038269a6b08c 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -713,16 +713,10 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_info *info)
 static int s5m_rtc_probe(struct platform_device *pdev)
 {
 	struct sec_pmic_dev *s5m87xx = dev_get_drvdata(pdev->dev.parent);
-	struct sec_platform_data *pdata = s5m87xx->pdata;
 	struct s5m_rtc_info *info;
 	const struct regmap_config *regmap_cfg;
 	int ret, alarm_irq;
 
-	if (!pdata) {
-		dev_err(pdev->dev.parent, "Platform data not supplied\n");
-		return -ENODEV;
-	}
-
 	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
-- 
2.25.1

