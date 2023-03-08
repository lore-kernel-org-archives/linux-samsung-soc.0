Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3A7FC6FD19
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Mar 2023 23:10:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbjCHXKU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Mar 2023 18:10:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230161AbjCHXJn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Mar 2023 18:09:43 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC4E564218
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Mar 2023 15:09:40 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id o4-20020a9d6d04000000b00694127788f4so102329otp.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Mar 2023 15:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678316980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LqP7runz9fYVY1TUY6ik+MRNc/PM8+/25wcHDRNrCqg=;
        b=pMeJTUMMw8Ia7l1IPPUUsdvR7xspLZEDohgXXQH/vDj7exFL9MWOAAnxhMUHw9xEi9
         q+EoBXK+9I748gNWpHzqG0R6Ara+yLGh1qbSF6lHBdxZT96b3l8MUa242OxPTQMV7xLg
         hQAO9hP8fvXLArgDEj6X/R7pw+WSgtBmchw/srR0PH0Ft+wypT5hIfZV9XqBF0c+KCLh
         kgInsvI7lf7pAiTiq8Fq0MFNkk+c2PfgzSbLju3iffONoUCZBqJWLlkBW1OlXYT+64/b
         JKK/cmWqYLctN66VueXT93bhwZC4VpTjIzoAhyRuG897cU84E4eWNfSe6pHN6KJ7ISLg
         nPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678316980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LqP7runz9fYVY1TUY6ik+MRNc/PM8+/25wcHDRNrCqg=;
        b=ZXUC3Qrn953/g5IB5TQy9wkrlS43151hLVqVawGxNJm7yjzQMoGVnxi4N4UzBzusNq
         2EGUx72bF1c79Rqj2fqF8eQREEnhRiSaCCmjF+mV0tY4XXlFRMdZhOXPQEsvxqoUmZU4
         oHy4Z6irefJpII/+WN7ud1ubqSO9ufESOoVvgitLiohB5ozL4bjumUKdmzLUqeh3j9xp
         bsCuNWKCxTcDYX9JSK1nUd1ShZPKKNgIWYDR3wyv/3j8tYJE0EY+9z6MduLz2w2UOAOR
         s3BCoOTwNmaOMHDHuAA0RU+YhMCdBs9LZrQAKWjaOQ4OFlDXn79pq5+/RsBAs2h2TmnV
         gNpQ==
X-Gm-Message-State: AO0yUKVmM88jxRKemOLkKikBtQRxrflh/BQQTDsMQGiuxhH4Yd+pcmWb
        BnW77bRuZOVV42ZeWprl6uTJRg==
X-Google-Smtp-Source: AK7set/tBJXhTZUXyy437vmJNBgUKb2EX1mJ5MLUT6s+oNNf/7TzTYa0XXmwK2tWKREM5hmGZM2/cQ==
X-Received: by 2002:a05:6830:3142:b0:68b:e4e6:cc9c with SMTP id c2-20020a056830314200b0068be4e6cc9cmr11426374ots.33.1678316980169;
        Wed, 08 Mar 2023 15:09:40 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id z25-20020a056830129900b00686574e98d6sm6919220otp.72.2023.03.08.15.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 15:09:39 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] soc: samsung: pm_domains: Add Exynos850 support
Date:   Wed,  8 Mar 2023 17:09:31 -0600
Message-Id: <20230308230931.27261-7-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308230931.27261-1-semen.protsenko@linaro.org>
References: <20230308230931.27261-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add a new compatible string for Exynos850, providing all HW specific
data, which enables Exynos PD support for this chip.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/soc/samsung/pm_domains.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/soc/samsung/pm_domains.c b/drivers/soc/samsung/pm_domains.c
index ec630a151247..795d8a9cd4b5 100644
--- a/drivers/soc/samsung/pm_domains.c
+++ b/drivers/soc/samsung/pm_domains.c
@@ -20,6 +20,8 @@
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 
+#include <dt-bindings/power/samsung,exynos850-power.h>
+
 /* Register offsets inside Power Domain area in PMU */
 #define EXYNOS_PD_CONF		0x0
 #define EXYNOS_PD_STATUS	0x4
@@ -132,6 +134,21 @@ static const struct exynos_pm_domain_config exynos5433_cfg = {
 	.local_pwr_cfg		= 0xf,
 };
 
+static const unsigned int exynos850_pd_offsets[] = {
+	[EXYNOS850_PD_HSI]	= 0x1c80,
+	[EXYNOS850_PD_G3D]	= 0x1d00,
+	[EXYNOS850_PD_MFCMSCL]	= 0x1d80,
+	[EXYNOS850_PD_DPU]	= 0x2000,
+	[EXYNOS850_PD_AUD]	= 0x2080,
+	[EXYNOS850_PD_IS]	= 0x2100,
+};
+
+static const struct exynos_pm_domain_config exynos850_cfg = {
+	.local_pwr_cfg		= 0x1,
+	.pd_offsets		= exynos850_pd_offsets,
+	.pd_offsets_num		= ARRAY_SIZE(exynos850_pd_offsets),
+};
+
 static const struct of_device_id exynos_pm_domain_of_match[] = {
 	{
 		.compatible = "samsung,exynos4210-pd",
@@ -139,6 +156,9 @@ static const struct of_device_id exynos_pm_domain_of_match[] = {
 	}, {
 		.compatible = "samsung,exynos5433-pd",
 		.data = &exynos5433_cfg,
+	}, {
+		.compatible = "samsung,exynos850-pd",
+		.data = &exynos850_cfg,
 	},
 	{ },
 };
-- 
2.39.2

