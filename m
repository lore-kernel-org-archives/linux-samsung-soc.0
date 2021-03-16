Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F1AFC433DB
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 16 Mar 2021 13:26:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E941E6505E
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 16 Mar 2021 13:26:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234950AbhCPNZ5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 16 Mar 2021 09:25:57 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:47003 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232098AbhCPNZZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 16 Mar 2021 09:25:25 -0400
Received: from mail-ej1-f70.google.com ([209.85.218.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lM9hJ-0001GU-Us
        for linux-samsung-soc@vger.kernel.org; Tue, 16 Mar 2021 13:25:21 +0000
Received: by mail-ej1-f70.google.com with SMTP id v10so13561023ejh.15
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Mar 2021 06:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=83ZIZm2jxLoXrgqf2w4Pq9GXA0XBAVNJX5oJ88+rGxI=;
        b=UddezZxlEQewO980f/3Q68TR4RhHhXCyBeXA0UIemasvudFXaDiIcH4f0I/qo0JN4S
         HRhVqtX6BGBbJLaxur+yQeiQ2qhpQDxfZrC+k0+ss0sjMf7oEScjk+q8eyqnTNwgGnVV
         U1/i65LSqQOhmmDaTVPK+7aWa/W7vJQIxbymlfYaxNhtbCrgTt5Ivxm9kGkzgjiPoK5Z
         dio4yUhzVwpOEhUFZf0v2rA7Wu4LhsnwrxEwDYEdQvJXul+bKfHq5cv5Suk6crYdDcGh
         kzALXsK5vRHZZckU7fVoPLQg1VNndKps+OfwrgfJ7VCOiRIQRzdE0PVy9oVI+Fa4vcq/
         Ypdg==
X-Gm-Message-State: AOAM532DMjsB4Z62eyYozCBRHIedULpJVxgN4PpWTm2jtCSOK+TjIKBy
        kkCgSUv7lSAdta+EOGCmARWOMQRfOYdbOmun1uoNeXNRB7/9OeC2wecwSwpHx1RaOCe94RV7SJj
        NwlGuWU2F4lSIQZCXpu+whjQ0kXct+Ub7Wd1xDpw7sbF+vffr
X-Received: by 2002:a17:906:4705:: with SMTP id y5mr29994534ejq.119.1615901121364;
        Tue, 16 Mar 2021 06:25:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUVysx7ycFc90Jo/jv+3/QyA7CJAJ1yVRgIm54vcSiVdhofTbTH8E+xznhLUPZrQ6xZzFWwQ==
X-Received: by 2002:a17:906:4705:: with SMTP id y5mr29994516ejq.119.1615901121183;
        Tue, 16 Mar 2021 06:25:21 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id sb4sm9450217ejb.71.2021.03.16.06.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 06:25:20 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [RESEND PATCH] mfd: sec: initialize driver via module_platform_driver
Date:   Tue, 16 Mar 2021 14:25:15 +0100
Message-Id: <20210316132515.50588-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Krzysztof Kozlowski <krzk@kernel.org>

The driver was using subsys_initcall() because in old times deferred
probe was not supported everywhere and specific ordering was needed.
Since probe deferral works fine and specific ordering is discouraged
(hides dependencies between drivers and couples their boot order), the
driver can be converted to regular module_platform_driver.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/mfd/sec-core.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 95473ff9bb4b..8d55992da19e 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -549,19 +549,7 @@ static struct i2c_driver sec_pmic_driver = {
 	.shutdown = sec_pmic_shutdown,
 	.id_table = sec_pmic_id,
 };
-
-static int __init sec_pmic_init(void)
-{
-	return i2c_add_driver(&sec_pmic_driver);
-}
-
-subsys_initcall(sec_pmic_init);
-
-static void __exit sec_pmic_exit(void)
-{
-	i2c_del_driver(&sec_pmic_driver);
-}
-module_exit(sec_pmic_exit);
+module_i2c_driver(sec_pmic_driver);
 
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
 MODULE_DESCRIPTION("Core support for the S5M MFD");
-- 
2.25.1

