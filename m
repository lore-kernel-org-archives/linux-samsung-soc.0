Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D421DCCA479
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Jul 2022 10:29:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233932AbiGDK3y (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 4 Jul 2022 06:29:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234063AbiGDK3u (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 4 Jul 2022 06:29:50 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E10C1BC35
        for <linux-samsung-soc@vger.kernel.org>; Mon,  4 Jul 2022 03:29:46 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id b19so10512605ljf.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Jul 2022 03:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZpLOB+GeqZUZaWdoW3n5TUSSrySl3KCsNy7wywNHGKA=;
        b=b6CpaGtKjjfHIHJCOvE2hZQK80YR/EuQRFB5PMr17yruaa8c7aJzT0RzikFjXQ0tAR
         8HQFv8qPgr3zo/KRdpS3ELul484i4ljl9Ae1AYC8MNgqO/2yruNhhTwC7SF2z12jdjT2
         j8J1l2hCzr5qcUNzLWpx/W6+TarQXZhO6/WNYH7LOHlp5mEwzUQZXjxAgTsihTdP5ldj
         s0QMgG2g6UaUHPU7vZ4fH3rwU8X/5ELJ3XsrTFCWhqh6BxFFrTuZLR9XR9wlnis1gJQm
         wwbGGATK4vvT4G7SrX07ekgy7ERI+NQ+Srm2OSXWwQ5Pbv8IGDgoJa2tBfr4fwykw5zA
         +WKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZpLOB+GeqZUZaWdoW3n5TUSSrySl3KCsNy7wywNHGKA=;
        b=aEwQkAiissHE4wXATh7d3PAPY87Ds0nVea8K4jWllnZPjdjSUXMb9OSHTKSCD+2k5B
         iqD+IBffWvBBhVyq3/3tSsKjFetglTDFLTZYbRtytSttWhABfXO/GGq2JHKXYAY6Wy4m
         yZshJAyxIAf4llXZj3HbWKD/DX2TGXuDLUxS8YGRgZrJFw40AyzuQpUnjbv1cmMwRKWU
         f1AyBy7dpGLLUnBfllD6H1dp8xUoNzY6eXHw8AiiN+gamyJLFuBth/U6DUp1k+MmTdgv
         AQQdcrv7wqwjBgS1xH7H1itk8+GgeEv+DMvzTJomJ6I86zf77AqB2TbEFmxtyKEvIjiI
         HoVA==
X-Gm-Message-State: AJIora8g5LgHLKS/AZn9R9t3Tl1mhEfEZl7mNU0yOuGz3xhjC9JY26Uc
        7IitinkXINg3KRT48x2bGFBlIQ==
X-Google-Smtp-Source: AGRyM1tCDuktvi2GzIE4J+9Ye28RHU50EuxwYQs3Ch8ATjRmMsdXxAWN1iTcqxp4UDuEbfIblpr1/w==
X-Received: by 2002:a2e:9105:0:b0:25a:7461:55b2 with SMTP id m5-20020a2e9105000000b0025a746155b2mr16537845ljg.326.1656930585167;
        Mon, 04 Jul 2022 03:29:45 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id j24-20020ac253b8000000b004796a17246esm2930279lfh.252.2022.07.04.03.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 03:29:44 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: samsung: document preferred compatible naming
Date:   Mon,  4 Jul 2022 12:29:12 +0200
Message-Id: <20220704102912.110881-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Compatibles can come in two formats.  Either "vendor,ip-soc" or
"vendor,soc-ip".  Add a DT schema documenting preferred policy and
enforcing it for all new compatibles, except few existing patterns.  The
schema also disallows wild-cards used in SoC compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/arm/samsung/samsung-soc.yaml     | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/samsung/samsung-soc.yaml

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-soc.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-soc.yaml
new file mode 100644
index 000000000000..97ed793cd9c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-soc.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/samsung/samsung-soc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S3C, S5P and Exynos SoC compatibles naming convention
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+description: |
+  Guidelines for new compatibles for SoC blocks/components.
+  When adding new compatibles in new bindings, use the format::
+    samsung,SoC-IP
+
+  For example::
+    samsung,exynos5433-cmu-isp
+
+select:
+  properties:
+    compatible:
+      pattern: "^samsung,.*(s3c|s5pv|exynos)[0-9a-z]+.*$"
+  required:
+    - compatible
+
+properties:
+  compatible:
+    oneOf:
+      - description: Preferred naming style for compatibles of SoC components
+        pattern: "^samsung,(s3c|s5pv|exynos|exynosautov)[0-9]+-.*$"
+
+      # Legacy compatibles with wild-cards - list cannot grow:
+      - enum:
+          - samsung,exynos4x12-pinctrl
+          - samsung,exynos4x12-usb2-phy
+          - samsung,s3c64xx-pinctrl
+          - samsung,s3c64xx-wakeup-eint
+
+additionalProperties: true
-- 
2.34.1

