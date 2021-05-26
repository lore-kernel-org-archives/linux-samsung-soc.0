Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F0FC47082
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 May 2021 12:49:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFBD0613F4
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 May 2021 12:49:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234279AbhEZMug (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 26 May 2021 08:50:36 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56859 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234820AbhEZMs5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 May 2021 08:48:57 -0400
Received: from mail-ua1-f70.google.com ([209.85.222.70])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1llswX-0000vJ-8T
        for linux-samsung-soc@vger.kernel.org; Wed, 26 May 2021 12:47:25 +0000
Received: by mail-ua1-f70.google.com with SMTP id o7-20020ab01e870000b029020d37e3e144so731947uak.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 May 2021 05:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lxlGt7UdLo9WhBrHrUnAMYLEvzBvX/vS3VzoKn9EqgQ=;
        b=RJw/5AmebhP9qF0Lw0Ny6xhDL58JhDzKOkGICtQOcbP18ROuiFiIIfwP5bVznZLDgY
         TkBfEyZbK5MMIqrXCprPyctOV6/zM3XfRHSyVbEQjm0IQ0622FlujXrSr3REr0gSD312
         uBn/KRFbaJ0zVbFsQDeexXnDnkNyklTWt4RpI641e3nq75kVNNlilGUTcLR97dHFmaao
         DzqgwZt+DkcUxrtybXFW8Qv+yb9gFZmIMrk93SYtkjqlA40PBUEED+qUKUWTznWEArQn
         ThbRUN5zdUdmbe3g5LAlN+8xkz/TzMzhK/Eb2TtRIH5Qo0UlfX912cn/cggIQcfnLXww
         zdKw==
X-Gm-Message-State: AOAM530mfk/ptB5S4zficC72wazMmzXmcme+rpnXvGief1yc1+0O9CCh
        GaU8LeAR9i9gI5JfEl9ABZnxEQZFIr/h+byX8kZC7/FzTdn43XhIOqFYETRaa0TFYsmjlSxK3zb
        JaU+M+Aqk65lN9XUHkbHbMs2Canpxh/06Tbv/koeSZKop75JA
X-Received: by 2002:a05:6122:c91:: with SMTP id ba17mr27607454vkb.8.1622033244395;
        Wed, 26 May 2021 05:47:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeHUz3scp7cdtBDvx3wZhYQgy/hPyyOLqDEXP9LcACOUFA0w4nitE9VfR17c6NvL1vm1QT3w==
X-Received: by 2002:a05:6122:c91:: with SMTP id ba17mr27607437vkb.8.1622033244233;
        Wed, 26 May 2021 05:47:24 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id c126sm875817vkh.47.2021.05.26.05.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 05:47:23 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [RESEND PATCH v2 02/13] mfd: max8998: Simplify getting of_device_id match data
Date:   Wed, 26 May 2021 08:47:00 -0400
Message-Id: <20210526124711.33223-3-krzysztof.kozlowski@canonical.com>
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
1. Remove check for CONFIG_OF
---
 drivers/mfd/max8998.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/max8998.c b/drivers/mfd/max8998.c
index 785f8e9841b7..0eb15e611b67 100644
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
+	if (i2c->dev.of_node)
+		return (unsigned long)of_device_get_match_data(&i2c->dev);
 
 	return id->driver_data;
 }
-- 
2.27.0

