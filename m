Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1BF8C4338F
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Aug 2021 12:07:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9A3360240
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Aug 2021 12:07:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234509AbhHIMHz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 9 Aug 2021 08:07:55 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:45214
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233471AbhHIMHy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Aug 2021 08:07:54 -0400
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id A03E03F04D
        for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Aug 2021 12:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628510853;
        bh=2daM3RukL8uFtRevasOftGMEg/bNtv3suJb8BFZCflI=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=HrJXgGxQbNRB/JIy3TLD9IYpDCAdMOkQC+uEfu87uJaeWcrn04AgoTPn7s6U1CSF/
         5Ddc96djkSQupaf4no/BNja2RdIkWkUSxh8yypCnuVCqc85x2wdDsVHyzCItYUNuFN
         tOfcjCwuruhydHqVTnKaohK5EdVH/sF6v0S0iQuiCQ9iq6z60u6jpYjfvXl9oifRKY
         iz03B4aaBVbY6/q2xwDcOQGvcjNVoHEiXyffQEXNGHFW3WwFuOBlWjN4AAHuklMOct
         yIvtOftxY13LDZeGpWiN5lbXINWzBaOdgCL+w4bROBVdd51uSofaHdRRquBqoBU02m
         9Rthojrkn0eCg==
Received: by mail-ej1-f72.google.com with SMTP id k22-20020a1709061596b02905a370b2f477so4436105ejd.17
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Aug 2021 05:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2daM3RukL8uFtRevasOftGMEg/bNtv3suJb8BFZCflI=;
        b=StEpGuJpUxbVfx7jtDH15ZxnMUAgTuxo3PoUooVsdbE7fHgGsgMitvQ8AhiVxZmEL7
         b4DLxjzFXI7rZW85B8ksMuBeI2zfoBiXZROJtpdLOA12WePq6cz0mOmBPXqPwu//HdTT
         X1u5Fxzb/VOl/NJjo5Czc6Jg3M8ikR2nIjqh8I/0MxQqiUUGqVBK7nUecyx6FNu6gU9G
         yVI0v0uLSRgFTfkLYR6ZkF65KcVfK2y9MDmDAGKEhk5Pmxa3agxekwGyT1dEbiFSIrL4
         I96rVWytEV0TJU7TGfVlJ556D8T13kPbyKxFXTX3pjxXIOkT8weUVeAQz8Xyl9k+rMCs
         F2Tw==
X-Gm-Message-State: AOAM531YVQT+vgA747HgOiBkHuASDZbClFUPoM9/XuP2jaWFdPI4a74i
        /gx3cAdiX6JzRJArMPJTy7ZzFj4nztG5ZmaGrB/Wz3GFhv3YqygYmSeVSsBelwD/wAW+xdvKl0E
        nTty/Saf4Vd9sygV54QsdEc557o1G92rs5SLB8sTJrSUepSF4
X-Received: by 2002:a17:906:d52:: with SMTP id r18mr21995414ejh.47.1628510853332;
        Mon, 09 Aug 2021 05:07:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOfuGtnOAZvjuBVRJBY5cSEj1w1cOneBCKbYYYklM3mbay8F5lsgcyWvB6Nbuj78CYpk7/Ag==
X-Received: by 2002:a17:906:d52:: with SMTP id r18mr21995394ejh.47.1628510853144;
        Mon, 09 Aug 2021 05:07:33 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id i6sm8084863edt.28.2021.08.09.05.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 05:07:32 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Sam Protsenko <semen.protsenko@linaro.org>
Subject: [PATCH 1/3] dt-bindings: clock: samsung: convert Exynos5250 to dtschema
Date:   Mon,  9 Aug 2021 14:05:42 +0200
Message-Id: <20210809120544.56596-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert Samsung Exynos5250 clock controller bindings to DT schema format
using json-schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/clock/exynos5250-clock.txt       | 41 ----------------
 .../bindings/clock/samsung,exynos-clock.yaml  | 48 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 3 files changed, 49 insertions(+), 41 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/exynos5250-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
deleted file mode 100644
index aff266a12eeb..000000000000
--- a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-* Samsung Exynos5250 Clock Controller
-
-The Exynos5250 clock controller generates and supplies clock to various
-controllers within the Exynos5250 SoC.
-
-Required Properties:
-
-- compatible: should be one of the following.
-  - "samsung,exynos5250-clock" - controller compatible with Exynos5250 SoC.
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
-dt-bindings/clock/exynos5250.h header and can be used in device
-tree sources.
-
-Example 1: An example of a clock controller node is listed below.
-
-	clock: clock-controller@10010000 {
-		compatible = "samsung,exynos5250-clock";
-		reg = <0x10010000 0x30000>;
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
diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
new file mode 100644
index 000000000000..cd6567bd8cc7
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/samsung,exynos-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos SoC clock controller
+
+maintainers:
+  - Chanwoo Choi <cw00.choi@samsung.com>
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+  - Tomasz Figa <tomasz.figa@gmail.com>
+
+description: |
+  All available clocks are defined as preprocessor macros in
+  dt-bindings/clock/ headers.
+
+properties:
+  compatible:
+    const: samsung,exynos5250-clock
+
+  assigned-clocks: true
+  assigned-clock-parents: true
+  assigned-clock-rates: true
+  clocks: true
+
+  "#clock-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - "#clock-cells"
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/exynos5250.h>
+    clock: clock-controller@10010000 {
+        compatible = "samsung,exynos5250-clock";
+        reg = <0x10010000 0x30000>;
+        #clock-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 36aee8517ab0..2dbacacac3f5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16491,6 +16491,7 @@ L:	linux-samsung-soc@vger.kernel.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git
 F:	Documentation/devicetree/bindings/clock/exynos*.txt
+F:	Documentation/devicetree/bindings/clock/samsung,*.yaml
 F:	Documentation/devicetree/bindings/clock/samsung,s3c*
 F:	Documentation/devicetree/bindings/clock/samsung,s5p*
 F:	drivers/clk/samsung/
-- 
2.30.2

