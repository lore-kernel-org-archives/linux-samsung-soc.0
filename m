Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3766FC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 17 Dec 2021 16:16:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239007AbhLQQQF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 17 Dec 2021 11:16:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238976AbhLQQQA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 17 Dec 2021 11:16:00 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4365FC06173F
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Dec 2021 08:16:00 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id t3so5593440lfe.12
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Dec 2021 08:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8QEZ+2WyzDr1Gicg/jJLj4X7PVW+zTh/aqldmrybsKU=;
        b=jde5oGiJDktLTwR1GMu3kEDrgm9gWmIyDoda+tYONGQnKX46PKpbWtYbpNDXM1JpKG
         eIYgFvwhcTOZVzlhD1gLLQm7W6GitRVq+nCAQELjGrlz4BdQnbz7W0hTX5U9DaROU0Co
         X/MCYqDFLc9Pgsn9XqN1waEpdZAtsWUlPZr1RVGWq9aoB3S5KkfftNVfGPXwUd9/NZJv
         tyBGFi1GhBpOlq9sNP7Ze7yegskuFoV98H50fvBBLcRi/h3bY4xEoxk7FwMcEQy2VHaM
         awOpBCGmBsvXSIGm3RIyEwumZlPw7NRBFmaS7JH4Bmmg3cKHo+qKKmORyZxg4C9H1Nzt
         pBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8QEZ+2WyzDr1Gicg/jJLj4X7PVW+zTh/aqldmrybsKU=;
        b=IDXZdc+dVRQ89VdIvTiCPSuiJflxxOJ9FHbCyPabPT4jLcc+uyNSmTY1rxXfLa18jt
         SMU5SPjY97SriErUbdvJOXXCk0J6R8DWR9nHJ8wBlmJqBZWVK7xqvv++Ofl/4LFJXkMr
         79bnwygNIt1I7ObLkee17a/RNaOBkTXDYgq3+nF7mjyiO2Q4VaIA5rMcBl1z1eYYrvoo
         FfEkI7ls4+NporzaNxBeuMI5ZUfUydHb/EGHg2eVobraEjkeYB/vLqO9AMAnVqmywOIT
         0uvmAwYFnxg5bcBGH7hs7HiVVKjCrfw4xFz3fMBPz5YUURoZYYD0C7scRSKCV7P/aZs/
         EluQ==
X-Gm-Message-State: AOAM533Sq8Sbi2fbJn6aak7BGwRU8wTTHxqB+p1slitDHBXDL810hHUh
        GLQ69PfRz/dZMxwEyYDwOPbzyg==
X-Google-Smtp-Source: ABdhPJxcwieciW+q+Dm535CYa+a8AniIkF2+9iWYEjr90PZnGSLPfd3zNHb+r7LM12QgFoFiwVadng==
X-Received: by 2002:a05:6512:10cb:: with SMTP id k11mr3374991lfg.534.1639757758549;
        Fri, 17 Dec 2021 08:15:58 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id n30sm1453982lfi.194.2021.12.17.08.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 08:15:58 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Hao Fang <fanghao11@huawei.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 5/7] dt-bindings: pinctrl: samsung: Add pin drive definitions for Exynos850
Date:   Fri, 17 Dec 2021 18:15:47 +0200
Message-Id: <20211217161549.24836-6-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211217161549.24836-1-semen.protsenko@linaro.org>
References: <20211217161549.24836-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

All Exynos850 GPIO blocks can use EXYNOS5420_PIN_DRV* definitions,
except GPIO_HSI block. Add pin drive strength definitions for GPIO_HSI
block correspondingly.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v4:
  - (none)

Changes in v3:
  - (none)

Changes in v2:
  - Added Ack tag by Rob Herring

 include/dt-bindings/pinctrl/samsung.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/pinctrl/samsung.h b/include/dt-bindings/pinctrl/samsung.h
index b1832506b923..950970634dfe 100644
--- a/include/dt-bindings/pinctrl/samsung.h
+++ b/include/dt-bindings/pinctrl/samsung.h
@@ -36,7 +36,10 @@
 #define EXYNOS5260_PIN_DRV_LV4		2
 #define EXYNOS5260_PIN_DRV_LV6		3
 
-/* Drive strengths for Exynos5410, Exynos542x and Exynos5800 */
+/*
+ * Drive strengths for Exynos5410, Exynos542x, Exynos5800 and Exynos850 (except
+ * GPIO_HSI block)
+ */
 #define EXYNOS5420_PIN_DRV_LV1		0
 #define EXYNOS5420_PIN_DRV_LV2		1
 #define EXYNOS5420_PIN_DRV_LV3		2
@@ -56,6 +59,14 @@
 #define EXYNOS5433_PIN_DRV_SLOW_SR5	0xc
 #define EXYNOS5433_PIN_DRV_SLOW_SR6	0xf
 
+/* Drive strengths for Exynos850 GPIO_HSI block */
+#define EXYNOS850_HSI_PIN_DRV_LV1	0	/* 1x   */
+#define EXYNOS850_HSI_PIN_DRV_LV1_5	1	/* 1.5x */
+#define EXYNOS850_HSI_PIN_DRV_LV2	2	/* 2x   */
+#define EXYNOS850_HSI_PIN_DRV_LV2_5	3	/* 2.5x */
+#define EXYNOS850_HSI_PIN_DRV_LV3	4	/* 3x   */
+#define EXYNOS850_HSI_PIN_DRV_LV4	5	/* 4x   */
+
 #define EXYNOS_PIN_FUNC_INPUT		0
 #define EXYNOS_PIN_FUNC_OUTPUT		1
 #define EXYNOS_PIN_FUNC_2		2
-- 
2.30.2

