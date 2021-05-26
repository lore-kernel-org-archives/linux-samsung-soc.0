Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A52CC47088
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 May 2021 12:51:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62647613DC
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 May 2021 12:51:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234873AbhEZMwk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 26 May 2021 08:52:40 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56891 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234880AbhEZMtO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 May 2021 08:49:14 -0400
Received: from mail-vs1-f72.google.com ([209.85.217.72])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1llswl-0000xm-Vv
        for linux-samsung-soc@vger.kernel.org; Wed, 26 May 2021 12:47:40 +0000
Received: by mail-vs1-f72.google.com with SMTP id h27-20020a67cb9b0000b0290235f3536140so193509vsl.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 May 2021 05:47:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gi5LKjjP0bjXDjYj7Ix3Hw0qKjf6CelOHRk1zXBWnaI=;
        b=JcVxVrZpCJzb2MWSFxRHwUbyJPbo30MCrNv2/Er7uNNOeOOVSsAiO1QZEgqvhYUEcH
         HaILKeFVRSdpw5oLu5HbIEmkVhFwC9BAPNxoT4c9McHJtOLc1k9IVbBsdZ9RkoVJvMq6
         9cbvMdfk7kTrFzSQoMimwPeo0HO748mglitsdIg96fbnyAYEkLHNn6LaxenopkyeS9/5
         eIqrCd0UHx4a6Ysc5tu3q9OmyX/EcU+ECzaQCshd7YGEnQ5mavLcXNhOEJvvGlOVfgbE
         fzpkoYm8+z+JoyamzCfHq6ltsy78LNYKM4sGExC4uI4kxqFIs3cyWniBgS8bucXoGf8r
         cLNw==
X-Gm-Message-State: AOAM530ZjgoVbIDKP97B6HxzQeUjaCN8q+2r2TcmYD6GP+CpHNYDWCqn
        MfyDBr3G7wvgS7LB2GdiKIgfrathizCNh3PB7p17HhbxGekrRrNCFcLOCmFs/O4JGYYNpFe/FUY
        R/ZkMzY1lqtjABDcDM3TLGT+IeJuSEO4PMDdtU8KbHLWnfwao
X-Received: by 2002:a67:1087:: with SMTP id 129mr29581340vsq.42.1622033258714;
        Wed, 26 May 2021 05:47:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCM8BjysU8Rx+YcwLvtbPPjwicIzKBwQd2iZE/2FBz/KnmsXQzCZ4DPoAcGK75nk/My7ZDuA==
X-Received: by 2002:a67:1087:: with SMTP id 129mr29581327vsq.42.1622033258573;
        Wed, 26 May 2021 05:47:38 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id c126sm875817vkh.47.2021.05.26.05.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 05:47:38 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [RESEND PATCH v2 05/13] mfd: sec: Simplify getting of_device_id match data
Date:   Wed, 26 May 2021 08:47:03 -0400
Message-Id: <20210526124711.33223-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
References: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
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
1. Remove check for CONFIG_OF as suggested by Marek
---
 drivers/mfd/sec-core.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 8d55992da19e..15dd4c579937 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -10,6 +10,7 @@
 #include <linux/slab.h>
 #include <linux/i2c.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/interrupt.h>
 #include <linux/pm_runtime.h>
@@ -323,14 +324,9 @@ sec_pmic_i2c_parse_dt_pdata(struct device *dev)
 static inline unsigned long sec_i2c_get_driver_data(struct i2c_client *i2c,
 						const struct i2c_device_id *id)
 {
-#ifdef CONFIG_OF
-	if (i2c->dev.of_node) {
-		const struct of_device_id *match;
+	if (i2c->dev.of_node)
+		return (unsigned long)of_device_get_match_data(&i2c->dev);
 
-		match = of_match_node(sec_dt_match, i2c->dev.of_node);
-		return (unsigned long)match->data;
-	}
-#endif
 	return id->driver_data;
 }
 
-- 
2.27.0

