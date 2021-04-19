Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECAACC43460
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 19 Apr 2021 08:17:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF1346113C
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 19 Apr 2021 08:17:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237906AbhDSISL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 19 Apr 2021 04:18:11 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50457 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235758AbhDSISH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Apr 2021 04:18:07 -0400
Received: from mail-ej1-f71.google.com ([209.85.218.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYP68-0007vg-QV
        for linux-samsung-soc@vger.kernel.org; Mon, 19 Apr 2021 08:17:36 +0000
Received: by mail-ej1-f71.google.com with SMTP id c18-20020a17090603d2b029037c77ad778eso3349062eja.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Apr 2021 01:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UpAJNzbD9MKVQi14LfzEiS6XF3kyB2Fc0GZ6ydruDWw=;
        b=BCu30RifBR+3AUaSh6SqCFauWT/11iG2IKFsNlY8QnF3El+C4Hldxh3dWR6Qzibgwd
         u7k5toaxLO/I/8W7Y3F+JgBgyP1Oy5ybxkmlRr9UjZFmSMn3abnEj0/ycNMlu6RIWo95
         DqMDgFmNpU4SAGYrgY/E5dl91AuR0nT+No1BwCj2ie8s+r/1EQhbhqwXJPfymzl32Fi2
         us//ORzP2knN1r1yGjpwXrZAvTr+ihAawVOV3jefsKpJiRPcTSEapewldl5oX33A6c9d
         Gcfy7zWBsmYZsUiNFwWVd3/mksbzZL9RAF1NZEd0DayTe5A33CVcYD0VNbOEX/mjeJys
         gjvg==
X-Gm-Message-State: AOAM533TxADGUx7L4bSNy94eA+zfdEm1dbMlQXuO+DxOWY2lhuUXFOrR
        6Nzvpu0U51xDbUvctor+CN4gRmqadhuJm3XuGBmIqyA/m/QwTMw9MkqjlbTaKZ0RfnG+XrVshdA
        QceNSU5TWnbKr0+ftMR7nMHeEUDp4P2BKFnkv0CtzjHvASFV+
X-Received: by 2002:aa7:cd83:: with SMTP id x3mr23871126edv.373.1618820256546;
        Mon, 19 Apr 2021 01:17:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrRRvmlGCkxx4tXzhKQpNcCtZtp5i5u5JPY0gywyHuqwKmdgiNtXRNYyjndMc/zdrzzTv4fQ==
X-Received: by 2002:aa7:cd83:: with SMTP id x3mr23871118edv.373.1618820256448;
        Mon, 19 Apr 2021 01:17:36 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id da13sm12384781edb.6.2021.04.19.01.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 01:17:36 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 6/7] mfd: wm831x: Correct kerneldoc
Date:   Mon, 19 Apr 2021 10:17:25 +0200
Message-Id: <20210419081726.67867-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419081726.67867-1-krzysztof.kozlowski@canonical.com>
References: <20210419081726.67867-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Correct kerneldoc function name to fix W=1 warning:

  drivers/mfd/wm831x-core.c:121: warning:
    expecting prototype for wm831x_reg_unlock(). Prototype was for wm831x_reg_lock() instead

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/mfd/wm831x-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/wm831x-core.c b/drivers/mfd/wm831x-core.c
index bcef08f58fb3..c31809b17547 100644
--- a/drivers/mfd/wm831x-core.c
+++ b/drivers/mfd/wm831x-core.c
@@ -109,7 +109,7 @@ static int wm831x_reg_locked(struct wm831x *wm831x, unsigned short reg)
 }
 
 /**
- * wm831x_reg_unlock: Unlock user keyed registers
+ * wm831x_reg_lock: Unlock user keyed registers
  *
  * The WM831x has a user key preventing writes to particularly
  * critical registers.  This function locks those registers,
-- 
2.25.1

