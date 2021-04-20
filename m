Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D45EDC433B4
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 11:39:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75A36613B4
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 11:39:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231561AbhDTLkG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 20 Apr 2021 07:40:06 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:39084 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231709AbhDTLkF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Apr 2021 07:40:05 -0400
Received: from mail-ed1-f69.google.com ([209.85.208.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYoj7-0005So-MZ
        for linux-samsung-soc@vger.kernel.org; Tue, 20 Apr 2021 11:39:33 +0000
Received: by mail-ed1-f69.google.com with SMTP id cz7-20020a0564021ca7b02903853d41d8adso3658032edb.17
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Apr 2021 04:39:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q90BO6jGToShK7OtE3+O0ipoJJd5f8g5lHfCYVt8P0g=;
        b=Agl0otRpZvtBmcB8CsjMg97WY/CAr4Ezw0z0csA2V65OfPGJPK5sQ74oba9YkLJc2Q
         D7LPjALJlGXu3IsyZkW4YkFoSP6Uzs4jJIbXWgVwCFO/E2FtGurGizo4QkTDBJ5wp455
         lnXLkBJkuz+1O290kHBM/KTj5uHo2lof1nl7kTOwD+hYooya+I0qZKOu4JcqDbswbq97
         dD1zGIbiIrgjHUSLqw8gPfMbQ20pQQaD4bluVibjtf75ILf9Jy/vsNy/TpvTR/XBFpQX
         OdXUCewe4GHMNkQODXSjVaih1Wtaji6CsRNGYthDRI8kd9J3tvLM3qP+k3pdVG7K4Za7
         CiyQ==
X-Gm-Message-State: AOAM533VEF6t2VXAGHRO19QI7rOUvx+zfxy1m1qZgisenxXvPcnDr2Yp
        kvIYa8N/A3G+nXUlXHcs9qdB/HVnOSYHaHW7/S25w7BbEeXDE5ajA0Qjp5QZZ1Q1upaFdSSJUCz
        lC+LQz3/J/8zikugW5lXBNnJ31QY17XcoQVnAepLnAz5OHsy5
X-Received: by 2002:a05:6402:3591:: with SMTP id y17mr9694321edc.67.1618918773289;
        Tue, 20 Apr 2021 04:39:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCLCtp1s6fwTCslFHZbIHpbby+AF9jKEcIYP26e31mN/27ZAbOVO9O6Pn3Wxa5EUsrnfGQ7Q==
X-Received: by 2002:a05:6402:3591:: with SMTP id y17mr9694307edc.67.1618918773112;
        Tue, 20 Apr 2021 04:39:33 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id bw26sm10109007ejb.119.2021.04.20.04.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 04:39:32 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH v2 1/7] mfd: max8997: Simplify getting of_device_id match data
Date:   Tue, 20 Apr 2021 13:39:23 +0200
Message-Id: <20210420113929.278082-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use of_device_get_match_data() to make the code slightly smaller.  There
is also no need to wrap it in a check for CONFIG_OF, because dev.of_node
will be set only with OF support.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes since v1:
1. Remove check for CONFIG_OF
---
 drivers/mfd/max8997.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/max8997.c b/drivers/mfd/max8997.c
index 68d8f2b95287..2141de78115d 100644
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
+	if (i2c->dev.of_node)
+		return (unsigned long)of_device_get_match_data(&i2c->dev);
+
 	return id->driver_data;
 }
 
-- 
2.25.1

