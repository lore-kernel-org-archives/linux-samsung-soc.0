Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A779C433B4
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 19 Apr 2021 08:17:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5CDE261107
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 19 Apr 2021 08:17:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234525AbhDSISF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 19 Apr 2021 04:18:05 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50416 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232400AbhDSISD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Apr 2021 04:18:03 -0400
Received: from mail-ed1-f72.google.com ([209.85.208.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYP64-0007tD-Mx
        for linux-samsung-soc@vger.kernel.org; Mon, 19 Apr 2021 08:17:32 +0000
Received: by mail-ed1-f72.google.com with SMTP id r14-20020a50d68e0000b0290385504d6e4eso829046edi.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Apr 2021 01:17:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=52l2YOdVJgJFgazG9TczP/a1+Vn2GICqhmwoQ1rMqI8=;
        b=gPLOctVOyKH+bVXkIxPfxPWjxx/E4vSqjvbQlDywmwhidwAT4zYRd9rvRx4PAfP5tc
         TDAt+4K5OrAACAitfFrf9Wg6CXwFLmysnsgYu2Z0Wct8nCTWvht5gEhubcLS529FeNlQ
         kwrybQfrpyco3lAOfEfW86OvWV7bQC+1foFY2x/zwPOZ5bFBXVibudyu3hz55j9vksib
         PhJruudPyeClHBExL0KvH9lLiEDiWp8QFN4IBQ6XTF0PvpSHm1PEMIP9VeY/6szrFNox
         1WDE4PmNb64U5FuVh7YvHmlPcCdgtz8R0RtPzEDqLzkz+YGGf90gKKOb37x+0O14A/9m
         7eCA==
X-Gm-Message-State: AOAM531S3Gln+Y/MWKxFpj/ja8iUgAzcD2laEPJKXWTcvUJRwyaMB5/f
        gbWx+w41OjLZnJuxOv21A+1hCme6WL/SFTilN3LGBvbKdptvqQ/MZhf8BNJuznUsEa7/adO+BdR
        vQeXS3wranmtvxBIKTNgY75r1s7NkThd5wDIvXshFDIHZz+eD
X-Received: by 2002:a17:906:4881:: with SMTP id v1mr1683063ejq.383.1618820252484;
        Mon, 19 Apr 2021 01:17:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJYZH0QZa+sRVeO2DjuzsgUYgTnfcyHw6NR/d953cZ/+ohVHYxVqiEhAjo9vStCBaYnVmhfw==
X-Received: by 2002:a17:906:4881:: with SMTP id v1mr1683050ejq.383.1618820252362;
        Mon, 19 Apr 2021 01:17:32 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id da13sm12384781edb.6.2021.04.19.01.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 01:17:32 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/7] mfd: max8998: Simplify getting of_device_id match data
Date:   Mon, 19 Apr 2021 10:17:21 +0200
Message-Id: <20210419081726.67867-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419081726.67867-1-krzysztof.kozlowski@canonical.com>
References: <20210419081726.67867-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use of_device_get_match_data() to make the code slightly smaller.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/mfd/max8998.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/max8998.c b/drivers/mfd/max8998.c
index 785f8e9841b7..42c60d4d97fb 100644
--- a/drivers/mfd/max8998.c
+++ b/drivers/mfd/max8998.c
@@ -12,6 +12,7 @@
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/pm_runtime.h>
 #include <linux/mutex.h>
@@ -155,11 +156,8 @@ static struct max8998_platform_data *max8998_i2c_parse_dt_pdata(
 static inline unsigned long max8998_i2c_get_driver_data(struct i2c_client *i2c,
 						const struct i2c_device_id *id)
 {
-	if (IS_ENABLED(CONFIG_OF) && i2c->dev.of_node) {
-		const struct of_device_id *match;
-		match = of_match_node(max8998_dt_match, i2c->dev.of_node);
-		return (unsigned long)match->data;
-	}
+	if (IS_ENABLED(CONFIG_OF) && i2c->dev.of_node)
+		return (unsigned long)of_device_get_match_data(&i2c->dev);
 
 	return id->driver_data;
 }
-- 
2.25.1

