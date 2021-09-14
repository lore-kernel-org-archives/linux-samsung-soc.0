Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F67C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 14 Sep 2021 15:56:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3211761247
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 14 Sep 2021 15:56:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235062AbhINP5l (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 14 Sep 2021 11:57:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235175AbhINP5j (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Sep 2021 11:57:39 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92651C0613DE
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Sep 2021 08:56:18 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id k4so29862032lfj.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Sep 2021 08:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UdtBNSndqezkgUCZK/aPcnCoX2AuIjJfi+pll+tbfu4=;
        b=g8cxacfT+/ai4kPw+ik31qpT+ZUzpjMs5LF7pqDV22qKcASeYcGNlusP975G2tlASF
         QrV2d1mvQ0/3wddAC/DpuLjlkKkwd4oHJ6/GJ2eibEbsbAZ1SRJYUr6tmGeq+9oMCoTC
         yEhaf8zNRq5biIqyBESYG+GV7EdmYt4Mn2IoVXafz0wZHJBDgR30FRaqacMQulRAY8RG
         G9KFxUEo2Ga1A0Ir80qolXKuPjxCgN8ZPc5wyG6Z4cVuzOXUECXDINnpPKIX8wOIS+gr
         JTYnRL3mR7fHm2UzUzwrl931slpb+hicqTTHlaBiHQSI2ppjleVqZPhss3ypP0GtMNPS
         qXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UdtBNSndqezkgUCZK/aPcnCoX2AuIjJfi+pll+tbfu4=;
        b=5frbljTHP/seEMoFNPm4GcELOIV6lCcVJZ/Ej+/yNAORd3Kx7qamJCFQe5ZeLT3BMz
         Oq81TrtGUt/alIJCYrz3E5g7Vobr0C8oJaTR/5byn43f/hsavmMTWf3DNbG09wDNOjkP
         LWlqFhXpfH2R79POIFFvjHqgyJCDnOe5Dv//Isgu4V+K06YT1nvgIfQx8hc9z6kGckyj
         YWTUBvMxjJ4+vNQuAU7VzMcQ2jTtcWp+F9sUe8dL3HVv/+ohHbMM3kDdXRo5+ql5kgrD
         MU9Lb7znFjl+j5kP9A5517R+CU7jb5d0ZGkrYkk3yTaNsubzVZSwidzsUlHDl8I0nnbl
         aI+A==
X-Gm-Message-State: AOAM530ymyKWHGHRPXLQ4VKIBKPHz2Y+tkZF3aL9zJsOaARzFGJ1Q0pQ
        Rje3CVFRYf458h4aMwZwkcZtgA==
X-Google-Smtp-Source: ABdhPJx/2G0XiWmWet2J+/qkYKNaaQl5EHW2IKOwfp4e4Q0xnIH4fz25bJRLQ0DUPEW6AJgf8NwWZA==
X-Received: by 2002:a05:6512:12d4:: with SMTP id p20mr248929lfg.328.1631634976923;
        Tue, 14 Sep 2021 08:56:16 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id f40sm1232471lfv.210.2021.09.14.08.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 08:56:16 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Ryu Euiyoul <ryu.real@samsung.com>, Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 5/6] dt-bindings: clock: Document Exynos850 CMU bindings
Date:   Tue, 14 Sep 2021 18:56:06 +0300
Message-Id: <20210914155607.14122-6-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210914155607.14122-1-semen.protsenko@linaro.org>
References: <20210914155607.14122-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Provide dt-schema documentation for Exynos850 SoC clock controller.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 .../clock/samsung,exynos850-clock.yaml        | 190 ++++++++++++++++++
 1 file changed, 190 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
new file mode 100644
index 000000000000..b69ba4125421
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
@@ -0,0 +1,190 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/samsung,exynos850-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos850 SoC clock controller
+
+maintainers:
+  - Sam Protsenko <semen.protsenko@linaro.org>
+  - Chanwoo Choi <cw00.choi@samsung.com>
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+  - Tomasz Figa <tomasz.figa@gmail.com>
+
+description: |
+  Exynos850 clock controller is comprised of several CMU units, generating
+  clocks for different domains. Those CMU units are modeled as separate device
+  tree nodes, and might depend on each other. Root clocks in that clock tree are
+  two external clocks:: OSCCLK (26 MHz) and RTCCLK (32768 Hz). Those external
+  clocks must be defined as fixed-rate clocks in dts.
+
+  CMU_TOP is a top-level CMU, where all base clocks are prepared using PLLs and
+  dividers; all other leaf clocks (other CMUs) are usually derived from CMU_TOP.
+
+  Each clock is assigned an identifier and client nodes can use this identifier
+  to specify the clock which they consume. All clocks that available for usage
+  in clock consumer nodes are defined as preprocessor macros in
+  'dt-bindings/clock/exynos850.h' header.
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos850-cmu-top
+      - samsung,exynos850-cmu-core
+      - samsung,exynos850-cmu-hsi
+      - samsung,exynos850-cmu-peri
+
+  clocks:
+    minItems: 1
+    maxItems: 5
+
+  clock-names:
+    minItems: 1
+    maxItems: 5
+
+  "#clock-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos850-cmu-top
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+
+        clock-names:
+          items:
+            - const: oscclk
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos850-cmu-core
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: CMU_CORE bus clock (from CMU_TOP)
+            - description: CCI clock (from CMU_TOP)
+            - description: eMMC clock (from CMU_TOP)
+            - description: SSS clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_core_bus
+            - const: dout_core_cci
+            - const: dout_core_mmc_embd
+            - const: dout_core_sss
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos850-cmu-hsi
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: External RTC clock (32768 Hz)
+            - description: CMU_HSI bus clock (from CMU_TOP)
+            - description: SD card clock (from CMU_TOP)
+            - description: "USB 2.0 DRD clock (from CMU_TOP)"
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: rtcclk
+            - const: dout_hsi_bus
+            - const: dout_hsi_mmc_card
+            - const: dout_hsi_usb20drd
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos850-cmu-peri
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: CMU_PERI bus clock (from CMU_TOP)
+            - description: UART clock (from CMU_TOP)
+            - description: Parent clock for HSI2C and SPI (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_peri_bus
+            - const: dout_peri_uart
+            - const: dout_peri_ip
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clocks
+  - clock-names
+  - reg
+
+additionalProperties: false
+
+examples:
+  # Clock controller node for CMU_PERI
+  - |
+    #include <dt-bindings/clock/exynos850.h>
+
+    cmu_peri: clock-controller@10030000 {
+        compatible = "samsung,exynos850-cmu-peri";
+        reg = <0x10030000 0x8000>;
+        #clock-cells = <1>;
+
+        clocks = <&oscclk>, <&cmu_top DOUT_PERI_BUS>,
+                 <&cmu_top DOUT_PERI_UART>,
+                 <&cmu_top DOUT_PERI_IP>;
+        clock-names = "oscclk", "dout_peri_bus",
+                      "dout_peri_uart", "dout_peri_ip";
+    };
+
+  # External reference clock (should be provided in particular board DTS)
+  - |
+    oscclk: clock-oscclk {
+        compatible = "fixed-clock";
+        #clock-cells = <0>;
+        clock-output-names = "oscclk";
+        clock-frequency = <26000000>;
+    };
+
+  # UART controller node that consumes the clock generated by CMU_PERI
+  - |
+    #include <dt-bindings/clock/exynos850.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    serial_0: serial@13820000 {
+        compatible = "samsung,exynos850-uart";
+        reg = <0x13820000 0x100>;
+        interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&uart0_pins>;
+        clocks = <&cmu_peri GOUT_UART_PCLK>, <&cmu_peri GOUT_UART_IPCLK>;
+        clock-names = "uart", "clk_uart_baud0";
+    };
+
+...
-- 
2.30.2

