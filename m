Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B32C43214
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Aug 2021 13:41:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 866BE610F8
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Aug 2021 13:41:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241399AbhHYNmj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 25 Aug 2021 09:42:39 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:58668
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241423AbhHYNmd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Aug 2021 09:42:33 -0400
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AA19440763
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Aug 2021 13:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629898906;
        bh=IrN4+nU4lMGaS+vyV9i4h1/xLb98LhHY+RVy2Oj75+I=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=MtaNozsO24QyDnqVekkjUFCgRrdPGbxRA3GMns/+8TXNOBYOGhVSX1edEd3dyeNl2
         KZRP54eHh2geiyC8GVGdY4sSZKuQQOkh8mZf4hPB2MiIxSZkHBAlCn1EPLIhr2w+Jy
         Ac5+NMml4YXEiAFqMGTro7rIbElWzpQkcpxR0Yz1H5HxLABHNfC//pQlKInd1ZeD+H
         3b122lHQ/uMoBuqUAMv7yOMYBTdY2inC6IUE89ncQtXfxpraj8oo0D2xChlUbuytVS
         bOnuQvpTHu9OC8zwehGOaNlJ9XWD9/5S9BqqGiF+CKrRlhlkqwDnnNeEaDOeCkfyxv
         ff2oPSscWpMcQ==
Received: by mail-wm1-f70.google.com with SMTP id r126-20020a1c4484000000b002e8858850abso186183wma.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Aug 2021 06:41:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IrN4+nU4lMGaS+vyV9i4h1/xLb98LhHY+RVy2Oj75+I=;
        b=j2BsuyOl6Kxbl0Im3AGpURECvckZWlEMs/8BHHGpQlqVTm7LbAFixRqY0sXB1ssaa+
         Klxi0mVS14GncZzCFW3goG5o/S0Z2F0K5WGWVM2NxIYK4FqAqr+dU5ydd8ZBDyJU/Bxm
         JncpYqKIzEtQ5zWlVBBaxgT2d/oMH6BPZuyI/PiHGG2/nme+eCuACJCF4fykLyBjrCX6
         DY72ODbIdyhMdKaJ96dOltLVxI7dQ0nzwJj62pomqL9QP7LNTDcI1cvIdgxYAFXDeI26
         H8JEODPkUNrK9peY5gCi8l8q4sj8CPwcPu6grwUsk8WVnZACKut6ivnEXi/Wd4knGobI
         6WYQ==
X-Gm-Message-State: AOAM531ky6o30P6sF20JVgP9RrJJOcMT3WmiFaB4q1CHfaxofj8mPAlp
        SCFIoa4yRh0OhZP75IklXRE2PynoxjopsfZT4Wr6uGa1W4z4kEwIbF0OEU8AP1haJk8aQ1Y1hYc
        UBwgh6X9floHQDfJgmO/8ACvjfTTvUW9925FaOndFrhAHaZeG
X-Received: by 2002:a5d:674b:: with SMTP id l11mr25271407wrw.357.1629898905520;
        Wed, 25 Aug 2021 06:41:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhShroR75PloeyFHsNShLECWamJ9vH6n30fQzG+3+m1+9wVzDhGFfRZcC4zbk8+SmckSvdaQ==
X-Received: by 2002:a5d:674b:: with SMTP id l11mr25271386wrw.357.1629898905292;
        Wed, 25 Aug 2021 06:41:45 -0700 (PDT)
Received: from localhost.localdomain ([79.98.113.233])
        by smtp.gmail.com with ESMTPSA id g5sm7185861wrq.80.2021.08.25.06.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 06:41:44 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sam Protsenko <semen.protsenko@linaro.org>
Subject: [PATCH v3 5/8] dt-bindings: clock: samsung: convert Exynos4 to dtschema
Date:   Wed, 25 Aug 2021 15:40:53 +0200
Message-Id: <20210825134056.219884-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825134056.219884-1-krzysztof.kozlowski@canonical.com>
References: <20210825134056.219884-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Merge Exynos4210 and Exynos4412 clock controller bindings to existing DT
schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/clock/exynos4-clock.txt          | 86 -------------------
 .../bindings/clock/samsung,exynos-clock.yaml  |  3 +
 .../clock/samsung,exynos4412-isp-clock.yaml   | 64 ++++++++++++++
 3 files changed, 67 insertions(+), 86 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/exynos4-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos4412-isp-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/exynos4-clock.txt b/Documentation/devicetree/bindings/clock/exynos4-clock.txt
deleted file mode 100644
index 17bb11365354..000000000000
--- a/Documentation/devicetree/bindings/clock/exynos4-clock.txt
+++ /dev/null
@@ -1,86 +0,0 @@
-* Samsung Exynos4 Clock Controller
-
-The Exynos4 clock controller generates and supplies clock to various controllers
-within the Exynos4 SoC. The clock binding described here is applicable to all
-SoC's in the Exynos4 family.
-
-Required Properties:
-
-- compatible: should be one of the following.
-  - "samsung,exynos4210-clock" - controller compatible with Exynos4210 SoC.
-  - "samsung,exynos4412-clock" - controller compatible with Exynos4412 SoC.
-
-- reg: physical base address of the controller and length of memory mapped
-  region.
-
-- #clock-cells: should be 1.
-
-Each clock is assigned an identifier and client nodes can use this identifier
-to specify the clock which they consume.
-
-All available clocks are defined as preprocessor macros in
-dt-bindings/clock/exynos4.h header and can be used in device
-tree sources.
-
-Example 1: An example of a clock controller node is listed below.
-
-	clock: clock-controller@10030000 {
-		compatible = "samsung,exynos4210-clock";
-		reg = <0x10030000 0x20000>;
-		#clock-cells = <1>;
-	};
-
-Example 2: UART controller node that consumes the clock generated by the clock
-	   controller. Refer to the standard clock bindings for information
-	   about 'clocks' and 'clock-names' property.
-
-	serial@13820000 {
-		compatible = "samsung,exynos4210-uart";
-		reg = <0x13820000 0x100>;
-		interrupts = <0 54 0>;
-		clocks = <&clock CLK_UART2>, <&clock CLK_SCLK_UART2>;
-		clock-names = "uart", "clk_uart_baud0";
-	};
-
-Exynos4412 SoC contains some additional clocks for FIMC-ISP (Camera ISP)
-subsystem. Registers for those clocks are located in the ISP power domain.
-Because those registers are also located in a different memory region than
-the main clock controller, a separate clock controller has to be defined for
-handling them.
-
-Required Properties:
-
-- compatible: should be "samsung,exynos4412-isp-clock".
-
-- reg: physical base address of the ISP clock controller and length of memory
-  mapped region.
-
-- #clock-cells: should be 1.
-
-- clocks: list of the clock controller input clock identifiers,
-  from common clock bindings, should point to CLK_ACLK200 and
-  CLK_ACLK400_MCUISP clocks from the main clock controller.
-
-- clock-names: list of the clock controller input clock names,
-  as described in clock-bindings.txt, should be "aclk200" and
-  "aclk400_mcuisp".
-
-- power-domains: a phandle to ISP power domain node as described by
-  generic PM domain bindings.
-
-Example 3: The clock controllers bindings for Exynos4412 SoCs.
-
-	clock: clock-controller@10030000 {
-		compatible = "samsung,exynos4412-clock";
-		reg = <0x10030000 0x18000>;
-		#clock-cells = <1>;
-	};
-
-	isp_clock: clock-controller@10048000 {
-		compatible = "samsung,exynos4412-isp-clock";
-		reg = <0x10048000 0x1000>;
-		#clock-cells = <1>;
-		power-domains = <&pd_isp>;
-		clocks = <&clock CLK_ACLK200>, <&clock CLK_ACLK400_MCUISP>;
-		clock-names = "aclk200", "aclk400_mcuisp";
-	};
diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
index 9af77bdee12d..4e8062860986 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
@@ -23,6 +23,8 @@ properties:
           - samsung,exynos3250-cmu
           - samsung,exynos3250-cmu-dmc
           - samsung,exynos3250-cmu-isp
+          - samsung,exynos4210-clock
+          - samsung,exynos4412-clock
           - samsung,exynos5250-clock
       - items:
           - enum:
@@ -31,6 +33,7 @@ properties:
           - const: syscon
 
   clocks:
+    minItems: 1
     maxItems: 4
 
   "#clock-cells":
diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos4412-isp-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos4412-isp-clock.yaml
new file mode 100644
index 000000000000..7b405bcd6fef
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos4412-isp-clock.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/samsung,exynos4412-isp-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos4412 SoC ISP clock controller
+
+maintainers:
+  - Chanwoo Choi <cw00.choi@samsung.com>
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+  - Tomasz Figa <tomasz.figa@gmail.com>
+
+description: |
+  Clock controller for Samsung Exynos4412 SoC FIMC-ISP (Camera ISP)
+  All available clocks are defined as preprocessor macros in
+  dt-bindings/clock/ headers.
+
+properties:
+  compatible:
+    const: samsung,exynos4412-isp-clock
+
+  clocks:
+    items:
+      - description: CLK_ACLK200 from the main clock controller
+      - description: CLK_ACLK400_MCUISP from the main clock controller
+
+  clock-names:
+    items:
+      - const: aclk200
+      - const: aclk400_mcuisp
+
+  "#clock-cells":
+    const: 1
+
+  power-domains:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clocks
+  - clock-names
+  - power-domains
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/exynos4412.h>
+    clock-controller@10048000 {
+        compatible = "samsung,exynos4412-isp-clock";
+        reg = <0x10048000 0x1000>;
+        #clock-cells = <1>;
+        power-domains = <&pd_isp>;
+        clocks = <&clock CLK_ACLK200>, <&clock CLK_ACLK400_MCUISP>;
+        clock-names = "aclk200", "aclk400_mcuisp";
+    };
+
-- 
2.30.2

