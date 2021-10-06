Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30E7C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 13:24:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADD9361131
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 13:24:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238905AbhJFN0W (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Oct 2021 09:26:22 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:51992
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238865AbhJFN0H (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Oct 2021 09:26:07 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AA21B3FFF3
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Oct 2021 13:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633526644;
        bh=ktFuN96O+SkQ9U9ivvpVkeGd10Od2JgvJaQPCbFsKEg=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=eucl83sIGb9Lzp9k/Etmwpo9aJO5ij7b6W8Lo3HHyA9JKy2FZ9Ww6j14bdLzNQ+LJ
         xm7qza8jurayn/Ll9leEcdvmRvJnb+xxIPFJ3nqjFLdAbkDK+sBbSnOVvLte7BKKFr
         CGFh468XVmH6IJDBes1lY6g5quz49l7VgRbqq37ax6++lXtiH2gxZA2LCOlnCsb/pd
         2UfyVHEAVVVqw5LRd4lRFNiB72qB7RmttGE4dzdR+hoP1JCXMzQC877LysOTLsnwoA
         WNwT3PEWNxwAxWIiAHXzeSWeynFEqa7+JIcfPAPmD6FSwDKwdkJgGEol9oaIA++Wz3
         dFIfceFz4d1lA==
Received: by mail-lf1-f69.google.com with SMTP id n22-20020a0565120ad600b003fcc09af59fso1950888lfu.21
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Oct 2021 06:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ktFuN96O+SkQ9U9ivvpVkeGd10Od2JgvJaQPCbFsKEg=;
        b=D/Rb5i5Hng1+sWyTdAwzsH/L7cGH9mumQk1pyc17WnkFAxOFwtLL1f3dq538aUQSWS
         BmX8Bx4mVacTwfwmitAuzrtHk9yqw1Z4bFFv+YaHpQ7gOtO4tECmWPnhxfppTDwIeKvW
         uEsRTp0YCpEE355qVFsTfho3sTvNtsAE8o2qglmHrYnyooHzphRPLWkYpkogLhv6aJsK
         49CYiDwTaZBYZ7uxRi9LS/u54HqCGV8ZfkItIzT6vX+kLUq31bKuh42bLm/naGRwHC6N
         UAVzLaF//IHkZ6PA8291FfO+iWR/5r91P/JE7zOCGXNHoi2s1s2+s6271bHa69QFhpi4
         H4eA==
X-Gm-Message-State: AOAM532kaODs6e18evLTtOlkNyQl5syL0RINWsH709Uk5IgDISEFSa3U
        2r44NNLS0KAoXaYLwVToybaId0/ecWfzGgUYvrEdVyVpcTOHGBpWHuferY34LhQfYxsCdpc0Oem
        PM7dbXOYaDckD6CLL7dFN2Tx5FwjtXIlV91+j+QS7x+RFK/ZB
X-Received: by 2002:a2e:574b:: with SMTP id r11mr27877894ljd.447.1633526644022;
        Wed, 06 Oct 2021 06:24:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1LK3IVhFjzStJbc8UnW2i1pWdVxMgrV4S5na6tQiX69KzhJT5b44+QIwfnAT9IIycK3OLzw==
X-Received: by 2002:a2e:574b:: with SMTP id r11mr27877872ljd.447.1633526643782;
        Wed, 06 Oct 2021 06:24:03 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y12sm2002819lfg.115.2021.10.06.06.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 06:24:03 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>
Subject: [PATCH v3 03/10] dt-bindings: clock: samsung,s2mps11: convert to dtschema
Date:   Wed,  6 Oct 2021 15:23:17 +0200
Message-Id: <20211006132324.76008-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006132324.76008-1-krzysztof.kozlowski@canonical.com>
References: <20211006132324.76008-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert the clock provider of Samsung S2MPS11 family of PMICs to DT
schema format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/clock/samsung,s2mps11.txt        | 49 -------------------
 .../bindings/clock/samsung,s2mps11.yaml       | 45 +++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 46 insertions(+), 50 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/samsung,s2mps11.txt
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml

diff --git a/Documentation/devicetree/bindings/clock/samsung,s2mps11.txt b/Documentation/devicetree/bindings/clock/samsung,s2mps11.txt
deleted file mode 100644
index 2726c1d58a79..000000000000
--- a/Documentation/devicetree/bindings/clock/samsung,s2mps11.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-Binding for Samsung S2M and S5M family clock generator block
-============================================================
-
-This is a part of device tree bindings for S2M and S5M family multi-function
-devices.
-More information can be found in bindings/mfd/sec-core.txt file.
-
-The S2MPS11/13/15 and S5M8767 provide three(AP/CP/BT) buffered 32.768 kHz
-outputs. The S2MPS14 provides two (AP/BT) buffered 32.768 KHz outputs.
-
-To register these as clocks with common clock framework instantiate under
-main device node a sub-node named "clocks".
-
-It uses the common clock binding documented in:
- - Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-
-Required properties of the "clocks" sub-node:
- - #clock-cells: should be 1.
- - compatible: Should be one of: "samsung,s2mps11-clk", "samsung,s2mps13-clk",
-               "samsung,s2mps14-clk", "samsung,s5m8767-clk"
-   The S2MPS15 uses the same compatible as S2MPS13, as both provides similar
-   clocks.
-
-
-Each clock is assigned an identifier and client nodes use this identifier
-to specify the clock which they consume.
-    Clock               ID           Devices
-    ----------------------------------------------------------
-    32KhzAP		0            S2MPS11/13/14/15, S5M8767
-    32KhzCP		1            S2MPS11/13/15, S5M8767
-    32KhzBT		2            S2MPS11/13/14/15, S5M8767
-
-Include dt-bindings/clock/samsung,s2mps11.h file to use preprocessor defines
-in device tree sources.
-
-
-Example:
-
-	s2mps11_pmic@66 {
-		compatible = "samsung,s2mps11-pmic";
-		reg = <0x66>;
-
-		s2m_osc: clocks {
-			compatible = "samsung,s2mps11-clk";
-			#clock-cells = <1>;
-			clock-output-names = "xx", "yy", "zz";
-		};
-	};
diff --git a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
new file mode 100644
index 000000000000..1410c51e0e7d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/samsung,s2mps11.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2M and S5M family clock generator block
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  This is a part of device tree bindings for S2M and S5M family of Power
+  Management IC (PMIC).
+
+  The S2MPS11/13/15 and S5M8767 provide three(AP/CP/BT) buffered 32.768 kHz
+  outputs. The S2MPS14 provides two (AP/BT) buffered 32.768 KHz outputs.
+
+  All available clocks are defined as preprocessor macros in
+  dt-bindings/clock/samsung,s2mps11.h header.
+
+  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
+  additional information and example.
+
+properties:
+  compatible:
+    enum:
+      - samsung,s2mps11-clk
+      - samsung,s2mps13-clk # S2MPS13 and S2MPS15
+      - samsung,s2mps14-clk
+      - samsung,s5m8767-clk
+
+  "#clock-cells":
+    const: 1
+
+  clock-output-names:
+    minItems: 3
+    maxItems: 3
+    description: Names for AP, CP and BT clocks.
+
+required:
+  - compatible
+  - "#clock-cells"
+
+additionalProperties: false
diff --git a/MAINTAINERS b/MAINTAINERS
index ad3c3666adeb..2c66ae863996 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16599,7 +16599,7 @@ M:	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
 L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Supported
-F:	Documentation/devicetree/bindings/clock/samsung,s2mps11.txt
+F:	Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
 F:	Documentation/devicetree/bindings/mfd/samsung,sec-core.txt
 F:	Documentation/devicetree/bindings/regulator/samsung,s2m*.txt
 F:	Documentation/devicetree/bindings/regulator/samsung,s5m*.txt
-- 
2.30.2

