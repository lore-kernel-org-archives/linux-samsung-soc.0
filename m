Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15598C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  9 Nov 2021 16:44:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED8E960234
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  9 Nov 2021 16:44:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237820AbhKIQra (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 9 Nov 2021 11:47:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237293AbhKIQr3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 9 Nov 2021 11:47:29 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCA32C061767
        for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Nov 2021 08:44:42 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id o18so45751697lfu.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Nov 2021 08:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qSUReGNxk4ZLXo5VHaOBHgErhw/rH9if4VpyxIXVG+w=;
        b=w+FOgP2dVaPUDlgMSLKc8w3h/k4LUAy+RoxkqWR1qkQTce/CFFwJTzfDETxNtRNC5G
         7irgxuop7X3AOiDvLYtm8NUcOI9jORMS6OFxTV4EESs1WJTHgqWF1ey0UxcykIYO2TwK
         TTMNDcULWUaCpyeNSg73mzMB8QG40wWSf9a0UiR2h4mcwLsAjNjUZZil3l3dcFEsyEha
         KfbWIOc8uv9XyjjUQcSPjo15JJVbtcFAhQ07WAIc67Os+iNv9HtfV0fp7o2gBLpulr3p
         02tRS5TuFqw59qUED3odM9zDplxzBmBuPiAV8Cb48RW6EVprivO6eEpqrSgt5/4Wy8lw
         3ulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qSUReGNxk4ZLXo5VHaOBHgErhw/rH9if4VpyxIXVG+w=;
        b=NC9JRn9o3rzrfwoSf9FEEvkoZBAUcP6l0tANA1uU6ZpoHfmDkLJtLFSPcnps1/pkwR
         /zt5qY07UEQAR4dcipPP5h3DpqjW5sBN6vcGhH+GcYoPpVFc0mBoanfZcJJJErq6yaLl
         GDgpYw0vApzKUgHOe4+Y4ZPEKVYU/X8R6TYPU+P3NNfAFwt35sOnMfffHXk2zrMdQ0tQ
         FffeaRKKgvfDlE84Km7/jjMMuDj9CwdsHIqJKiY8rOzXuqMYIUYdw2RSWAv96iE37NTz
         HKJeapspP6veMNsfkQNxzq4+80hBD/iSiU+H9lQflq9UvgYtoO8pXWBqQS1KB0MVH16w
         SY3g==
X-Gm-Message-State: AOAM531q2EKtaA9yk0fuV5zZCws4Fxp37QKLiBM7qS8xQa3LFxHNDfaE
        43eJR9IpcWBPHSSbC13/SFANtA==
X-Google-Smtp-Source: ABdhPJzyoM1ePV7EISliWuxd9maw0TJrCuO2Ft6t74k6bqJxec/9vuIjX9MXTg+e0tZ358PiH1iBHA==
X-Received: by 2002:ac2:51b8:: with SMTP id f24mr5626666lfk.83.1636476279633;
        Tue, 09 Nov 2021 08:44:39 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id q5sm1855633ljb.125.2021.11.09.08.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 08:44:39 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: samsung: Document Exynos850 CMU_CMGP
Date:   Tue,  9 Nov 2021 18:44:35 +0200
Message-Id: <20211109164436.11098-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211109164436.11098-1-semen.protsenko@linaro.org>
References: <20211109164436.11098-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

CMU_CMGP generates USI and ADC clocks for BLK_ALIVE. In particular USI
clocks are needed for HSI2C_3 and HSI2C_4 instances.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 .../clock/samsung,exynos850-clock.yaml        | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
index 5618cfa62f80..80ba60838f2b 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
@@ -33,6 +33,7 @@ properties:
     enum:
       - samsung,exynos850-cmu-top
       - samsung,exynos850-cmu-apm
+      - samsung,exynos850-cmu-cmgp
       - samsung,exynos850-cmu-core
       - samsung,exynos850-cmu-dpu
       - samsung,exynos850-cmu-hsi
@@ -87,6 +88,24 @@ allOf:
             - const: oscclk
             - const: dout_clkcmu_apm_bus
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos850-cmu-cmgp
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: CMU_CMGP bus clock (from CMU_APM)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: gout_clkcmu_cmgp_bus
+
   - if:
       properties:
         compatible:
-- 
2.30.2

