Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93BBBC47088
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 25 Nov 2022 11:23:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbiKYLXR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 25 Nov 2022 06:23:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231156AbiKYLWo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 25 Nov 2022 06:22:44 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DFCE11165
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Nov 2022 03:22:37 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id d6so6396980lfs.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Nov 2022 03:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PF6DmvVYufXGd2lmUCQ3WJQxDOndZjW1o6pFboJNT+A=;
        b=PsKKWnADnCUcm+Kjj9gEq6PbAPRhaIwE/FOmb7FcQ3wOICswOLtS/qFZqciAk/Vj2c
         M1oN2WOXu52B9nUyvPPFHvHfajUF6YYmkiUhvusXRqwcBuZb3qYVn6oaPf78lI6q+MjJ
         QOpfj7kV5uKMA9O3q/QFEJXvuABhnYcDxqHlRMwRt7CIVbNMRgBhdHGK3MOF3vl4DfBX
         8PgkkAksDN4bgF0BSkiiYRU0v/Yesy1WlWQ8HFXdevtHqtevP5nmPYmfUslYYytOnWpV
         98jOiZ39WqqaJPhYIwH/MfYI6NBIQVI2G7veb7gPAHIUJeAKAmnhba9fTIdZHV6LURLb
         dJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PF6DmvVYufXGd2lmUCQ3WJQxDOndZjW1o6pFboJNT+A=;
        b=fX0O8+eHOiB78aK3Ka/cSKCu+rDkkgOKLbkY0SLVtiGr/5uLI4hjX0OwNw/sxE0Uw4
         tdPN5iR+CSSSDMYm3hgM52zJIhvd0XZcXX0AkwSo6ToiimL/Getd93ApVvP6Djh1F23Y
         Z52f7X+FYxDKR6SXeknMOsbJ5UZzcLbNV4qtRT6bQ2pb7rfZlf6hutmDkcu36xaSX32T
         5nRZeNi48b7RJ62KjkCiOeweF8kMI2RypGBKaI3RpJeY8242WJ5zRl7O9+mhLf5jFGPm
         wCQ3rOIYT5TdcRJLI5BXpPj6K7qxIZz/UzMFln92rUkz43pJ0MCErRTTEo2THnchxpNA
         F8wQ==
X-Gm-Message-State: ANoB5plR8V4y2V2loCXfLat4iMhZmcYR90NWNjODJhB+7uzFSF8LKjaT
        4AFF7H/f2N9hKhRDrM2hdJPqbQ==
X-Google-Smtp-Source: AA0mqf5IiSjZg0zx9+oltQ0JDs391PfWfZHphXbGf588bSLGZj3fAEBsmeDyotxPVzTGL1twHdamKQ==
X-Received: by 2002:a05:6512:2252:b0:4b1:7c15:e922 with SMTP id i18-20020a056512225200b004b17c15e922mr8395209lfu.214.1669375354674;
        Fri, 25 Nov 2022 03:22:34 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c1-20020a056512074100b004a478c2f4desm483904lfs.163.2022.11.25.03.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 03:22:34 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sriranjani P <sriranjani.p@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>
Subject: [PATCH 3/4] dt-bindings: soc: samsung: exynos-sysreg: add dedicated SYSREG compatibles to Exynos5433
Date:   Fri, 25 Nov 2022 12:22:00 +0100
Message-Id: <20221125112201.240178-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125112201.240178-1-krzysztof.kozlowski@linaro.org>
References: <20221125112201.240178-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos5433 has several different SYSREGs, so use dedicated compatibles
for them.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Sriranjani P <sriranjani.p@samsung.com>
Cc: Chanho Park <chanho61.park@samsung.com>
Cc: Sam Protsenko <semen.protsenko@linaro.org>
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index 68064a5e339c..42357466005e 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -17,10 +17,21 @@ properties:
               - samsung,exynos3-sysreg
               - samsung,exynos4-sysreg
               - samsung,exynos5-sysreg
-              - samsung,exynos5433-sysreg
               - samsung,exynos850-sysreg
               - samsung,exynosautov9-sysreg
           - const: syscon
+      - items:
+          - enum:
+              - samsung,exynos5433-cam0-sysreg
+              - samsung,exynos5433-cam1-sysreg
+              - samsung,exynos5433-disp-sysreg
+              - samsung,exynos5433-fsys-sysreg
+          - const: samsung,exynos5433-sysreg
+          - const: syscon
+      - items:
+          - const: samsung,exynos5433-sysreg
+          - const: syscon
+        deprecated: true
 
   reg:
     maxItems: 1
-- 
2.34.1

