Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 124BBC43217
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 31 Oct 2021 12:22:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EAA6860F4A
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 31 Oct 2021 12:22:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232191AbhJaMZQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 31 Oct 2021 08:25:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232268AbhJaMZI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 31 Oct 2021 08:25:08 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8C3AC0613F5
        for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Oct 2021 05:22:36 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id r4so54300864edi.5
        for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Oct 2021 05:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CjpiH6HuPcd1OZ5BrMJwTEc3/gsNQvS0PrQ1dEXc7Io=;
        b=or2lHaDsNVVO97zwHRkP4RiBFYuiraV70N1/LgQ0wBFr/Jdu1hwpC8WqHfM7NB0lRA
         HTr1bh7UKWsSBsQcnvSQy7Uts9tVANJluWUUh7djar9CWrXIwwb/AM+BS9nipcVMH3jL
         8bGK5tMf7lOUnknCjytvXq3W4UNxI/sl6EKM4MdAVqkkirxkgOyEXGcvE/TvW0xGQlDJ
         x8Fa0skSt9WXiqFCX5QApaYQtk4vuuMZIRLXPils/GVCecFhkbb4H2MYTfPL6H3sefqw
         GLz16sJNaK1xqThxpMTAvFkwEiVVkyq0eezaihiXG+23304BBgWK+o7P2X55sBuQVrVU
         3JVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CjpiH6HuPcd1OZ5BrMJwTEc3/gsNQvS0PrQ1dEXc7Io=;
        b=09LL2kND4spJvSDi737qLghAHPotICcWgpNycCowpFIabCS1oUWJVfQASGhObEYR/w
         HEY22UJ32ak5E1pOKjn6Ohe/MSWim7R6kAKRZwkDKwuS1fTOtJ+YTZnP5EwFhKfivKSI
         xhXBcrm7UvS+mRXUXV9oWgaEgFasZj/64weCkdtQ84Y5UrAICk17tv8y5av/eD9bqLcc
         yqwQ7BUxmeQorxK94gBiyuiAbuEJPzRJ6psi/zzHLK2a8gvCf5G7/QH1brkQoArzroWD
         MM3+V270TITLmu6s28agmzLgnUhuggfiXFU0wbftGd6WEP/w1PdjKOlFCIihQZR7AifW
         I/4g==
X-Gm-Message-State: AOAM5327G5RTAOaLCNf51titPUB9fd+qpTPxTS2WJbYxm4yjgr0Bh77r
        DgJN9Eu26M1AsuLJh4VJNbhM8A==
X-Google-Smtp-Source: ABdhPJy54Pbe/nTge52lDsP1R5TWLciCeqw8ibvHYioX2azue9qihln/nXwaVfizYOKVsWxi+KXwFg==
X-Received: by 2002:a17:907:3fa5:: with SMTP id hr37mr30507519ejc.417.1635682955297;
        Sun, 31 Oct 2021 05:22:35 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id m12sm3994046ejj.63.2021.10.31.05.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 05:22:34 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 11/12] watchdog: s3c2410: Remove superfluous err label
Date:   Sun, 31 Oct 2021 14:22:15 +0200
Message-Id: <20211031122216.30212-12-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211031122216.30212-1-semen.protsenko@linaro.org>
References: <20211031122216.30212-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

'err' label in probe function is not really need, it just returns.
Remove it and replace all 'goto' statements with actual returns in
place.

No functional change here, just a cleanup patch.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - (none): it's a new patch

 drivers/watchdog/s3c2410_wdt.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index c733917c5470..8fdda2ede1c3 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -588,22 +588,18 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	wdt_irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (wdt_irq == NULL) {
 		dev_err(dev, "no irq resource specified\n");
-		ret = -ENOENT;
-		goto err;
+		return -ENOENT;
 	}
 
 	/* get the memory region for the watchdog timer */
 	wdt->reg_base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(wdt->reg_base)) {
-		ret = PTR_ERR(wdt->reg_base);
-		goto err;
-	}
+	if (IS_ERR(wdt->reg_base))
+		return PTR_ERR(wdt->reg_base);
 
 	wdt->bus_clk = devm_clk_get(dev, "watchdog");
 	if (IS_ERR(wdt->bus_clk)) {
 		dev_err(dev, "failed to find bus clock\n");
-		ret = PTR_ERR(wdt->bus_clk);
-		goto err;
+		return PTR_ERR(wdt->bus_clk);
 	}
 
 	ret = clk_prepare_enable(wdt->bus_clk);
@@ -720,7 +716,6 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
  err_bus_clk:
 	clk_disable_unprepare(wdt->bus_clk);
 
- err:
 	return ret;
 }
 
-- 
2.30.2

