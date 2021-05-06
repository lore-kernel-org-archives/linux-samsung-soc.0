Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF9EC43461
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 May 2021 20:29:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A89A6112F
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 May 2021 20:29:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbhEFUak (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 6 May 2021 16:30:40 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:49231 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233770AbhEFUaj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 May 2021 16:30:39 -0400
Received: from mail-qk1-f200.google.com ([209.85.222.200])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lekcu-0001dC-E2
        for linux-samsung-soc@vger.kernel.org; Thu, 06 May 2021 20:29:40 +0000
Received: by mail-qk1-f200.google.com with SMTP id g184-20020a3784c10000b02902e385de9adaso4357514qkd.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 May 2021 13:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QaN2sKrS+2gNp66ooV3kIZkyoZhndv/BbfpM71H4E2s=;
        b=BaUJl1I8RHocm0ltwwiCF3KQOo9ERFl18N/Y+uPy8yCy/lB4rrtWkcLJRnOseIzbQD
         oO48DnY2Zcs4182CuEicuL/vvaHfIdhZGA0Az9pxtXLHKKwZP2UpkTLTBW+A6bkMSk6X
         fUmt0Gvmlhs0JHaMXBbI6g2uEOboEoO32K9aRpcGuMeInlu34t80U19Or5x6ILraJIJ/
         /LENwrl6UrXQl+8NdVfYGFkH5zWJk+hPeKYXIER+bBmslblqinS+h5Zh8iop0H4ygM5g
         DrQ2KTdIKpBG3OAQrASGF46Bu+PtbaVdYQwZCBixH2p/9GGHi03HZSlOcSGcqiQUlo+m
         I2dg==
X-Gm-Message-State: AOAM533puxyqJLwNJi2f2EuemU+g8jzhdpeNtzy7TV3qhlHu3isEtsrG
        EdMjgnaXFmC6n22IIJbKJn4bCC6PWmnAVkv5YegP4pncpQsI8WZWeWNuu2ntk3kVWIS6jJozUuJ
        QwOpmBLg6DWMaFLo/DWmH3RjOWZ44U4pBfq2DNYn0Khe24+V7
X-Received: by 2002:a05:620a:4081:: with SMTP id f1mr5956455qko.203.1620332979446;
        Thu, 06 May 2021 13:29:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzapbevGV176ziXFWsYiPHEgdYz4M/VREvFTBrCMRIegcj3hsTKcp6weSBOfIpotKXfoR086A==
X-Received: by 2002:a05:620a:4081:: with SMTP id f1mr5956445qko.203.1620332979286;
        Thu, 06 May 2021 13:29:39 -0700 (PDT)
Received: from localhost.localdomain ([45.237.49.6])
        by smtp.gmail.com with ESMTPSA id r9sm3151363qtf.62.2021.05.06.13.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 13:29:38 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 4/5] clocksource/drivers/samsung_pwm: Constify source IO memory
Date:   Thu,  6 May 2021 16:27:28 -0400
Message-Id: <20210506202729.157260-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210506202729.157260-1-krzysztof.kozlowski@canonical.com>
References: <20210506202729.157260-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The 'source_reg' IO memory is only read, so the pointer can point to
const for safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/clocksource/samsung_pwm_timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/samsung_pwm_timer.c b/drivers/clocksource/samsung_pwm_timer.c
index 55e2f9fa2a15..6e46781bc9ac 100644
--- a/drivers/clocksource/samsung_pwm_timer.c
+++ b/drivers/clocksource/samsung_pwm_timer.c
@@ -61,7 +61,7 @@ EXPORT_SYMBOL(samsung_pwm_lock);
 
 struct samsung_pwm_clocksource {
 	void __iomem *base;
-	void __iomem *source_reg;
+	const void __iomem *source_reg;
 	unsigned int irq[SAMSUNG_PWM_NUM];
 	struct samsung_pwm_variant variant;
 
-- 
2.25.1

