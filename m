Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F0AC47089
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 May 2021 17:21:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29BEA613BF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 May 2021 17:21:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234884AbhEZRXE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 26 May 2021 13:23:04 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:36773 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234892AbhEZRWd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 May 2021 13:22:33 -0400
Received: from mail-vs1-f70.google.com ([209.85.217.70])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1llxDI-0003ap-S8
        for linux-samsung-soc@vger.kernel.org; Wed, 26 May 2021 17:21:00 +0000
Received: by mail-vs1-f70.google.com with SMTP id d19-20020a0561020413b029023877d74e72so551694vsq.15
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 May 2021 10:21:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SNm8r3qL/2kiXiJIVKuFq4DIG33CzdI9IizzknKRELw=;
        b=H62gajGKzZH7sz1wu7qU/C4JBPVf2LYxbxT7G2cjGuj/ZldIXSNJDZdtzgIPJaQhun
         2qiMAKRQqlxE5vuegP8d35ZWXOYVA6NFVH2pWZ/Hu4n/JKEuS402hJ8V7QVM8lb0ieeC
         lxdpkZfXiPKcyvk8lntFAJVAazVilLxB03OsJJaKXCoRNhpzAucwmVTSShzP4Onwm6J/
         wZcooav57k2Gq2sPuSNvyy4dcL739Mcg4OKWTHf8FrfUTXrETAqjm3m6V+lBZn9uYupQ
         B9NNXsfqwOXhmDlPXiv48TtCvr/y725e/CG2kl0M1MBBQmygZS12hGdaMRqa/oiFX4nn
         rPCg==
X-Gm-Message-State: AOAM533yPIApIvApMbIF53fkKI3ioQQ9y7bbL0dtllRGsLROHeLaRtwv
        68RwK04H1Fz3HkaRQoGb7Z7pnxxKS6BUshKdgD+1MJjFqRQc4OiZHWNXDEJE55RCfZa/ljXxKro
        8BcZgcRK/6hIceN+0ilt3ZRtML12Z30FfemHrwSFyw8oMmRou
X-Received: by 2002:ab0:6d8c:: with SMTP id m12mr21071476uah.49.1622049659957;
        Wed, 26 May 2021 10:20:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKbreCdzxPHok0y1tVuHyOgZULUrZT2VgOqfxTb2af4jPjxbiLuaf5zi62GiVO/GnTLXh37w==
X-Received: by 2002:ab0:6d8c:: with SMTP id m12mr21071448uah.49.1622049659760;
        Wed, 26 May 2021 10:20:59 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.6])
        by smtp.gmail.com with ESMTPSA id u195sm2036032vsc.10.2021.05.26.10.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 10:20:58 -0700 (PDT)
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
Subject: [PATCH v2 5/7] rtc: max77686: Do not enforce (incorrect) interrupt trigger type
Date:   Wed, 26 May 2021 13:20:34 -0400
Message-Id: <20210526172036.183223-6-krzysztof.kozlowski@canonical.com>
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

The Maxim 77686 datasheet describes the interrupt line as active low
with a requirement of acknowledge from the CPU therefore the edge
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
 drivers/rtc/rtc-max77686.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index d51cc12114cb..eae7cb9faf1e 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -717,8 +717,8 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 
 add_rtc_irq:
 	ret = regmap_add_irq_chip(info->rtc_regmap, info->rtc_irq,
-				  IRQF_TRIGGER_FALLING | IRQF_ONESHOT |
-				  IRQF_SHARED, 0, info->drv_data->rtc_irq_chip,
+				  IRQF_ONESHOT | IRQF_SHARED,
+				  0, info->drv_data->rtc_irq_chip,
 				  &info->rtc_irq_data);
 	if (ret < 0) {
 		dev_err(info->dev, "Failed to add RTC irq chip: %d\n", ret);
-- 
2.27.0

