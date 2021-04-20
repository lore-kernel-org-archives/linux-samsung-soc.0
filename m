Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33243C43470
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 11:39:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3F14613C1
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 11:39:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232020AbhDTLkT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 20 Apr 2021 07:40:19 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:39154 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232016AbhDTLkN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Apr 2021 07:40:13 -0400
Received: from mail-ed1-f71.google.com ([209.85.208.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYojE-0005Xc-OW
        for linux-samsung-soc@vger.kernel.org; Tue, 20 Apr 2021 11:39:40 +0000
Received: by mail-ed1-f71.google.com with SMTP id d2-20020aa7d6820000b0290384ee872881so8874007edr.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Apr 2021 04:39:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xk3WBnA32t2m4Myce9cZ0YQ9ZIjnwr2MU+dccRhDaEQ=;
        b=G0cqpfCKOXDsmhgzrO01fjc1FY98j9CtgRLaMhZwqX+pGsEqv1HHt/dSZllyBQecdL
         ysVdMo1WKSGSTu/g0NEmA0qwnpDEby5tqmZB+sMa9urhkx2nOVskoEbX0H94zuuacdtn
         EeF3OB3qsqkO4NHHoa3ekxaji11JZ5k9z9K9UJ7/6a2M4T4QMSgO54wor84K+ckvd84x
         tHQqDOnMVXN5dHQOTI0Cpb6r4gTg4Yij/ULA8JwPGmwp+ackF4O007EIFUnAsGL9tp49
         K3if/i15W4rGI4Fsdy1XybYgxRXeXNJ6/RCr/KpkQPsRbPQbe74aEU3jq1Kb0Gdy07qQ
         8B2A==
X-Gm-Message-State: AOAM5309YojnaP8iMusNmSGn0d18/fOSYwWDY2Zn4SDIAzNwQbCKIgqx
        zMoMuoDVo6WVgF561URPclTFZqH/8pWbVqFckkfM9Lh/Ms7UrLUURvzcPC3DiFZ4u6W+7oK4Fq0
        UvNFzypwfhQ2rBZ3r4M9a6y6xMkLuFaMpkmiElVhrnA8UA56w
X-Received: by 2002:a17:906:b85a:: with SMTP id ga26mr27062866ejb.366.1618918780484;
        Tue, 20 Apr 2021 04:39:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJs56MliRWAB0TrKrTN4psbryZ6Ncf4csq/xRSSpnIs0jNai0M7qouKkTw2it1vSiuzy3rzQ==
X-Received: by 2002:a17:906:b85a:: with SMTP id ga26mr27062853ejb.366.1618918780368;
        Tue, 20 Apr 2021 04:39:40 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id bw26sm10109007ejb.119.2021.04.20.04.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 04:39:40 -0700 (PDT)
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
Subject: [PATCH v2 7/7] mfd: twl: Correct kerneldoc
Date:   Tue, 20 Apr 2021 13:39:29 +0200
Message-Id: <20210420113929.278082-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420113929.278082-1-krzysztof.kozlowski@canonical.com>
References: <20210420113929.278082-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Correct kerneldoc function name to fix W=1 warning:

  drivers/mfd/twl-core.c:496: warning:
    expecting prototype for twl_regcache_bypass(). Prototype was for twl_set_regcache_bypass() instead

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/mfd/twl-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
index 20cf8cfe4f3b..24b77b18b725 100644
--- a/drivers/mfd/twl-core.c
+++ b/drivers/mfd/twl-core.c
@@ -485,8 +485,8 @@ int twl_i2c_read(u8 mod_no, u8 *value, u8 reg, unsigned num_bytes)
 EXPORT_SYMBOL(twl_i2c_read);
 
 /**
- * twl_regcache_bypass - Configure the regcache bypass for the regmap associated
- *			 with the module
+ * twl_set_regcache_bypass - Configure the regcache bypass for the regmap
+ *			     associated with the module
  * @mod_no: module number
  * @enable: Regcache bypass state
  *
-- 
2.25.1

