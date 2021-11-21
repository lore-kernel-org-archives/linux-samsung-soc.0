Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9FA5C43219
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 21 Nov 2021 23:27:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbhKUXaw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 21 Nov 2021 18:30:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230199AbhKUXav (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 21 Nov 2021 18:30:51 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 170F4C061748
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Nov 2021 15:27:46 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id t26so71888648lfk.9
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Nov 2021 15:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I8O/n1Ie/UbOS/EduUejrCjqvr8VQYVRUpYpuvXrET0=;
        b=Mmz2WKwJO5Qp3cKlMmxw2glQgjHd6nl7HErF7E3fwIYWukRgvVUCnXL9lweZgLlGKL
         K4+wrnTgQJapZ5ZuDzBbPSseOer+4kTq8+/X8eioKmUyQI3BVXTNnoiDcec3Hu7eqWVx
         Zbz0ACsNenCZ2k9dOiQA7OsigE3IMeivpTGCHMrECJAZBCFDhJTBjHFQnU0mdjSgcAwz
         G5fxrNBizn6QFqShZ4V6/B7nwyL8nsiDV/judEdxeLqsIXoXQtUb+iXsSJ22ZsMRZfO+
         U/D0DHwT4VO7ObOOv45Av4l09YpgG0qSna5uusKm8NgU71874caH6KgaGPyPKdpu8+4G
         vQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I8O/n1Ie/UbOS/EduUejrCjqvr8VQYVRUpYpuvXrET0=;
        b=UseF0Jx9h/mNUltWleJiqxCnEh5kn9su0nButekmhBnHcxIEcI0pJPNfK5oeFX60KZ
         vdl1Glf660eteDIw+0qDYOiBMRZsb4j0hhdT9GfzVUIFLQXIxGuBoZ2b9tsZMWcn9BSl
         81ChoVQ4mkYpmkbbcv5VJsRfgQStcHrGukHs61Sg/jXJvQikF6r6w1P4in9gX9654sk9
         HpZMmx7GMsaljf4lisBkM2kkkQUDMlqR6qGfeFpR23jKtsCB9hFLZDPORHX/KvH6yfIW
         NCbjoqDYqUm3CZSdQZC3W1UJO8qI4qF+T3sjlHAgWTtDpMduZppV4vzf0C+wpQrJDGfm
         neRA==
X-Gm-Message-State: AOAM533iRggUeDnbs1sp0Gpdu/jDyI2hiyJvyHEuCRom2Ld1rwwbqyET
        SafwVajZoepax1RUrAl9aa4Y1M90k3Fboo8U
X-Google-Smtp-Source: ABdhPJy9dPhCFajzOs/PwYrCnY8LelX6uygETxdMwGJqlcbwy6x6400fj/ZEIfHHeGRc2PPBfgpqwA==
X-Received: by 2002:a19:770a:: with SMTP id s10mr55262400lfc.234.1637537264317;
        Sun, 21 Nov 2021 15:27:44 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id s9sm773698lfr.304.2021.11.21.15.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 15:27:43 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Virag <virag.david003@gmail.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: clock: Add bindings for Exynos850 CMU_APM
Date:   Mon, 22 Nov 2021 01:27:36 +0200
Message-Id: <20211121232741.6967-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211121232741.6967-1-semen.protsenko@linaro.org>
References: <20211121232741.6967-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

CMU_APM generates clocks for APM IP-core (Active Power Management). In
particular it generates RTC clocks, which are needed to enable rtc-s3c
driver on Exynos850 SoC.

Add clock indices and binding documentation for CMU_APM.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 .../clock/samsung,exynos850-clock.yaml        | 19 ++++++++++++
 include/dt-bindings/clock/exynos850.h         | 29 ++++++++++++++++++-
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
index 7f8c91a29b91..5618cfa62f80 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
@@ -32,6 +32,7 @@ properties:
   compatible:
     enum:
       - samsung,exynos850-cmu-top
+      - samsung,exynos850-cmu-apm
       - samsung,exynos850-cmu-core
       - samsung,exynos850-cmu-dpu
       - samsung,exynos850-cmu-hsi
@@ -68,6 +69,24 @@ allOf:
           items:
             - const: oscclk
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos850-cmu-apm
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: CMU_APM bus clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_clkcmu_apm_bus
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/exynos850.h b/include/dt-bindings/clock/exynos850.h
index 8999184f94a2..df3978b58304 100644
--- a/include/dt-bindings/clock/exynos850.h
+++ b/include/dt-bindings/clock/exynos850.h
@@ -55,7 +55,34 @@
 #define CLK_GOUT_PERI_BUS		43
 #define CLK_GOUT_PERI_UART		44
 #define CLK_GOUT_PERI_IP		45
-#define TOP_NR_CLK			46
+#define CLK_MOUT_CLKCMU_APM_BUS		46
+#define CLK_DOUT_CLKCMU_APM_BUS		47
+#define CLK_GOUT_CLKCMU_APM_BUS		48
+#define TOP_NR_CLK			49
+
+/* CMU_APM */
+#define CLK_RCO_I3C_PMIC		1
+#define OSCCLK_RCO_APM			2
+#define CLK_RCO_APM__ALV		3
+#define CLK_DLL_DCO			4
+#define CLK_MOUT_APM_BUS_USER		5
+#define CLK_MOUT_RCO_APM_I3C_USER	6
+#define CLK_MOUT_RCO_APM_USER		7
+#define CLK_MOUT_DLL_USER		8
+#define CLK_MOUT_CLKCMU_CHUB_BUS	9
+#define CLK_MOUT_APM_BUS		10
+#define CLK_MOUT_APM_I3C		11
+#define CLK_DOUT_CLKCMU_CHUB_BUS	12
+#define CLK_DOUT_APM_BUS		13
+#define CLK_DOUT_APM_I3C		14
+#define CLK_GOUT_CLKCMU_CMGP_BUS	15
+#define CLK_GOUT_CLKCMU_CHUB_BUS	16
+#define CLK_GOUT_RTC_PCLK		17
+#define CLK_GOUT_TOP_RTC_PCLK		18
+#define CLK_GOUT_I3C_PCLK		19
+#define CLK_GOUT_I3C_SCLK		20
+#define CLK_GOUT_SPEEDY_PCLK		21
+#define APM_NR_CLK			22
 
 /* CMU_HSI */
 #define CLK_MOUT_HSI_BUS_USER		1
-- 
2.30.2

