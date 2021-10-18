Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 827E7C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 18 Oct 2021 17:32:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5DF7260230
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 18 Oct 2021 17:32:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233102AbhJRReQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 18 Oct 2021 13:34:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232211AbhJRReQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 18 Oct 2021 13:34:16 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAC38C061745
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Oct 2021 10:32:04 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id i20so2059059edj.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Oct 2021 10:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QcXTMSle67F0iHj+mrkZMW1lH8e/zEdbzDB64MF3Hvs=;
        b=BcVd61Rq2NCn1GxP94JH5rzt+AoQTkkFGmeW2+2+kB5BdxHQWQhk8jgkdZACBlX80Z
         hsQV+dyxwly5rGw+mlzWvn+jSYY8F4tnMfXvcDF0r/D9j4BzHX+8mEh0dPF4nhQOIWZc
         GStKXraJtspGVDzioSG5ffyRhB3Kyt8UQxXPrpCLfQPB1X2FFKZ8KOBiDLFr3b1mMotY
         dRsA2DSasWR/FI/TtfXdgu8ouMht07sF612sGQA5teORLVfVNe5jznmU3TPIwRxugyXx
         QpnTqGi/j0sw8C9mXF65w1ypJPjloAo6655lcAZRsyvPVyfxof0LDnF5hHLftbCt4Bb0
         wnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QcXTMSle67F0iHj+mrkZMW1lH8e/zEdbzDB64MF3Hvs=;
        b=6ew3TKbijyfUX0Kk+pcWW4gTVWsSsUJA/ZZg3WC9EZESJMnS+8EAzprbx8M1VUkuTp
         tVdtRUFw/FOCjYxwY5Mt7jEa1ZdXjZe4RbKlL4ZD5aU3yig4f4+jP4lQZsVzFHXs186B
         IudNEyUpD5B2gYeyA6y9xWX3WnGBngNdcIvl46r5B9xUYmqhS0EvSZYHyr59SK3XrL+x
         3pGa9P9mc0UhqjnlEsaiya/03i4sfwkSpv7P8l5s5KZJbVEd12+fcPyWWOhtueAhrRhC
         pERh946W0UXWR9AwwrgvCHbre434BUcyyfMDvkaAi4oqMWP3FejRE80AAH/vNnN1pT0k
         xhBw==
X-Gm-Message-State: AOAM533kXO6WEfog3GHkqQeQdFRh7W2RikOTN8IWl3Pd6FVy63gK61mu
        jQy3jGHZL91GrSjPHMz/O4cxLQ==
X-Google-Smtp-Source: ABdhPJzrkfb8ujNn/nq10hWyW0cvZvpMkMTTpEmtgWG+N17RxIsfLFDczErL+gitqi6RrdEPrHUgqQ==
X-Received: by 2002:a05:6402:2808:: with SMTP id h8mr46571650ede.394.1634578323076;
        Mon, 18 Oct 2021 10:32:03 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id m3sm1244049edc.11.2021.10.18.10.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 10:32:02 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: s3c: Remove usage of devm_rtc_device_register()
Date:   Mon, 18 Oct 2021 20:32:01 +0300
Message-Id: <20211018173201.2166-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

devm_rtc_device_register() is deprecated. Use devm_rtc_allocate_device()
and devm_rtc_register_device() API instead.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/rtc/rtc-s3c.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index e57d3ca70a78..10e591794276 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -447,15 +447,18 @@ static int s3c_rtc_probe(struct platform_device *pdev)
 
 	device_init_wakeup(&pdev->dev, 1);
 
-	/* register RTC and exit */
-	info->rtc = devm_rtc_device_register(&pdev->dev, "s3c", &s3c_rtcops,
-					     THIS_MODULE);
+	info->rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(info->rtc)) {
-		dev_err(&pdev->dev, "cannot attach rtc\n");
 		ret = PTR_ERR(info->rtc);
 		goto err_nortc;
 	}
 
+	info->rtc->ops = &s3c_rtcops;
+
+	ret = devm_rtc_register_device(info->rtc);
+	if (ret)
+		goto err_nortc;
+
 	ret = devm_request_irq(&pdev->dev, info->irq_alarm, s3c_rtc_alarmirq,
 			       0, "s3c2410-rtc alarm", info);
 	if (ret) {
-- 
2.30.2

