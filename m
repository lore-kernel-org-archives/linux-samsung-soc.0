Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C7ECC4321E
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 21 Nov 2021 16:57:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238337AbhKURAH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 21 Nov 2021 12:00:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238366AbhKURAB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 21 Nov 2021 12:00:01 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0270C061574
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Nov 2021 08:56:55 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id bi37so69182065lfb.5
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Nov 2021 08:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=avAIqxonoUpxUgZ8evBQJpwJeOjfCUq9oOQFKLq1vLw=;
        b=l8/nixacKiaxqNeKCxYAE0IUTq5hEDB8TTXvtvby/62PVSbNYfYY6252ILQpVGtR7i
         sbemH3A5gPoGfbrUD6LEW5wIvv6tC1kb1A0t7BeDEdUIMRdwCB1hjNGnjc+9H9rCRsNk
         DXXISrdJn5HHIZXbdLJHiG7Y9ItMeM9TZ/ES3JmOx0e9G2qGzUZuOSe92a6M6u1aOFXF
         R22l12gpRGIxgeJkSiXfNQEeK9ADL6+2q2qrx6U5YawFgqS88WzYpaQkcQoT9LLaob7N
         eOcCpXMC44QyGjOw6QQmYqcDhm4wHPqsDR75s6Mh7apWxp9VUt9JGFwMxszPSsQmLQuf
         wyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=avAIqxonoUpxUgZ8evBQJpwJeOjfCUq9oOQFKLq1vLw=;
        b=Bfp+MARPuMgvjtKcpf0uAfIj8k2xlFUEukHj3eSHGK55a/CzCqmghqjWJTIFaUZMe7
         C8Kaf+XZrgHjGuVsHMdGA7Uc21ztg1RUjYP/ZGdWmlX8syPqs4o6B0iYo/6x73s4Czzf
         yGAL6R/J02Nj2xtF/1WVTdIScZILO3WULVo42zNm5++v5H/KQz2ULxd68DgGVd904bZt
         acLmnGAyEmfI8ki2nZSlIPZZ20JPp3C1JWIB1/0lIBWsZyrDZEMrNCfnciq2DUF3iEcA
         ps1RZ1Dt4WFDLSigP3ZTnrQy4RLlR/kyJ9fBXrZCgBUbdr6d9/2tmPNQNOKGA9mKfKjK
         gQuQ==
X-Gm-Message-State: AOAM531OkZohqGTt4prJAseML1kwIo+vs0LgyLG8ivs8EEu+OdHYiVND
        8tY9IW0c23IYokk+6zj07QckfQ==
X-Google-Smtp-Source: ABdhPJwYEKjZatumNr73KLVhsFjF7ggTEf2VUTH3bcl9kKsPaJy+T2FEelvbOp4Uw4qCh4SilM5EBQ==
X-Received: by 2002:a05:651c:2dd:: with SMTP id f29mr44338195ljo.464.1637513814116;
        Sun, 21 Nov 2021 08:56:54 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id s15sm688642lfp.252.2021.11.21.08.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 08:56:53 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v4 03/12] watchdog: s3c2410: Fail probe if can't find valid timeout
Date:   Sun, 21 Nov 2021 18:56:38 +0200
Message-Id: <20211121165647.26706-4-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211121165647.26706-1-semen.protsenko@linaro.org>
References: <20211121165647.26706-1-semen.protsenko@linaro.org>
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

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reported-by: Guenter Roeck <linux@roeck-us.net>
Suggested-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
Changes in v4:
  - Added R-b tag by Guenter Roeck

Changes in v3:
  - Added R-b tag by Krzysztof Kozlowski

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

