Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02EB3C74A4B
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Mar 2023 14:50:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230291AbjCMOuG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 13 Mar 2023 10:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231591AbjCMOtr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Mar 2023 10:49:47 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DB4E58C09
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Mar 2023 07:49:33 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id ek18so18624561edb.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Mar 2023 07:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678718972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+SeIuGOnWZJTRdz7yn6qXttfp8xMaaSC858bvTHbD+M=;
        b=TJ3el7noneamIs188VYutGwlIvaCrPyqrVClQdYUWXL4+icsQsuSQtKedsDhtO60AN
         veD/pnz8NemZWAm8m2CPUyPuRd+4H2dYd4RbspHZd6XNuqvNidtK+ZVUYdcDKdAdV38J
         +i9GM2w6cTBUiulTB817EiaXj3W1Uihy35l4lATCwyRtobwGDwC3rYping1fkTTpskbB
         Wis9v8S1ttvVv3x4gv4Kx5Elp/3vklhunLSfc9rXO0E7OZ99LU0WBeEGYOieCbrpmwGO
         KY8BYze8SslEhUt1s4h0+cPCCaN+gYm0zb3Jmnrz9kRIUzjLPcE1ZWAucZ6iySvwquDa
         cKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678718972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+SeIuGOnWZJTRdz7yn6qXttfp8xMaaSC858bvTHbD+M=;
        b=PQJVDzqdeVq5B+s8a3GnfZlUTfiNC3i82AG8iWvKjEPpiYaVJDx+kmVWmwwbFfpapp
         VIuhAScrX7EOz2I9GTHbB/qHF/zLky71q75Cf3p+IImKb+3N/a9sh6ADRtlVCbC6lDhN
         /cCENT3jzH3oeyOAFtwutQrw48iGoxSzAYqnsh3QwPHQaSvH61LSy/qZl4vVl3UR/pVp
         tGdMF0t2kkucK91cw/pGFTLF47A5vEsrVjIPksKLx6jDTOme1WzDg4O+iRCxuoXwUQ6K
         mPPkeQC/QXeHrEuvb/gDhAzdzdYX51E0BxXQCT0186SBAKTgstwnfKaGDUXTNNEU3rBY
         88zw==
X-Gm-Message-State: AO0yUKU5wY6nAfksd25iUyGnphlOImqvxLh8y02mL3CANQhk0XbMebMH
        zUKX/NYgpFgH5tTs/U5G3wBpHw==
X-Google-Smtp-Source: AK7set8Zs7aupquXqRj9OcvKxh7yJPt/JFOUaQkwIy5hg44UKAvhEOcuggrtRTPYwo7qhzQnQ96Rvg==
X-Received: by 2002:a17:906:944c:b0:922:de2c:fdaa with SMTP id z12-20020a170906944c00b00922de2cfdaamr7166980ejx.50.1678718972252;
        Mon, 13 Mar 2023 07:49:32 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:69db:4882:d071:27c4])
        by smtp.gmail.com with ESMTPSA id ia17-20020a170907a07100b0092153c6b549sm3030164ejc.22.2023.03.13.07.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 07:49:31 -0700 (PDT)
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
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 07/10] media: dt-bindings: samsung,exynos4212-fimc-lite: convert to dtschema
Date:   Mon, 13 Mar 2023 15:49:13 +0100
Message-Id: <20230313144916.511884-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230313144916.511884-1-krzysztof.kozlowski@linaro.org>
References: <20230313144916.511884-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert the Samsung Exynos SoC series camera host interface (FIMC-LITE)
bindings to DT schema.  Changes during conversion - adjust to existing
DTS and Linux driver: add iommus and power-domains.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changes since v2:
1. Add Rb tag.
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
index 19d0e5fb913e..422283b41e11 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18557,6 +18557,7 @@ L:	linux-media@vger.kernel.org
 S:	Supported
 Q:	https://patchwork.linuxtv.org/project/linux-media/list/
 F:	Documentation/devicetree/bindings/media/samsung,exynos4210-csis.yaml
+F:	Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-lite.yaml
 F:	drivers/media/platform/samsung/exynos4-is/
 
 SAMSUNG SOC CLOCK DRIVERS
-- 
2.34.1

