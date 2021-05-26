Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B51C47082
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 May 2021 12:51:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA273613F1
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 May 2021 12:51:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234790AbhEZMwg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 26 May 2021 08:52:36 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56911 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234873AbhEZMtP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 May 2021 08:49:15 -0400
Received: from mail-ua1-f71.google.com ([209.85.222.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1llswp-0000zQ-3h
        for linux-samsung-soc@vger.kernel.org; Wed, 26 May 2021 12:47:43 +0000
Received: by mail-ua1-f71.google.com with SMTP id f2-20020ab006020000b02902124881cdf4so724229uaf.7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 May 2021 05:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xmq4az+LVVwXfHSluC5ybVO0wHBrYm+QPRvC663g7hE=;
        b=qUVPITAVuWbFMcOFJ0qVBT9CN333s2AS8j0scxIdFyp28n7aSNDs6W6u+r9UaP+FG0
         4SxzHiFT6+FEDDo9zg8HYU2Udn7AXN3eITJa9tcDF9fZiOPFrcj5g9EdAgSNoW5CHHKP
         WkIUm1hli9AJ/DXFlF1dsa6vsZJgVtQZ6kVBfxOlSj0xJFgFht1LAXIPYZEYMANNFndv
         KijMboczzVCgatMdlxUJctPvM348ezpZ6GZ0rmgktHxOvelbx7mLzDecCQUoWLLGyaxQ
         fH8Rel29TV3yx/Nr9HHk2eIZ4nohLcDUTZ0SxNs8kRXCk57l2wUKgd7tr0ZehKs2cPdV
         oI5g==
X-Gm-Message-State: AOAM533zDEPwzPGL1ERpkCknqKSv0PbBc5sahzOO1/g38xcZUR+VowJh
        YiyOL8BQ0RkaiRF3mWrp3lZCTk7lh8WmZmN9jmWnx4Om4DMb69uNUMsx6s/lllls6Wd1XYU7e0J
        JKN4Tav2hR5jxjDOVNYZP++3c/7sNgSF8/+a4AYaHrQRfcG+D
X-Received: by 2002:ab0:2690:: with SMTP id t16mr32616236uao.9.1622033262218;
        Wed, 26 May 2021 05:47:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAQIaZSYaw/87n9WsaeWRycw8n9xSrM+/O2sXVcNtI7Ic5NMnYJIKikee5mCmgG0Yw6URGoA==
X-Received: by 2002:ab0:2690:: with SMTP id t16mr32616208uao.9.1622033262021;
        Wed, 26 May 2021 05:47:42 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id c126sm875817vkh.47.2021.05.26.05.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 05:47:41 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [RESEND PATCH v2 07/13] mfd: twl: Correct kerneldoc
Date:   Wed, 26 May 2021 08:47:05 -0400
Message-Id: <20210526124711.33223-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
References: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
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
2.27.0

