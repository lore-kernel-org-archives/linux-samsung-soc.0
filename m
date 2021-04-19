Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB89EC433ED
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 19 Apr 2021 08:17:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E7966113C
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 19 Apr 2021 08:17:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232400AbhDSISF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 19 Apr 2021 04:18:05 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50410 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230487AbhDSISD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Apr 2021 04:18:03 -0400
Received: from mail-ed1-f72.google.com ([209.85.208.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYP63-0007sh-LF
        for linux-samsung-soc@vger.kernel.org; Mon, 19 Apr 2021 08:17:31 +0000
Received: by mail-ed1-f72.google.com with SMTP id l7-20020aa7c3070000b029038502ffe9f2so5001921edq.16
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Apr 2021 01:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g3LUGEJmp+br9C+4Vo+YUNsyCt/PXk3aFn54roSqdS8=;
        b=Ml5vRWmVdARbiwMxaM0X4dC2NQr91jV4Hl8OjMqFZzhab4rmURkuQCXMLjMfXxjXqh
         gpIXQgON8Y4w4a1hzM+MiGrk3U4K9KgGjFHNZV4Sskuq2+9M2u33MMAssEq70Q+ddPQc
         41n4s8QeYzsB33AuE0DHUqT51mKmL7CWMf/JDxjQKBbRMxivGfsg7YXi2UNXeItqKwv2
         J3a3umncq/vMYMVA3IPqrGs5OQOMULcnNOjL5BmaaVMg89Hu2ks4No6Yl+XXRjWgMFbA
         fUrRmt6UeglRvBadFO+tGEQHyrD9SyZvdJMifr3h1v3bfKxVIzPH7MEpgz8Y8O2Qswcr
         HQRw==
X-Gm-Message-State: AOAM533EPMJ7IY5fk+sBZeHwNpTbGMWBYenQPOBB+dOtvLoj5cCRyFhp
        TDT2gjlUkglSrq/XBtwfaFd0ze4CfO3wFThUZWfIJTpvWSF1TooZXecUqTBkt4Fj74RP8HV1SVs
        ZDazc1HBWQl4SbgOVostspuLYroCaXcOs9a1bckzmiqKQaTjJ
X-Received: by 2002:a17:906:7d82:: with SMTP id v2mr21176586ejo.524.1618820251388;
        Mon, 19 Apr 2021 01:17:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxy4EtMQXnut0wnOGkwOw0Mdy3TCBQQu/E5EuD6rk7PBrCTRVZtUjf3OIo0bVwGNEkZ4dAKsw==
X-Received: by 2002:a17:906:7d82:: with SMTP id v2mr21176578ejo.524.1618820251260;
        Mon, 19 Apr 2021 01:17:31 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id da13sm12384781edb.6.2021.04.19.01.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 01:17:30 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/7] mfd: max8997: Simplify getting of_device_id match data
Date:   Mon, 19 Apr 2021 10:17:20 +0200
Message-Id: <20210419081726.67867-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use of_device_get_match_data() to make the code slightly smaller.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/mfd/max8997.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/max8997.c b/drivers/mfd/max8997.c
index 68d8f2b95287..f89b1eb121c9 100644
--- a/drivers/mfd/max8997.c
+++ b/drivers/mfd/max8997.c
@@ -11,6 +11,7 @@
 #include <linux/slab.h>
 #include <linux/i2c.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/interrupt.h>
 #include <linux/pm_runtime.h>
@@ -145,11 +146,9 @@ static struct max8997_platform_data *max8997_i2c_parse_dt_pdata(
 static inline unsigned long max8997_i2c_get_driver_data(struct i2c_client *i2c,
 						const struct i2c_device_id *id)
 {
-	if (IS_ENABLED(CONFIG_OF) && i2c->dev.of_node) {
-		const struct of_device_id *match;
-		match = of_match_node(max8997_pmic_dt_match, i2c->dev.of_node);
-		return (unsigned long)match->data;
-	}
+	if (IS_ENABLED(CONFIG_OF) && i2c->dev.of_node)
+		return (unsigned long)of_device_get_match_data(&i2c->dev);
+
 	return id->driver_data;
 }
 
-- 
2.25.1

