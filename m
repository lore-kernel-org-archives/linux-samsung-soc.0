Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D5C0C43460
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 May 2021 20:29:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29B4E6112F
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 May 2021 20:29:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233444AbhEFUah (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 6 May 2021 16:30:37 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:49220 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229951AbhEFUag (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 May 2021 16:30:36 -0400
Received: from mail-qk1-f197.google.com ([209.85.222.197])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lekcr-0001cE-LN
        for linux-samsung-soc@vger.kernel.org; Thu, 06 May 2021 20:29:37 +0000
Received: by mail-qk1-f197.google.com with SMTP id g184-20020a3784c10000b02902e385de9adaso4357440qkd.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 May 2021 13:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kr71HxmM9qcmrtqnZvjbEArHjJcDpTE8gEhMoKfplI8=;
        b=RQuWNSfi8dwOWdskX+sA3yhC55r3XYfJsrbyQ0AcmLdImfgm8galeKT3twp+vC105K
         kdhDYmUOyndskwaQKY6mmuLmStwGjiUurqQbX1zLuC9ejs4z2clWohjtYTW1RWRrNC0Q
         BfjDo41b6JF3KUgqhiMgNtomkqOhlGbDwTlxTiJWEaBKLbBwBzd5lhHRs3pWMNcW4crz
         Z2wcFxwd6AMduAcaaxnv+26NlJt5kEDPTFq9T2qkaBXG4gOsKBnWxxDC0NqlKbaN9O70
         HHiW5NZa3uJj7TeabJHWnMNLh8aE7XU1r5uQSfTMqN14ed+1yJps3ZG6mhU/mdjSFloW
         6y7g==
X-Gm-Message-State: AOAM532sEibPZHUsJ5b7xacwleHtfOHfxeWvNaF2mkADp5AMz0U0XogX
        sheEgznqQJF3AfPpFfypAM9iDlWTxFbFNrl1aJMWI7znc3vxiQu1Dds+QnMfwpP59nuRK4BmdHb
        le57HJyyS8KGRkyBn3hzGU81z5/z+i2rxkkrGPOlc5DlxIIbs
X-Received: by 2002:a05:622a:3cf:: with SMTP id k15mr5876574qtx.282.1620332976524;
        Thu, 06 May 2021 13:29:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyk3b8O3zAhrDM7x/cMI1eJVdxQMKUo6w7vmzjoPUcDq01NFnKYHmva7Zxpns1CqKXuC7HwQA==
X-Received: by 2002:a05:622a:3cf:: with SMTP id k15mr5876557qtx.282.1620332976322;
        Thu, 06 May 2021 13:29:36 -0700 (PDT)
Received: from localhost.localdomain ([45.237.49.6])
        by smtp.gmail.com with ESMTPSA id r9sm3151363qtf.62.2021.05.06.13.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 13:29:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 2/5] clocksource/drivers/samsung_pwm: Constify passed structure
Date:   Thu,  6 May 2021 16:27:26 -0400
Message-Id: <20210506202729.157260-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210506202729.157260-1-krzysztof.kozlowski@canonical.com>
References: <20210506202729.157260-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The 'struct samsung_pwm_variant' argument passed to initialization
functions is not modified, so it can be made const for safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/clocksource/samsung_pwm_timer.c | 2 +-
 include/clocksource/samsung_pwm.h       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/samsung_pwm_timer.c b/drivers/clocksource/samsung_pwm_timer.c
index 69bf79c7f462..bfad61b509f9 100644
--- a/drivers/clocksource/samsung_pwm_timer.c
+++ b/drivers/clocksource/samsung_pwm_timer.c
@@ -401,7 +401,7 @@ static int __init _samsung_pwm_clocksource_init(void)
 
 void __init samsung_pwm_clocksource_init(void __iomem *base,
 					 unsigned int *irqs,
-					 struct samsung_pwm_variant *variant)
+					 const struct samsung_pwm_variant *variant)
 {
 	pwm.base = base;
 	memcpy(&pwm.variant, variant, sizeof(pwm.variant));
diff --git a/include/clocksource/samsung_pwm.h b/include/clocksource/samsung_pwm.h
index 76341988fb4f..9b435caa95fe 100644
--- a/include/clocksource/samsung_pwm.h
+++ b/include/clocksource/samsung_pwm.h
@@ -28,6 +28,6 @@ struct samsung_pwm_variant {
 
 void samsung_pwm_clocksource_init(void __iomem *base,
 				  unsigned int *irqs,
-				  struct samsung_pwm_variant *variant);
+				  const struct samsung_pwm_variant *variant);
 
 #endif /* __CLOCKSOURCE_SAMSUNG_PWM_H */
-- 
2.25.1

