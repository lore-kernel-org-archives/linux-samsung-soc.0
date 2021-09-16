Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F27C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 16 Sep 2021 16:50:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2584663249
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 16 Sep 2021 16:50:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233342AbhIPQvd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 16 Sep 2021 12:51:33 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:58338
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243418AbhIPQrb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 16 Sep 2021 12:47:31 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E22DD40268
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Sep 2021 16:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631810769;
        bh=TkTHOhbG7+Cs8KGkPzHFU+IfRiM3V1/WUAdUOTTHlrE=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=mMnCA+/kscSnPsUCIRZcQEDwgBNdIn+/tSkJOdpsjzs8cBcXFuwXiJ1rPK4EAmZMW
         d4mEPwtk/B9uG6hJDPJcLCzWaQ+pnV/3hCZSCPItEz4A30teXdL4SjhG7039CPVx9T
         dj1nKM3W4cS8gL/J7Dw9NsqRhxfqMiQ1TxNLqgsUZDZh0NglnFBZuxg29J8V1ZJfdM
         etYcHe2u/E8UnEIUYUIr/9ZORIx7j9xGSexOw+8kO8pPlAiJVzsvGrpXZbJLfHH1cF
         ngkEXMJ3ONRlT8C3mcTSq2JAIESbIejwSeA6do/eJtcayrV2wDPBXgUwwmwpSIMNVY
         nAmZsla72X52g==
Received: by mail-wr1-f70.google.com with SMTP id x7-20020a5d6507000000b0015dada209b1so2661054wru.15
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Sep 2021 09:46:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TkTHOhbG7+Cs8KGkPzHFU+IfRiM3V1/WUAdUOTTHlrE=;
        b=MpXkrOSvbBAKyS9W20TFtqW2pZyehQM6fGzEIGSKwRSPeKuWicQGnkZpH2LXFuCZx5
         lqrtIfRnOZADApi3/mjfAx0ws5js0u4N1so1JktD7JOEQyhfVkpUZuXqBX74NZ6p2mzG
         dphJ8K3sIYZuVAmcLMprQEDVUZ+UqqUksA4hE/uwvsfDBVVrBD9G6YG0hNqGdCYB/qvT
         GOrYJ1crXwPA9cYPXoUIRprl81ofqDqr6a1ii1vbsU5m7hkSCTsOeOYbAqVSBCUjoiGX
         +LKxsTtgY/nbXJBWfvlXSsmOuujdCEgOINfQnYsSVwnYkiKGqvtTbYolxDSIYowVYey3
         LZ2g==
X-Gm-Message-State: AOAM530w+dKIeBPHWwS0w16V5WCS4/xCaYWA+cDvQpY0p9V+C6zpPDRV
        7TSIvNYaPmTzgHlqJV1j/CH3/muNSILFzDmFdeuqtNqAUJdzb5IKt17A3wdkDjvZLWFbZNlu5En
        ORhywUUyWLxoPA11vUuNi33Tvk0tZzOWHd9+V0lZkFa8ygCe9
X-Received: by 2002:a05:600c:4f0b:: with SMTP id l11mr10746890wmq.0.1631810769632;
        Thu, 16 Sep 2021 09:46:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyW+OkIKkP01ToiSTSOU4G0hJjjzBqvO2StScpKKfwwlhY9dJZUVxfnRqcLlXIIqO+lwZLbw==
X-Received: by 2002:a05:600c:4f0b:: with SMTP id l11mr10746871wmq.0.1631810769456;
        Thu, 16 Sep 2021 09:46:09 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id l21sm3718194wmh.31.2021.09.16.09.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 09:46:08 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 2/2] rtc: s5m: drop unneeded MODULE_ALIAS
Date:   Thu, 16 Sep 2021 18:46:04 +0200
Message-Id: <20210916164604.134924-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210916164513.134725-1-krzysztof.kozlowski@canonical.com>
References: <20210916164513.134725-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The MODULE_DEVICE_TABLE already creates proper alias for platform
driver.  Having another MODULE_ALIAS causes the alias to be duplicated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/rtc/rtc-s5m.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index fb9c6b709e13..4243fe6d3842 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -861,4 +861,3 @@ module_platform_driver(s5m_rtc_driver);
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
 MODULE_DESCRIPTION("Samsung S5M/S2MPS14 RTC driver");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:s5m-rtc");
-- 
2.30.2

