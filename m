Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C44FC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 28 Oct 2021 18:35:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D2A761040
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 28 Oct 2021 18:35:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231345AbhJ1SiI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 28 Oct 2021 14:38:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231299AbhJ1SiF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 Oct 2021 14:38:05 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2737CC061570
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Oct 2021 11:35:38 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id b32so12325711lfv.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Oct 2021 11:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xUHzXfSH6odzUwHjMxG39dfwoppvALDIvwNfLlmnrkU=;
        b=wJRcnTKnS0oB3tuyMNi3MchugAm1UQkIqMWn7RLhGZz7lxsCJMRud0nZnZBTKA6ukH
         GVcd2zcrzdpEWR6TJn14ufk+EP/jAHQEYsBKURSmUhvWztsYlD40qN+xIGlvH9Yzryi3
         /LygQtXCq1fJ29IjxjPuaP3ZjR9Uctkiq2r+539sZULG2UTyGkNWB4GFqWLpUMkMdxcu
         r4TUoL+A5eoSBtrbd7hOOv2VhxeS9f7BSEf+T3FhWJ7XB87DzU9pazOOEoZQl8A7vDpe
         XW2AupDG+sspfNbfqckQ/QhAzGxMMRw0ADWFLvp7y9EHaF12GtYPxqd6pQlyTQcki55i
         lMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xUHzXfSH6odzUwHjMxG39dfwoppvALDIvwNfLlmnrkU=;
        b=crrTEHE4sFYTJiNq9giy2YpU64aFqPMUGfaBN8yUO+HYdV2NbGMplWAE+l/E52b+zX
         BCZFQIg/DUseFMPu1nFYDUqlgLmqHp7Nn68to1/zCn36baCg571qdJP6gLQ9W7x0Hr3s
         l79TFVDCsIgE8UT4P3rXSulwee8sAUwJYjpi43ZHICmGN41u9SowDTHYxC2xUW4dlcI8
         3tIKtgUN9M0qCL+6fi3Wh7ly9eh3OAdTm14LnXv0vBBlMU2O8g4QNnEUg3jVOX5AeAcY
         KOnnvHomLVp1MiKMIYd364vI4PknvHtTvJ2geg0z2Y4EsAigjzbMNlENXTupJXtNCsqr
         1uPw==
X-Gm-Message-State: AOAM5322C8aGLpkt+CdnXLCtW8MjkU8Dx/b7+8A2npZxn35CQwmhglOo
        WB14jM52YwH9hoSYE3vjaH+wIA==
X-Google-Smtp-Source: ABdhPJxvOfUnubHbOQBtOfqnhkAp5qCfbvmGIdv2MB6mRaKsShfIi0eO9rlvaJpR0LCa7PBU/1K19Q==
X-Received: by 2002:ac2:4bc2:: with SMTP id o2mr5615126lfq.307.1635446136411;
        Thu, 28 Oct 2021 11:35:36 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id g18sm434306lfr.120.2021.10.28.11.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 11:35:36 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 5/7] watchdog: s3c2410: Introduce separate source clock
Date:   Thu, 28 Oct 2021 21:35:25 +0300
Message-Id: <20211028183527.3050-6-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211028183527.3050-1-semen.protsenko@linaro.org>
References: <20211028183527.3050-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Some Exynos chips (like Exynos850) have dedicated source clock. That
clock is provided from device tree as "watchdog_src" clock. In such
case, "watchdog" clock is just a peripheral clock used for register
interface. If "watchdog_src" is present, use its rate instead of
"watchdog" for all timer related calculations.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/watchdog/s3c2410_wdt.c | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index a5ef7171a90e..bfc5872ca497 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -126,6 +126,8 @@ struct s3c2410_wdt_variant {
 struct s3c2410_wdt {
 	struct device		*dev;
 	struct clk		*clock;
+	struct clk		*clock_src;
+	unsigned long		freq_src;
 	void __iomem		*reg_base;
 	unsigned int		count;
 	spinlock_t		lock;
@@ -213,10 +215,8 @@ MODULE_DEVICE_TABLE(platform, s3c2410_wdt_ids);
 
 /* functions */
 
-static inline unsigned int s3c2410wdt_max_timeout(struct clk *clock)
+static inline unsigned int s3c2410wdt_max_timeout(unsigned long freq)
 {
-	unsigned long freq = clk_get_rate(clock);
-
 	return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX + 1)
 				       / S3C2410_WTCON_MAXDIV);
 }
@@ -364,7 +364,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 				    unsigned int timeout)
 {
 	struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd);
-	unsigned long freq = clk_get_rate(wdt->clock);
+	unsigned long freq = wdt->freq_src;
 	unsigned int count;
 	unsigned int divisor = 1;
 	unsigned long wtcon;
@@ -627,13 +627,27 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/* "watchdog_src" clock is optional; if it's not present -- just skip */
+	wdt->clock_src = devm_clk_get(dev, "watchdog_src");
+	if (!IS_ERR(wdt->clock_src)) {
+		ret = clk_prepare_enable(wdt->clock_src);
+		if (ret < 0) {
+			dev_err(dev, "failed to enable source clock\n");
+			ret = PTR_ERR(wdt->clock_src);
+			goto err_clk;
+		}
+		wdt->freq_src = clk_get_rate(wdt->clock_src);
+	} else {
+		wdt->freq_src = clk_get_rate(wdt->clock);
+	}
+
 	wdt->wdt_device.min_timeout = 1;
-	wdt->wdt_device.max_timeout = s3c2410wdt_max_timeout(wdt->clock);
+	wdt->wdt_device.max_timeout = s3c2410wdt_max_timeout(wdt->freq_src);
 
 	ret = s3c2410wdt_cpufreq_register(wdt);
 	if (ret < 0) {
 		dev_err(dev, "failed to register cpufreq\n");
-		goto err_clk;
+		goto err_clk_src;
 	}
 
 	watchdog_set_drvdata(&wdt->wdt_device, wdt);
@@ -707,6 +721,10 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
  err_cpufreq:
 	s3c2410wdt_cpufreq_deregister(wdt);
 
+ err_clk_src:
+	if (!IS_ERR(wdt->clock_src))
+		clk_disable_unprepare(wdt->clock_src);
+
  err_clk:
 	clk_disable_unprepare(wdt->clock);
 
@@ -727,6 +745,9 @@ static int s3c2410wdt_remove(struct platform_device *dev)
 
 	s3c2410wdt_cpufreq_deregister(wdt);
 
+	if (!IS_ERR(wdt->clock_src))
+		clk_disable_unprepare(wdt->clock_src);
+
 	clk_disable_unprepare(wdt->clock);
 
 	return 0;
-- 
2.30.2

