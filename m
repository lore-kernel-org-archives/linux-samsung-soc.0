Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4538AC433ED
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 19 Apr 2021 08:17:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C90D61107
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 19 Apr 2021 08:17:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238002AbhDSISM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 19 Apr 2021 04:18:12 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50466 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236706AbhDSISI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Apr 2021 04:18:08 -0400
Received: from mail-ed1-f70.google.com ([209.85.208.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYP69-0007wE-SM
        for linux-samsung-soc@vger.kernel.org; Mon, 19 Apr 2021 08:17:37 +0000
Received: by mail-ed1-f70.google.com with SMTP id w14-20020aa7da4e0000b02903834aeed684so9002904eds.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Apr 2021 01:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xk3WBnA32t2m4Myce9cZ0YQ9ZIjnwr2MU+dccRhDaEQ=;
        b=iGdJXPvcv8OrkLPj0soejm3oL/tTG9wDEGy5RTOitN27OvyU3M0Jf/QCF/wXkR50Z2
         tEq2NdrvlwMpsz9f3hzThgFImd1nB4AgoBKrigwobToVDdgzZMoYC9H/jaOUlTdvGeSs
         IYpqpJkykFpQ/grl4IYuq9oR5rVBrfz3Zkphn/KcHRx8dRW8YxiVYw/fy9CElnpSTF25
         6XT2tWPNCxdDoMJY2Njptw+KOa9PT6XvYq7bt1L23dkQ12Gv5CF8gcQE4WJBqikUONHy
         3V89DkExdD/3/YDtKQJXK/5eTSHndiq34lNh5tQnX0DGIzR/CwcmD5zg68iS8gP0h+2d
         J9uA==
X-Gm-Message-State: AOAM532AFBYMLKGWeOf8ndopTVJJX89EfXQCK7epm+QBpbmLZilh0Jyf
        5+zriewEFAC4ZzpkREy6MxdTdOOqneVWsGdqqsh3GZM8d4ORom6BlgiRnz7aX8RHR7ngh02FVwi
        ANhRONs6fY+XJEUgyHuswQpCFG7RmuVKzHJmAHerww7N3MhOv
X-Received: by 2002:aa7:c78a:: with SMTP id n10mr16235094eds.239.1618820257638;
        Mon, 19 Apr 2021 01:17:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEC1eWVQTu9LMVgr/ILKMxwUXo5jz/WdoxqL0Yi4g29Y+yv0xfxfv1+lWwr2RseWz0zqylAQ==
X-Received: by 2002:aa7:c78a:: with SMTP id n10mr16235083eds.239.1618820257512;
        Mon, 19 Apr 2021 01:17:37 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id da13sm12384781edb.6.2021.04.19.01.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 01:17:37 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 7/7] mfd: twl: Correct kerneldoc
Date:   Mon, 19 Apr 2021 10:17:26 +0200
Message-Id: <20210419081726.67867-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419081726.67867-1-krzysztof.kozlowski@canonical.com>
References: <20210419081726.67867-1-krzysztof.kozlowski@canonical.com>
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

