Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE60FC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 31 Oct 2021 12:22:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A914E60FD9
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 31 Oct 2021 12:22:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232113AbhJaMY7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 31 Oct 2021 08:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232003AbhJaMY4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 31 Oct 2021 08:24:56 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C8A2C061714
        for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Oct 2021 05:22:24 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 5so53958687edw.7
        for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Oct 2021 05:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0LUH2HE+DObDDa+0/bVUP0x0dgiM7xbHhZeI9PRXmTM=;
        b=Cp88x8sH2oXNfg1YPAJ/EuVoi0u6HqOodpv2i/+iUuEYwacfXPz+eDG1hxE+PcoN0B
         cVV3Kt7ROgM3ZQzSbOoOAiQNuXxq8GS8pSm8dLZEbJENUwwiioejAiW7x3KSWCQuvn9B
         H4A1/zzYdUqBr0bmRWyhw+HuawLCPLDK0kSv4R39DTiyEgxocU1KrzKT+p+hinA8u2xa
         1asqZjaURvCdyP7eUCJkxQf3axMNRCH7YwsgcedWQUU4Dey5mh+zmEJlF5E29WRK6tMx
         Cyw7M/1fhcuFnaUkOq2uHcR+xup8tFLgfPmlCoClZGST4Z5UzGTGo4fGOdMWfw2q5EgK
         QLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0LUH2HE+DObDDa+0/bVUP0x0dgiM7xbHhZeI9PRXmTM=;
        b=UpiqTxQTglGLeeFiNXkgE9Vuu3iB/nndcBXy4TL94oB+NwPYrrDSEZcjeqR80DcqYX
         0tL3dFt0BRLpOeu1XaK8YWg0KlDQy9fNYVxk0oOAPSmvHzA2z2bonv9Ie5L5lBvXX3Rl
         OFko980229WA2qBBt4npzHJda0QAX4A9VTo/+R2vK6BBXrJx0dTuZxRybWbNnRk7sn49
         OZk0Db7/q4W3YPnzjvd9ksXyWmme5tiztef9c/2g5i71xkTABGiN+Cz6GfO0X3QfTMgm
         0heRNbDFoaR73iLpjLVdSxDd7yd8Tu/o7505rTz/liRb4QPOEXTTCYuDZ0SY/VOohKwx
         Hpdg==
X-Gm-Message-State: AOAM532PBJBhsdin148BklnnzykPfB/rYDJltbcD928cxnTN7M575vqr
        tQfMvc0Mo8vojgbKw5ybDxdm5Q==
X-Google-Smtp-Source: ABdhPJwP+u2vVLuKYJ5Gvbql/raX+M8tVHbJ1iMDgNZHF47ZnKj0KDBHhZtqkqxJjrhe8MqDn4Dv4Q==
X-Received: by 2002:a05:6402:34d1:: with SMTP id w17mr32011414edc.383.1635682942744;
        Sun, 31 Oct 2021 05:22:22 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id de36sm3701120ejc.54.2021.10.31.05.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 05:22:22 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 03/12] watchdog: s3c2410: Fail probe if can't find valid timeout
Date:   Sun, 31 Oct 2021 14:22:07 +0200
Message-Id: <20211031122216.30212-4-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211031122216.30212-1-semen.protsenko@linaro.org>
References: <20211031122216.30212-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Driver can't work properly if there no valid timeout was found in
s3c2410wdt_set_heartbeat(). Ideally, that function should be reworked in
a way that it's always able to find some valid timeout. As a temporary
solution let's for now just fail the driver probe in case the valid
timeout can't be found in s3c2410wdt_set_heartbeat() function.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - (none): it's a new patch

 drivers/watchdog/s3c2410_wdt.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 2395f353e52d..00421cf22556 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -515,7 +515,6 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	struct s3c2410_wdt *wdt;
 	struct resource *wdt_irq;
 	unsigned int wtcon;
-	int started = 0;
 	int ret;
 
 	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
@@ -581,15 +580,15 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	ret = s3c2410wdt_set_heartbeat(&wdt->wdt_device,
 					wdt->wdt_device.timeout);
 	if (ret) {
-		started = s3c2410wdt_set_heartbeat(&wdt->wdt_device,
-					S3C2410_WATCHDOG_DEFAULT_TIME);
-
-		if (started == 0)
-			dev_info(dev,
-				 "tmr_margin value out of range, default %d used\n",
+		ret = s3c2410wdt_set_heartbeat(&wdt->wdt_device,
+					       S3C2410_WATCHDOG_DEFAULT_TIME);
+		if (ret == 0) {
+			dev_warn(dev, "tmr_margin value out of range, default %d used\n",
 				 S3C2410_WATCHDOG_DEFAULT_TIME);
-		else
-			dev_info(dev, "default timer value is out of range, cannot start\n");
+		} else {
+			dev_err(dev, "failed to use default timeout\n");
+			goto err_cpufreq;
+		}
 	}
 
 	ret = devm_request_irq(dev, wdt_irq->start, s3c2410wdt_irq, 0,
@@ -613,10 +612,10 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_unregister;
 
-	if (tmr_atboot && started == 0) {
+	if (tmr_atboot) {
 		dev_info(dev, "starting watchdog timer\n");
 		s3c2410wdt_start(&wdt->wdt_device);
-	} else if (!tmr_atboot) {
+	} else {
 		/* if we're not enabling the watchdog, then ensure it is
 		 * disabled if it has been left running from the bootloader
 		 * or other source */
-- 
2.30.2

