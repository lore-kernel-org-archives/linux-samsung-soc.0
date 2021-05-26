Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A1CC47088
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 May 2021 12:50:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94D946113D
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 May 2021 12:50:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234294AbhEZMwB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 26 May 2021 08:52:01 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56923 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234907AbhEZMt0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 May 2021 08:49:26 -0400
Received: from mail-vs1-f72.google.com ([209.85.217.72])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1llsx0-00010e-2Z
        for linux-samsung-soc@vger.kernel.org; Wed, 26 May 2021 12:47:54 +0000
Received: by mail-vs1-f72.google.com with SMTP id g13-20020a0561020ccdb029023fe9ce9042so197607vst.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 May 2021 05:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=96zqy8TyhAD+JhYW/P5FQPokvQlZGIGEa/sS9Ij98mI=;
        b=EfD7xKdBIKyF1wp3H1P52tOOuWOuqJxgpdNW/OhzPa1AixJkAqmvwyN3WaK83Dl1TV
         nZaPrqllQVUZGQ7MVHyaECBuGpGVyFDBqT1XLsK559qzXMI6/8vDISEzWEEKFbab5Jrp
         8ifDApxZfQBwU9tdIyWZRCJWb25uAfKePk3LauMLGt/z3oN2IF2UV/kMgaxUB18FyeM0
         oQU/FYGzC05g0AYsvOcDO8Cf4WGBeCMrqCx4pYL3Bg4yAFzIKpCi8MRgAbL271DjMlOa
         Uzn+o4TvDRqpqr4mErybIcDm9hV4ggPauth9K7GAHrbQhI83vbt+A1SfhF4nlYQnXNrB
         VtKw==
X-Gm-Message-State: AOAM53108fR7LodSJMGDUBWQ4JTEWWxLmlUCnXV13ewJpxF5O89YiVnR
        NXK8k1mLHY6dATjXIHo8t4z8R1nhwzrjX73TxWeXmAqghUnn/UAPgOo1rRPyBmzDuUuoMRNHUI7
        jDjErHZRL34FD9RGRKeKNVc0mZjgslEW5qTAUaCr2N7BqRGUB
X-Received: by 2002:a1f:2b14:: with SMTP id r20mr30492916vkr.9.1622033272867;
        Wed, 26 May 2021 05:47:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxO/rrxMa4qIJIelG7iI0H1rXGneLYwFOt4TREWN2jBRdXeBJv8coCByPtPILPPl70OO9SmeA==
X-Received: by 2002:a1f:2b14:: with SMTP id r20mr30492869vkr.9.1622033272302;
        Wed, 26 May 2021 05:47:52 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id c126sm875817vkh.47.2021.05.26.05.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 05:47:51 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [RESEND PATCH v2 09/13] mfd: sec: Remove unused cfg_pmic_irq in platform data
Date:   Wed, 26 May 2021 08:47:07 -0400
Message-Id: <20210526124711.33223-10-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
References: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The 'cfg_pmic_irq' field of platform data structure is not used and can
be safely dropped.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/mfd/sec-core.c           | 3 ---
 include/linux/mfd/samsung/core.h | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index c61c1fc62165..653d02b98d53 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -382,9 +382,6 @@ static int sec_pmic_probe(struct i2c_client *i2c,
 		return ret;
 	}
 
-	if (pdata->cfg_pmic_irq)
-		pdata->cfg_pmic_irq();
-
 	sec_irq_init(sec_pmic);
 
 	pm_runtime_set_active(sec_pmic->dev);
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index f1631a39acfc..68afc2b97a41 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -85,7 +85,6 @@ struct sec_platform_data {
 	int				num_regulators;
 
 	int				irq_base;
-	int				(*cfg_pmic_irq)(void);
 
 	bool				wakeup;
 	bool				buck_voltage_lock;
-- 
2.27.0

