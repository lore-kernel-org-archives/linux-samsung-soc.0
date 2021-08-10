Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A663C4320E
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Aug 2021 09:32:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 252C06101E
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Aug 2021 09:32:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239115AbhHJJdA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 10 Aug 2021 05:33:00 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:42892
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239108AbhHJJcy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Aug 2021 05:32:54 -0400
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 9942D3F045
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Aug 2021 09:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628587951;
        bh=LfA7OKYMoMr4P+BoBEbRrouGl0bAW01mzwQl8SL+Db8=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=nPKOvw30cpBTgexiUD0OqDlTdPU8icS02iDHbaKBqV2cnRhb8EPzQ5dP/D+X/DkNI
         CfQO4E3rZ50YbHKA4XPCywXamyWMAosdK12nUpDs/JCsC0ep0+laGOfBtIVaDX3HW2
         QtmgpXNDK0sUr+vA/4PgxFivwalMpnTEz9qRLhxz7lghxXCyuyqfiUXadzibq5Y4JN
         /wZ7vY1bpFBzUFHH/QWLJzAQBMnWUNpb2K0Troiori1nuZ2kb07IrKv7bJ8sFMWnqL
         IhABJjHvkHJUxAEsvcA6SxpicpxClz/s6fQZfTwv5/A1aKXDwfjOjNMzR3ZuM6NnT9
         HU5iRerfzjrPg==
Received: by mail-ej1-f70.google.com with SMTP id ja25-20020a1709079899b02905b2a2bf1a62so1331734ejc.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Aug 2021 02:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LfA7OKYMoMr4P+BoBEbRrouGl0bAW01mzwQl8SL+Db8=;
        b=FtQjR+/frElSPYSEHiZNG21ko+j7CVQYV1usMPrezI8pe1FZhPZb71113s7FR9oiho
         3yhAQyjrHvGROqHZGJxxK9zvGsaqf+QVaGPRM5Licq9FgZ+ErAvgtyapUc4v3Xv+vpBA
         Z5WYuvDLfjpuFdKkS6UQPcrYaD/gkgsj7k7cYuTaW4x0EpgSl1ZNTSqzNTHLWCgxa+Aa
         XE9YFI0a4UmKsALE7dHNulsjgcNMRREeMAzbIyfQCqIxlnou1REK07K+YSvmenw1vkbx
         IwOmd05x3SrrHNLMlh50J1Ood2lXsBBzdd2uv4dWlqCiTJVyT1dKqup/ZZg1pdvr+eEg
         uIVQ==
X-Gm-Message-State: AOAM531Ycda2y/2thh49/QgFvHl5LJRGav+FvJpc+Rhj2W+Ov1ew7UBY
        Ch8mi/vMOMHwpxCYIyCedkhoI0Btzuf49QvnAk5idL+1TbvUsjw6qElSyiGvcEcPhpe8TlTad2+
        ekA5iBb5YdZQrcx/uQZPuDy6OfG+y8aYBlUh7iklbHthvROmu
X-Received: by 2002:a17:906:b750:: with SMTP id fx16mr26513977ejb.108.1628587951372;
        Tue, 10 Aug 2021 02:32:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkKBrgby7Ik5RKBWrHmXQwcnKqO0k0f3ivdlyRP4MtY6ZkmiqOCam8VGejF8uRHCZ1wcCbOg==
X-Received: by 2002:a17:906:b750:: with SMTP id fx16mr26513963ejb.108.1628587951227;
        Tue, 10 Aug 2021 02:32:31 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id q21sm5117606ejs.43.2021.08.10.02.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 02:32:30 -0700 (PDT)
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
Subject: [PATCH v2 3/8] dt-bindings: clock: samsung: convert Exynos542x to dtschema
Date:   Tue, 10 Aug 2021 11:31:40 +0200
Message-Id: <20210810093145.26153-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210810093145.26153-1-krzysztof.kozlowski@canonical.com>
References: <20210810093145.26153-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Merge Exynos542x clock controller bindings to existing DT schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/clock/exynos5420-clock.txt       | 42 -------------------
 .../bindings/clock/samsung,exynos-clock.yaml  | 11 ++++-
 2 files changed, 10 insertions(+), 43 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/exynos5420-clock.txt

diff --git a/Documentation/devicetree/bindings/clock/exynos5420-clock.txt b/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
deleted file mode 100644
index 717a7b1531c7..000000000000
--- a/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-* Samsung Exynos5420 Clock Controller
-
-The Exynos5420 clock controller generates and supplies clock to various
-controllers within the Exynos5420 SoC and for the Exynos5800 SoC.
-
-Required Properties:
-
-- compatible: should be one of the following.
-  - "samsung,exynos5420-clock" - controller compatible with Exynos5420 SoC.
-  - "samsung,exynos5800-clock" - controller compatible with Exynos5800 SoC.
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
-dt-bindings/clock/exynos5420.h header and can be used in device
-tree sources.
-
-Example 1: An example of a clock controller node is listed below.
-
-	clock: clock-controller@10010000 {
-		compatible = "samsung,exynos5420-clock";
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
index cd6567bd8cc7..b0f58a1cf6cb 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
@@ -18,7 +18,16 @@ description: |
 
 properties:
   compatible:
-    const: samsung,exynos5250-clock
+    oneOf:
+      - enum:
+          - samsung,exynos5250-clock
+          - samsung,exynos5420-clock
+          - samsung,exynos5800-clock
+      - items:
+          - enum:
+              - samsung,exynos5420-clock
+              - samsung,exynos5800-clock
+          - const: syscon
 
   assigned-clocks: true
   assigned-clock-parents: true
-- 
2.30.2

