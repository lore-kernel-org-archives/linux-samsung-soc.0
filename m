Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDBF4C05027
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 14 Feb 2023 10:47:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232459AbjBNKrn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 14 Feb 2023 05:47:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232489AbjBNKrY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Feb 2023 05:47:24 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 884B11EBDF
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Feb 2023 02:47:00 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso13329868wms.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Feb 2023 02:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnqWFP3S/mYpdJd7jNi0qKprTXE1O3AHQErMdEIJxhE=;
        b=avOC9QTWD8RCAuWqkP5IuS9rGHaXHiQsbVXP9Nef+4+UVowge+lzXCJm4RFY/LF7f1
         78u03dnYKdLJbu7mVEg6/P/DwPnILj6uo3hCyEZbKEU8g3WmVRSXwyEYixe3dymoG2TL
         w8Dw8pOWk/bDpmYRrpq8yJt6SqeZW0eFDEWdIKX+ZFKvYSuuxNQAwVnLQhI4AiOteJzD
         GxhKWw8PW0Agm1zxGBv0ZywL7ez2nJISExqhw5wGjBzriy7+5z5bSV2bZI6G1mLkOXQQ
         WM6eBdCTGIoe7OJxXgUVq4JWUK8EzmX2cweo7N+g7N3S9i25je+46ygOyN5mtofJSutg
         OFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pnqWFP3S/mYpdJd7jNi0qKprTXE1O3AHQErMdEIJxhE=;
        b=bua4AVGgt3S2Ae3bmZUX8JJ0Cg5jzWDFtDySy4qUiFVHWhBOA0njeXo4hiFq0aYiU3
         Tj5RKdvq5iZGX37F0HY6xEjPDSIP/Xb/ZHO2jyDG8PBCVLfkRXQeb+nzEBuyN1qJ21vH
         S5rPJow7ZUP/XavBkM2ahDId8P+3aUIeGixCfaU++EA+J1mbdYCiCSG2x/kGWOkAL+SU
         sLflPsBxJCQizjGAh09yMHraNxXSzcGgCVRbU7wHD6T/hck2lod9yggHJtpnp30U0NBk
         w0hSNIJ4bLGrTSSVBdhotCEblSCN9thLvsfqW0gUoqKONHI5aG4L9OaaL/ubFKQb+JW3
         CPPA==
X-Gm-Message-State: AO0yUKWS54NeczptuDJYgsEDG94DsnzTqW8FJQApmripZMyyyt0JRLOQ
        j3Wo2kXnb3HmzaJZUp79XWKaEg==
X-Google-Smtp-Source: AK7set9BkT2oW7eg6yytmGLcVa/22qTmI97q+YMv7gYEupY6JIWy48JUWnCsx94FGxn/cd5aOsPD9g==
X-Received: by 2002:a05:600c:3412:b0:3dd:b0b3:811b with SMTP id y18-20020a05600c341200b003ddb0b3811bmr1565945wmp.31.1676371616865;
        Tue, 14 Feb 2023 02:46:56 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m20-20020a05600c4f5400b003e1f319b87bsm2623719wmq.24.2023.02.14.02.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 02:46:56 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 4/7] media: dt-bindings: samsung,exynos4212-fimc-lite: convert to dtschema
Date:   Tue, 14 Feb 2023 11:45:05 +0100
Message-Id: <20230214104508.51955-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214104508.51955-1-krzysztof.kozlowski@linaro.org>
References: <20230214104508.51955-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert the Samsung Exynos SoC series camera host interface (FIMC-LITE)
bindings to DT schema.  Changes during conversion - adjust to existing
DTS and Linux driver: add iommus and power-domains.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/media/exynos-fimc-lite.txt       | 16 -----
 .../media/samsung,exynos4212-fimc-lite.yaml   | 63 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 3 files changed, 64 insertions(+), 16 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/exynos-fimc-lite.txt
 create mode 100644 Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-lite.yaml

diff --git a/Documentation/devicetree/bindings/media/exynos-fimc-lite.txt b/Documentation/devicetree/bindings/media/exynos-fimc-lite.txt
deleted file mode 100644
index 0bf6fb7fbeab..000000000000
--- a/Documentation/devicetree/bindings/media/exynos-fimc-lite.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-Exynos4x12/Exynos5 SoC series camera host interface (FIMC-LITE)
-
-Required properties:
-
-- compatible	: should be one of:
-		  "samsung,exynos4212-fimc-lite" for Exynos4212/4412 SoCs,
-		  "samsung,exynos5250-fimc-lite" for Exynos5250 compatible
-		   devices;
-- reg		: physical base address and size of the device memory mapped
-		  registers;
-- interrupts	: should contain FIMC-LITE interrupt;
-- clocks	: FIMC LITE gate clock should be specified in this property.
-- clock-names	: should contain "flite" entry.
-
-Each FIMC device should have an alias in the aliases node, in the form of
-fimc-lite<n>, where <n> is an integer specifying the IP block instance.
diff --git a/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-lite.yaml b/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-lite.yaml
new file mode 100644
index 000000000000..f80eca0a4f41
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-lite.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/samsung,exynos4212-fimc-lite.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos SoC series camera host interface (FIMC-LITE)
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+
+description:
+  Each FIMC device should have an alias in the aliases node, in the form of
+  fimc-lite<n>, where <n> is an integer specifying the IP block instance.
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos4212-fimc-lite
+      - samsung,exynos5250-fimc-lite
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: flite
+
+  interrupts:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/exynos4.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    fimc-lite@12390000 {
+        compatible = "samsung,exynos4212-fimc-lite";
+        reg = <0x12390000 0x1000>;
+        clocks = <&isp_clock CLK_ISP_FIMC_LITE0>;
+        clock-names = "flite";
+        interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+        power-domains = <&pd_isp>;
+        iommus = <&sysmmu_fimc_lite0>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 0882e304c8f9..2789c436c875 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18466,6 +18466,7 @@ L:	linux-media@vger.kernel.org
 S:	Supported
 Q:	https://patchwork.linuxtv.org/project/linux-media/list/
 F:	Documentation/devicetree/bindings/media/samsung,exynos4210-csis.yaml
+F:	Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-lite.yaml
 F:	drivers/media/platform/samsung/exynos4-is/
 
 SAMSUNG SOC CLOCK DRIVERS
-- 
2.34.1

