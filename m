Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D388C43216
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Aug 2021 13:43:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 063F7610F8
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Aug 2021 13:43:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239377AbhHYNoa (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 25 Aug 2021 09:44:30 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:58782
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239386AbhHYNoV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Aug 2021 09:44:21 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8DFE34077F
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Aug 2021 13:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629899014;
        bh=6Oi8aMYH49du136AxXJWUYSctxKNAWuugX+uDt3wf4I=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=vBgSi6loAHXTJT7ob5gdcCWRvJqw2Vu6uEGFmeOgYT3put8Hfts5NsEO5H3JFjqY8
         bJ8cgZU9TW2fVyaWvjoewjPXAGJr3lmZ/1N8c8FLKTXUka6XZORgI2fWvyX/Zto54R
         vy7J+xh5TvEyyxV50dWEM1B5fgfpiuQKhV/B6JZSqGSN+5hyqis+oYBlxhr/r9VVoO
         vF669tFN5YTRjGrGxPn6mVQSd8ON11nVC5P628d2rczB+c0ePN/sgz6zdou/TS0Opv
         nqA2HhLRQD4M0v6eLbSGJuE8x5v8BaNtvzT6ELQdQf+kuuo78h20wkkpUHaXUB9nB3
         A+/6+8DlgLHVw==
Received: by mail-wr1-f70.google.com with SMTP id t15-20020a5d42cf000000b001565f9c9ee8so6663443wrr.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Aug 2021 06:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6Oi8aMYH49du136AxXJWUYSctxKNAWuugX+uDt3wf4I=;
        b=ifKQJO0CV3Cnj7gz1szFJCI0o7g7+hRjW/Did1qBSMsczBPinecJSomAXUr6SJcGCc
         YsvhjE7tYL/j0J2qwXrymJldNTOIK1LxAACcd3VIMDmYUA9iCB7xkh0igCjYJl2knRoZ
         Rw1ngyUdNjJPD10dLyyl17DSU80zpVtDM2yadiXlAvlGvwUgcU/lwq6JvNDVKrfws4MC
         HbgCMsUoxONQHMqYajFBAjeAtG2Zi6aTPajZzQv+GKSxaXtujpo7f6ncIAx74X6AwDBW
         k8fokttfRAQw6jcLh1++2/is1CHjhBlKs34/7l2VB6CyDuOwEftOi1+EUUfzpfJNZxY9
         HKew==
X-Gm-Message-State: AOAM533PgXIIOM3XC1cfb09/InJIQ/uxFtj3wBV3wsjMY7f1SZ3KFXg4
        W6KpRMnapTpueltNTS+BRpznBexl1BDNJuWu0u76arCBigvZvcJjIbwwZx8TB5bl2vuzZiNqSTA
        +fZElW4HmMpIOAKIq612Vtdh4UPtjx2Zs+YXa8PkOq5eKewqk
X-Received: by 2002:a05:600c:4786:: with SMTP id k6mr6645059wmo.177.1629899014293;
        Wed, 25 Aug 2021 06:43:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3omNkTbXHLeYkOP/1g8GWU/k3FQUTvU2cs0nMgnl6BM7NsaO0Xb3yuJb6pvrt7fcxdOgelg==
X-Received: by 2002:a05:600c:4786:: with SMTP id k6mr6645038wmo.177.1629899014112;
        Wed, 25 Aug 2021 06:43:34 -0700 (PDT)
Received: from localhost.localdomain ([79.98.113.172])
        by smtp.gmail.com with ESMTPSA id w9sm5238954wmc.19.2021.08.25.06.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 06:43:33 -0700 (PDT)
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
Subject: [PATCH v3 7/8] dt-bindings: clock: samsung: convert S5Pv210 AudSS to dtschema
Date:   Wed, 25 Aug 2021 15:42:50 +0200
Message-Id: <20210825134251.220098-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825134056.219884-6-krzysztof.kozlowski@canonical.com>
References: <20210825134056.219884-6-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert Samsung S5Pv210 Audio SubSystem clock controller bindings to DT
schema format using json-schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

---

Changes since v1:
1. Include header to fix clock IDs error in example.
---
 .../bindings/clock/clk-s5pv210-audss.txt      | 53 -------------
 .../clock/samsung,s5pv210-audss-clock.yaml    | 78 +++++++++++++++++++
 2 files changed, 78 insertions(+), 53 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/clk-s5pv210-audss.txt
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,s5pv210-audss-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/clk-s5pv210-audss.txt b/Documentation/devicetree/bindings/clock/clk-s5pv210-audss.txt
deleted file mode 100644
index f6272dcd96f4..000000000000
--- a/Documentation/devicetree/bindings/clock/clk-s5pv210-audss.txt
+++ /dev/null
@@ -1,53 +0,0 @@
-* Samsung Audio Subsystem Clock Controller
-
-The Samsung Audio Subsystem clock controller generates and supplies clocks
-to Audio Subsystem block available in the S5PV210 and compatible SoCs.
-
-Required Properties:
-
-- compatible: should be "samsung,s5pv210-audss-clock".
-- reg: physical base address and length of the controller's register set.
-
-- #clock-cells: should be 1.
-
-- clocks:
-  - hclk: AHB bus clock of the Audio Subsystem.
-  - xxti: Optional fixed rate PLL reference clock, parent of mout_audss. If
-    not specified (i.e. xusbxti is used for PLL reference), it is fixed to
-    a clock named "xxti".
-  - fout_epll: Input PLL to the AudioSS block, parent of mout_audss.
-  - iiscdclk0: Optional external i2s clock, parent of mout_i2s. If not
-    specified, it is fixed to a clock named "iiscdclk0".
-  - sclk_audio0: Audio bus clock, parent of mout_i2s.
-
-- clock-names: Aliases for the above clocks. They should be "hclk",
-  "xxti", "fout_epll", "iiscdclk0", and "sclk_audio0" respectively.
-
-All available clocks are defined as preprocessor macros in
-dt-bindings/clock/s5pv210-audss-clk.h header and can be used in device
-tree sources.
-
-Example: Clock controller node.
-
-	clk_audss: clock-controller@c0900000 {
-		compatible = "samsung,s5pv210-audss-clock";
-		reg = <0xc0900000 0x1000>;
-		#clock-cells = <1>;
-		clock-names = "hclk", "xxti",
-				"fout_epll", "sclk_audio0";
-		clocks = <&clocks DOUT_HCLKP>, <&xxti>,
-				<&clocks FOUT_EPLL>, <&clocks SCLK_AUDIO0>;
-	};
-
-Example: I2S controller node that consumes the clock generated by the clock
-	 controller. Refer to the standard clock bindings for information
-         about 'clocks' and 'clock-names' property.
-
-	i2s0: i2s@3830000 {
-		/* ... */
-		clock-names = "iis", "i2s_opclk0",
-				"i2s_opclk1";
-		clocks = <&clk_audss CLK_I2S>, <&clk_audss CLK_I2S>,
-				<&clk_audss CLK_DOUT_AUD_BUS>;
-		/* ... */
-	};
diff --git a/Documentation/devicetree/bindings/clock/samsung,s5pv210-audss-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,s5pv210-audss-clock.yaml
new file mode 100644
index 000000000000..ae8f8fc93233
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/samsung,s5pv210-audss-clock.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/samsung,s5pv210-audss-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5Pv210 SoC Audio SubSystem clock controller
+
+maintainers:
+  - Chanwoo Choi <cw00.choi@samsung.com>
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+  - Tomasz Figa <tomasz.figa@gmail.com>
+
+description: |
+  All available clocks are defined as preprocessor macros in
+  include/dt-bindings/clock/s5pv210-audss.h header.
+
+properties:
+  compatible:
+    const: samsung,s5pv210-audss-clock
+
+  clocks:
+    minItems: 4
+    items:
+      - description:
+          AHB bus clock of the Audio Subsystem.
+      - description:
+          Optional fixed rate PLL reference clock, parent of mout_audss. If not
+          specified (i.e. xusbxti is used for PLL reference), it is fixed to a
+          clock named "xxti".
+      - description:
+          Input PLL to the AudioSS block, parent of mout_audss.
+      - description:
+          Audio bus clock, parent of mout_i2s.
+      - description:
+          Optional external i2s clock, parent of mout_i2s. If not specified, it
+          is fixed to a clock named "iiscdclk0".
+
+  clock-names:
+    minItems: 4
+    items:
+      - const: hclk
+      - const: xxti
+      - const: fout_epll
+      - const: sclk_audio0
+      - const: iiscdclk0
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
+  - clocks
+  - clock-names
+  - "#clock-cells"
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/s5pv210.h>
+
+    clock-controller@c0900000 {
+        compatible = "samsung,s5pv210-audss-clock";
+        reg = <0xc0900000 0x1000>;
+        #clock-cells = <1>;
+        clock-names = "hclk", "xxti", "fout_epll", "sclk_audio0";
+        clocks = <&clocks DOUT_HCLKP>, <&xxti>, <&clocks FOUT_EPLL>,
+                 <&clocks SCLK_AUDIO0>;
+    };
-- 
2.30.2

