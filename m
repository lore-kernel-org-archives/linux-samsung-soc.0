Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFFCBC43214
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Aug 2021 14:00:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9190A610EA
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Aug 2021 14:00:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234719AbhHIOAr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 9 Aug 2021 10:00:47 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:53160
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234665AbhHIOAr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Aug 2021 10:00:47 -0400
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id D0D4840676
        for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Aug 2021 14:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628517625;
        bh=dzZFzylzg3F3zI37wlmtXpLIjYf2xoTR0tAEuDbeS0g=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=LBKtjRjYLQug7d7JKwKvOpeHtFrViImYMnyemLFsNVSoC2Okkk56IdamDhqrTQNPK
         GTnT71fqHcBYttH4oy+5sVXmrO++t4OKZJc1MbNaW1nCPNYRUTiB10tkKNlBa4lgPK
         YaBkW7BB6tR6h33BFlpEYd00ZJ9DUYOLTDPZsRzQxqXbAEuDkT1eRqrY7duVkeR6cW
         ZB+ofCm3zaOMwI95YbILp2Ls922XOoc2P0WIzzM1jc0fgso0kX5dEyIAgGTSy2QRUe
         z4jnB9SQCopyRcjMQ1Nuo+dEYlnQ5zIDAMJGwHa2UvmmfJ9ppiqTQdlhJ945oejgdT
         A30ioyaynEpMw==
Received: by mail-ed1-f70.google.com with SMTP id v20-20020aa7d9d40000b02903be68450bf3so1118259eds.23
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Aug 2021 07:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dzZFzylzg3F3zI37wlmtXpLIjYf2xoTR0tAEuDbeS0g=;
        b=AiKPY1UgVrN9qPqF7FQuoy4Q1LSu7hci2HcRwYM7DICdOHm4QxpoRu9W/asCO1K2mN
         CyGbLi5kWIKDoRBmgCfYbyDPnmc1ayJOYc4o8Bmw27OBPOJ/AemR1H8EyHqqNumA1c/4
         ObgA4eOaQn3n35KVdA0WdVdftlYuv1KdHekQ0Z6+MlBU4W4GntzJGQbYPdwp3iz4T/KJ
         YVdbPIDkFhZ1lj1ccyYPATQbmVqgxU8R3TOjGBhuC7VWEPh6wNT3ySRhZdPUzjJvMI6I
         e1tqZ8WWd94MrFnEZPtlVutZJuh/1ZMA6Z4Zd/alGIUrSC7mWCA1WGnbqdij0wyBYLjR
         m78w==
X-Gm-Message-State: AOAM533tEuz5f5WdrUovOthcFaf1Fe0pmzRckur+g0Mqx0588h0kNzFI
        Xr2dOJkv0GLk4sE3STjRgjOVNk7x6ZTHLIhPmzquR5QCogcrQFqXxUjOHLTtoSg9C+lbsrRgS6A
        QSEdpJyaxizaxlOJBlNU/3+JBclCRupk7fe9KZgm2EmyTRfJo
X-Received: by 2002:a05:6402:1e96:: with SMTP id f22mr30139570edf.189.1628517625363;
        Mon, 09 Aug 2021 07:00:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzFm0bmnkG1HVJ50+pvIKAHRiBiU9qMyS0QWed4IOmybYYTuHgupec4s3V1DPBs9+rUc6Ckg==
X-Received: by 2002:a05:6402:1e96:: with SMTP id f22mr30139546edf.189.1628517625181;
        Mon, 09 Aug 2021 07:00:25 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id b17sm7909686edd.27.2021.08.09.07.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 07:00:24 -0700 (PDT)
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
Subject: [PATCH 1/3] dt-bindings: clock: samsung: convert Exynos AudSS to dtschema
Date:   Mon,  9 Aug 2021 15:59:40 +0200
Message-Id: <20210809135942.100744-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210809135942.100744-1-krzysztof.kozlowski@canonical.com>
References: <20210809135942.100744-1-krzysztof.kozlowski@canonical.com>
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

