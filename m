Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43FD1C47088
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 May 2021 12:51:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BD3A6124B
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 May 2021 12:51:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234908AbhEZMwe (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 26 May 2021 08:52:34 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56877 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234875AbhEZMtO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 May 2021 08:49:14 -0400
Received: from mail-vs1-f71.google.com ([209.85.217.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1llswk-0000xA-FS
        for linux-samsung-soc@vger.kernel.org; Wed, 26 May 2021 12:47:38 +0000
Received: by mail-vs1-f71.google.com with SMTP id n26-20020a67d61a0000b029023651d629a4so197016vsj.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 May 2021 05:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VIi0UDETJWMz8r22ACVNYPInzss+jr7PKRHzj4F9CjI=;
        b=DilMK6XVf487rBfpSDrmMr0we4UwATAQCkr9vNlgCSFJx6R6C4G9nYbC17WTTiwrn3
         0mU+sOjNi/3iOMtlCi0krKvvqfySYagH0hoqWRKIDY7LfzCjejofl06MXHKqVfUdYobm
         w9UWKqKBeNUDiH8qmShG9Ee7Scc+JWuOQpLj7M5Lf9JDFCGtmHDlwOxmpLofpYGgKLis
         BvEmEjv9CE4szPntZw08ilG2SmFcIsyt19M0y7utL9lr8Li1epfm/kgnAQ8/lXhgvfg+
         myIv/UVbEO8flHMLlmRZKPiTf6Ss93FMRCaFVSuKY3KYjhbaEQIk8YYA9SndZqFecGkS
         c9eQ==
X-Gm-Message-State: AOAM530hFD4LOAG5vdRrwA/I8Z3dULVstrJ5jHLt3XLwC+EbwcUoIhwG
        JGSe2XEQ2DQ5ngZoH2fA8X0f4aDCX7j2Wvu5fgoj49zKVfmKa4t5aaiJ/oLV0S18JIUNhd2CwDS
        ew/JQhSA6tXes+SRYZgINdQ61qEvL+CSMEDjkMmvhKeV96jmZ
X-Received: by 2002:a05:6102:321b:: with SMTP id r27mr29696991vsf.13.1622033257578;
        Wed, 26 May 2021 05:47:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVJ0GkIwUjj/SnT+ky43SozLjtVHQDTyQ4X8v8jZZwJZjmUrTyX1krLd+798CTd0BMRkeRUQ==
X-Received: by 2002:a05:6102:321b:: with SMTP id r27mr29696940vsf.13.1622033257072;
        Wed, 26 May 2021 05:47:37 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id c126sm875817vkh.47.2021.05.26.05.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 05:47:36 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Cc:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Subject: [RESEND PATCH v2 04/13] mfd: da9062: Simplify getting of_device_id match data
Date:   Wed, 26 May 2021 08:47:02 -0400
Message-Id: <20210526124711.33223-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
References: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use of_device_get_match_data() to make the code slightly smaller.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

---

Changes since v1:
1. Add Ack
2. Correct subject prefix
---
 drivers/mfd/da9062-core.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/da9062-core.c b/drivers/mfd/da9062-core.c
index 8d913375152d..01f8e10dfa55 100644
--- a/drivers/mfd/da9062-core.c
+++ b/drivers/mfd/da9062-core.c
@@ -9,6 +9,7 @@
 #include <linux/init.h>
 #include <linux/device.h>
 #include <linux/interrupt.h>
+#include <linux/of_device.h>
 #include <linux/regmap.h>
 #include <linux/irq.h>
 #include <linux/mfd/core.h>
@@ -622,7 +623,6 @@ static int da9062_i2c_probe(struct i2c_client *i2c,
 	const struct i2c_device_id *id)
 {
 	struct da9062 *chip;
-	const struct of_device_id *match;
 	unsigned int irq_base;
 	const struct mfd_cell *cell;
 	const struct regmap_irq_chip *irq_chip;
@@ -635,15 +635,10 @@ static int da9062_i2c_probe(struct i2c_client *i2c,
 	if (!chip)
 		return -ENOMEM;
 
-	if (i2c->dev.of_node) {
-		match = of_match_node(da9062_dt_ids, i2c->dev.of_node);
-		if (!match)
-			return -EINVAL;
-
-		chip->chip_type = (uintptr_t)match->data;
-	} else {
+	if (i2c->dev.of_node)
+		chip->chip_type = (uintptr_t)of_device_get_match_data(&i2c->dev);
+	else
 		chip->chip_type = id->driver_data;
-	}
 
 	i2c_set_clientdata(i2c, chip);
 	chip->dev = &i2c->dev;
-- 
2.27.0

