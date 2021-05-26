Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5667BC47088
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 May 2021 17:21:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 39C4F611B0
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 May 2021 17:21:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235096AbhEZRXI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 26 May 2021 13:23:08 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:36791 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235110AbhEZRWg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 May 2021 13:22:36 -0400
Received: from mail-ua1-f70.google.com ([209.85.222.70])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1llxDL-0003cf-9u
        for linux-samsung-soc@vger.kernel.org; Wed, 26 May 2021 17:21:03 +0000
Received: by mail-ua1-f70.google.com with SMTP id y10-20020ab025ca0000b0290221adb2995aso1101754uan.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 May 2021 10:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GmEoQJnYyHa6LUU8eDJ5U1vBJGHUMr9Q2pgbu4Jz5Pw=;
        b=I35idiQljLl6dMLdNDm7BTytcMdLXunqa9Tj/QR54Kzk9tb6fitouQScABMAn0jHOH
         QQNHwNAV1bVdiW22yUejDeFXC+kwq6a404QCCi34ht9J5XJ7hz+2jKzyYMNiuFzPrS/z
         NFX1rMHIr8tw8a5En7p3ATHie7sI72OeJ36uRg79oLIDkVswibGp+Ssu3HFUVnFL/7c1
         Wfs6J4ZmlX3vFue9wSdXcgb5/j9jq5O6o7JhnerKNelx9BPR10R5kTTuG9r9eQE5avl1
         GYR2Q2I5Ot2oZVe5p/7jiRBJ3Xxo3V9au3H4quTSndMv7LPhwiefm5P/HMbHpEsU0b5J
         4eqg==
X-Gm-Message-State: AOAM532XJMK9JEF9Tk3QrXae3JsYU+mnEKyXmkEcTVkgWWLotm7dtX8m
        vPcVUsblNE5K6V5coER2tndtoa0q4xq70Fm52dDnpHtCUAKfLcYaRWec2vl/rcis2cHF2QquJaV
        a2qdWsh0rrRk5W/mI1HpAOFd/EfP/c6S9qe+Ola6vTnTOWqYY
X-Received: by 2002:a05:6102:124d:: with SMTP id p13mr32602217vsg.58.1622049662242;
        Wed, 26 May 2021 10:21:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9xh7stKNjLHMO5aPJf5U1x+d8xsFxY3fMgzBN4TM4e3umiNoUIJM1/Sf2sd3i0ilvlipGjw==
X-Received: by 2002:a05:6102:124d:: with SMTP id p13mr32602180vsg.58.1622049661974;
        Wed, 26 May 2021 10:21:01 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.6])
        by smtp.gmail.com with ESMTPSA id u195sm2036032vsc.10.2021.05.26.10.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 10:21:01 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 6/7] power: supply: max17042: Do not enforce (incorrect) interrupt trigger type
Date:   Wed, 26 May 2021 13:20:35 -0400
Message-Id: <20210526172036.183223-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210526172036.183223-1-krzysztof.kozlowski@canonical.com>
References: <20210526172036.183223-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Krzysztof Kozlowski <krzk@kernel.org>

Interrupt line can be configured on different hardware in different way,
even inverted.  Therefore driver should not enforce specific trigger
type - edge falling - but instead rely on Devicetree to configure it.

The Maxim 17047/77693 datasheets describe the interrupt line as active
low with a requirement of acknowledge from the CPU therefore the edge
falling is not correct.

The interrupt line is shared between PMIC and RTC driver, so using level
sensitive interrupt is here especially important to avoid races.  With
an edge configuration in case if first PMIC signals interrupt followed
shortly after by the RTC, the interrupt might not be yet cleared/acked
thus the second one would not be noticed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. None
---
 drivers/power/supply/max17042_battery.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/supply/max17042_battery.c
index 1d7326cd8fc6..ce2041b30a06 100644
--- a/drivers/power/supply/max17042_battery.c
+++ b/drivers/power/supply/max17042_battery.c
@@ -1104,7 +1104,7 @@ static int max17042_probe(struct i2c_client *client,
 	}
 
 	if (client->irq) {
-		unsigned int flags = IRQF_TRIGGER_FALLING | IRQF_ONESHOT;
+		unsigned int flags = IRQF_ONESHOT;
 
 		/*
 		 * On ACPI systems the IRQ may be handled by ACPI-event code,
-- 
2.27.0

