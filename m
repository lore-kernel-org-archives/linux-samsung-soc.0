Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88301C43461
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 11:39:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4EE70613AB
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 11:39:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231871AbhDTLkH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 20 Apr 2021 07:40:07 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:39089 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbhDTLkG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Apr 2021 07:40:06 -0400
Received: from mail-ed1-f72.google.com ([209.85.208.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYoj8-0005TP-N1
        for linux-samsung-soc@vger.kernel.org; Tue, 20 Apr 2021 11:39:34 +0000
Received: by mail-ed1-f72.google.com with SMTP id f1-20020a0564021941b02903850806bb32so7015938edz.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Apr 2021 04:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wuB2/tI9xcQwhhNMwxEVaEgHMJT+b83uq8pd/UhDHWg=;
        b=fxyOzfrkUGeuokgU/8swWa3JFe/U15BZwuhk3JTkEiW1xapMSEtqUaK8pRh079yzXx
         xPhki+sHAo/xp6XTjYyOAddhcC+aZ0ibgJRkS/SliyZVDBMnnkn2n/mAECKhT2/sfItb
         oRFwzUkzvlUOkNXvPgjyrFOa7vXnDY8fUzMqhWkcl7U6Axi9qEAzdPnaYzHO7Q7YC+LM
         Z4KHT3JM5t/c4g8HJhjhSlmtqsn5m9MgbhFJOPU3hyekw3vNTmoOe2Yw3R9Jh3w7wa0v
         zsjl7DXti44OP9nSiOUzoXrxgyPOEjqi/czy4EBLm6my96mlQgUMDrwr8nt2DAJgIAtO
         4yVA==
X-Gm-Message-State: AOAM530RQ0sdJNvujJ5uWRyzCQ4Nk8eTY9jufGfZ0LfGiBELYe4L0npt
        E8eiKC/4L5LK3WVEoBGz5MvFdMs3aKYZ7IRbb3DQsWzZhs8CvyohyRdXQf29YkteXrDxop6Jcst
        Z3Z/va3H4GoVR7VE32eFOhR2ujleTQ6ljlrKN4gzf0aQ0CQgX
X-Received: by 2002:a50:fe01:: with SMTP id f1mr32499229edt.272.1618918774490;
        Tue, 20 Apr 2021 04:39:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7Xuk25grH3NsIgvMGGGwnXop0ZMYNrJctTBWfujHm1kJVpv/I1QXZELdTEgMAyJL7wTYErA==
X-Received: by 2002:a50:fe01:: with SMTP id f1mr32499223edt.272.1618918774374;
        Tue, 20 Apr 2021 04:39:34 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id bw26sm10109007ejb.119.2021.04.20.04.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 04:39:34 -0700 (PDT)
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
Subject: [PATCH v2 2/7] mfd: max8998: Simplify getting of_device_id match data
Date:   Tue, 20 Apr 2021 13:39:24 +0200
Message-Id: <20210420113929.278082-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420113929.278082-1-krzysztof.kozlowski@canonical.com>
References: <20210420113929.278082-1-krzysztof.kozlowski@canonical.com>
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
2.25.1

