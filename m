Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E6EC4338F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Aug 2021 09:32:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A949260EBD
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Aug 2021 09:32:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239185AbhHJJdE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 10 Aug 2021 05:33:04 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:42604
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239132AbhHJJc6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Aug 2021 05:32:58 -0400
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id B1FE840C87
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Aug 2021 09:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628587955;
        bh=dzZFzylzg3F3zI37wlmtXpLIjYf2xoTR0tAEuDbeS0g=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=qfdwh4Uw1I1iwCaYm4BuFedui3+JSXWJX7CpMBMJL+bGpvnURVr1Gb4m2Mqy19T+n
         9G5omdejC3ovsTvrks6ypnjUas93fKxl9kybt1ESFT44hFfe4Qxesz//pRicA4dcy7
         gvit9SlCBqcTHzGvhNXXWcXFSBVVjbgvbOKp2RMoCSHVteSNfW7/dcyaPPSGAPbNoF
         d1LKwV/XvUbzl6ugwmo/0Q6BWDcEFYdyoY5Yrbrg5gVDE+rzd9jpPxWk/lPky2ZtPH
         rwjYZVnOxJ1bGUZWt88vor/7zLBVzq7P8mUsaE6IJPkqQU4DpfThoR9xEnh/BDxx+r
         jQqwAeIxiY5bw==
Received: by mail-ej1-f72.google.com with SMTP id ci25-20020a1709072679b029058e79f6c38aso5364762ejc.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Aug 2021 02:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dzZFzylzg3F3zI37wlmtXpLIjYf2xoTR0tAEuDbeS0g=;
        b=bZrUZ6OxX5d6Rc8AzbxkEDNh1mIh4qN29VtIr1JeVOwLFleClj/VfzzMY0R1vbeZn5
         Oo99sCnqOT7YkVHM2Gwd7Vup1LaSAk8ePGmTu+UFgwmpaMR/PgDJyQeWUkSWsKqOjDCE
         QIaUYCWUeAgSEMYmh1VOLxvrqvgsRNIeXOBavD3Gl1qSWU/7iCChzBaDZuk+WGy5nakP
         QkT5nkO+5hIu94ozeAVZKoWCk5XFAhLGeHxD6LbkEqhfN+dv4DaNN2fC9PKoO7/o/b/W
         oopdAnFMt1FN3uQibJFm0yRhhRMkVdM8N9RZtOBcX0wWxL3MHAkqal5BSezJ+Z2BaGbb
         hRUw==
X-Gm-Message-State: AOAM531A1muu/UjN9jP2z6lWgoXWh7JwkhRgqyqjR7DDPAMf15vWw9jd
        gSCPE9ItgH21xAsNlTdIhGBjhrdxK3Vg6n3jrn8V2MHiqComI3A8i4UnXgCZz5tzuFFre+9h1PB
        Pq7rUpqHronYxL0s8XXjiuUSc7M+7s4AJTOqafbUeJbj/kIX3
X-Received: by 2002:a50:c092:: with SMTP id k18mr3753905edf.361.1628587955432;
        Tue, 10 Aug 2021 02:32:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcNz5OqFqyLa6g5qdnWzglyKsJtmCYOkyDNRcXPccZgMZQBOQvLvVcC7LWiyY1SnbqjclLsg==
X-Received: by 2002:a50:c092:: with SMTP id k18mr3753876edf.361.1628587955253;
        Tue, 10 Aug 2021 02:32:35 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id q21sm5117606ejs.43.2021.08.10.02.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 02:32:34 -0700 (PDT)
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
Subject: [PATCH v2 6/8] dt-bindings: clock: samsung: convert Exynos AudSS to dtschema
Date:   Tue, 10 Aug 2021 11:31:43 +0200
Message-Id: <20210810093145.26153-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210810093145.26153-1-krzysztof.kozlowski@canonical.com>
References: <20210810093145.26153-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert Samsung Exynos Audio SubSystem clock controller bindings to DT
schema format using json-schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/clock/clk-exynos-audss.txt       | 103 ------------------
 .../clock/samsung,exynos-audss-clock.yaml     |  79 ++++++++++++++
 2 files changed, 79 insertions(+), 103 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/clk-exynos-audss.txt
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos-audss-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/clk-exynos-audss.txt b/Documentation/devicetree/bindings/clock/clk-exynos-audss.txt
deleted file mode 100644
index 6030afb10b5c..000000000000
--- a/Documentation/devicetree/bindings/clock/clk-exynos-audss.txt
+++ /dev/null
@@ -1,103 +0,0 @@
-* Samsung Audio Subsystem Clock Controller
-
-The Samsung Audio Subsystem clock controller generates and supplies clocks
-to Audio Subsystem block available in the S5PV210 and Exynos SoCs. The clock
-binding described here is applicable to all SoCs in Exynos family.
-
-Required Properties:
-
-- compatible: should be one of the following:
-  - "samsung,exynos4210-audss-clock" - controller compatible with all Exynos4 SoCs.
-  - "samsung,exynos5250-audss-clock" - controller compatible with Exynos5250
-    SoCs.
-  - "samsung,exynos5410-audss-clock" - controller compatible with Exynos5410
-    SoCs.
-  - "samsung,exynos5420-audss-clock" - controller compatible with Exynos5420
-    SoCs.
-- reg: physical base address and length of the controller's register set.
-
-- #clock-cells: should be 1.
-
-- clocks:
-  - pll_ref: Fixed rate PLL reference clock, parent of mout_audss. "fin_pll"
-    is used if not specified.
-  - pll_in: Input PLL to the AudioSS block, parent of mout_audss. "fout_epll"
-    is used if not specified.
-  - cdclk: External i2s clock, parent of mout_i2s. "cdclk0" is used if not
-    specified.
-  - sclk_audio: Audio bus clock, parent of mout_i2s. "sclk_audio0" is used if
-    not specified.
-  - sclk_pcm_in: PCM clock, parent of sclk_pcm.  "sclk_pcm0" is used if not
-    specified.
-
-- clock-names: Aliases for the above clocks. They should be "pll_ref",
-  "pll_in", "cdclk", "sclk_audio", and "sclk_pcm_in" respectively.
-
-Optional Properties:
-
-  - power-domains: a phandle to respective power domain node as described by
-    generic PM domain bindings (see power/power_domain.txt for more
-    information).
-
-The following is the list of clocks generated by the controller. Each clock is
-assigned an identifier and client nodes use this identifier to specify the
-clock which they consume. Some of the clocks are available only on a particular
-Exynos4 SoC and this is specified where applicable.
-
-Provided clocks:
-
-Clock           ID      SoC (if specific)
------------------------------------------------
-
-mout_audss      0
-mout_i2s        1
-dout_srp        2
-dout_aud_bus    3
-dout_i2s        4
-srp_clk         5
-i2s_bus         6
-sclk_i2s        7
-pcm_bus         8
-sclk_pcm        9
-adma            10      Exynos5420
-
-Example 1: An example of a clock controller node using the default input
-	   clock names is listed below.
-
-clock_audss: audss-clock-controller@3810000 {
-	compatible = "samsung,exynos5250-audss-clock";
-	reg = <0x03810000 0x0C>;
-	#clock-cells = <1>;
-};
-
-Example 2: An example of a clock controller node with the input clocks
-           specified.
-
-clock_audss: audss-clock-controller@3810000 {
-	compatible = "samsung,exynos5250-audss-clock";
-	reg = <0x03810000 0x0C>;
-	#clock-cells = <1>;
-	clocks = <&clock 1>, <&clock 7>, <&clock 138>, <&clock 160>,
-		<&ext_i2s_clk>;
-	clock-names = "pll_ref", "pll_in", "sclk_audio", "sclk_pcm_in", "cdclk";
-};
-
-Example 3: I2S controller node that consumes the clock generated by the clock
-           controller. Refer to the standard clock bindings for information
-           about 'clocks' and 'clock-names' property.
-
-i2s0: i2s@3830000 {
-	compatible = "samsung,i2s-v5";
-	reg = <0x03830000 0x100>;
-	dmas = <&pdma0 10
-		&pdma0 9
-		&pdma0 8>;
-	dma-names = "tx", "rx", "tx-sec";
-	clocks = <&clock_audss EXYNOS_I2S_BUS>,
-		<&clock_audss EXYNOS_I2S_BUS>,
-		<&clock_audss EXYNOS_SCLK_I2S>,
-		<&clock_audss EXYNOS_MOUT_AUDSS>,
-		<&clock_audss EXYNOS_MOUT_I2S>;
-	clock-names = "iis", "i2s_opclk0", "i2s_opclk1",
-		      "mout_audss", "mout_i2s";
-};
diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos-audss-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos-audss-clock.yaml
new file mode 100644
index 000000000000..d60b29fa22e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos-audss-clock.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/samsung,exynos-audss-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos SoC Audio SubSystem clock controller
+
+maintainers:
+  - Chanwoo Choi <cw00.choi@samsung.com>
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+  - Tomasz Figa <tomasz.figa@gmail.com>
+
+description: |
+  All available clocks are defined as preprocessor macros in
+  include/dt-bindings/clock/exynos-audss-clk.h header.
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos4210-audss-clock
+      - samsung,exynos5250-audss-clock
+      - samsung,exynos5410-audss-clock
+      - samsung,exynos5420-audss-clock
+
+  clocks:
+    minItems: 2
+    items:
+      - description:
+          Fixed rate PLL reference clock, parent of mout_audss. "fin_pll" is
+          used if not specified.
+      - description:
+          Input PLL to the AudioSS block, parent of mout_audss. "fout_epll" is
+          used if not specified.
+      - description:
+          Audio bus clock, parent of mout_i2s. "sclk_audio0" is used if not
+          specified.
+      - description:
+          PCM clock, parent of sclk_pcm.  "sclk_pcm0" is used if not specified.
+      - description:
+          External i2s clock, parent of mout_i2s. "cdclk0" is used if not
+          specified.
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: pll_ref
+      - const: pll_in
+      - const: sclk_audio
+      - const: sclk_pcm_in
+      - const: cdclk
+
+  "#clock-cells":
+    const: 1
+
+  power-domains: true
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
+    clock-controller@3810000 {
+        compatible = "samsung,exynos5250-audss-clock";
+        reg = <0x03810000 0x0c>;
+        #clock-cells = <1>;
+        clocks = <&clock 1>, <&clock 7>, <&clock 138>, <&clock 160>, <&ext_i2s_clk>;
+        clock-names = "pll_ref", "pll_in", "sclk_audio", "sclk_pcm_in", "cdclk";
+    };
-- 
2.30.2

