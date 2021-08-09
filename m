Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC9A0C43214
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Aug 2021 13:11:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 929A060EC0
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Aug 2021 13:11:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235354AbhHINLs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 9 Aug 2021 09:11:48 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:49010
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234684AbhHINLr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Aug 2021 09:11:47 -0400
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id DB8C340675
        for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Aug 2021 13:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628514685;
        bh=QT8SwdEZ0R6TNUIJP6/Ss9c7WD6R+hflCwKGvca5iIE=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=UsqH39gyrJpQhGVY3qqOLslaz8kbZHNiXUPAi4TQQ7RKpK3L89YuriqQl7/aB5KsI
         i1lReYtfF6+qbyEqAm1SPn0bKSG87rob8sW2g/HpIdHcR6YMBAVI2CDBFG8QKJrXob
         cuZilE2dtyPLsYAxW3U3A97KtNfTYzDISxmN23Cn+BaE2KhDhHH9wgiQBNH4/ZZejK
         ZOdyQPh25kHCrcv8f3yxR7NyXLVxLaPoEmeiXa7v+FkWXcPCvisU2Mr0CwViv0bUYP
         wZHFC+cCZ2sgZmiHt3Ayfp+WLQM5qqSMJsXxuAYjcVTkEZbMzTpVDbFcGgi5iDTc2B
         hk0j1yWpXbqZQ==
Received: by mail-ej1-f69.google.com with SMTP id h13-20020a1709062dcdb02905aec576a827so859365eji.23
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Aug 2021 06:11:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QT8SwdEZ0R6TNUIJP6/Ss9c7WD6R+hflCwKGvca5iIE=;
        b=LAClJWqA5EVHYsiaaUdDd7LzhQ3bIlBC374ASQJGkXl6qrkfeMRMKAbUPeOyz1/Cra
         njkagKZcBIj7q11TsTbOQf8X98ydymo3NeWgbf0bGrCn4F7hAAJRrYz+JgxCcy5Ugi8Z
         WF6Gx+83efrOp3xDstjH5T4ihITCUkzu1Qi8EM70R92y7p/KSmaZYmoby622YIDKUaVe
         OvPBxZry+4ji9Wtil16jVY2EkWTCRT50QZAY64Jgk4Eph6d045IFKBZnrbCgxUFTpAeR
         V0hGNwcopXffS4QDNLIj1l/c8VlMZ1m+zOlPXTMvAhMGuTYu8O090p50X9f5NVTjxbt+
         9yzA==
X-Gm-Message-State: AOAM533v+vErN+6KkqHAIghcntyjhLm7LLGK4qkdA5BoZrYzkkW8JQLP
        a81vDxSxqZLrtIX4O3SrgSme/G7a1PCU6pvmW5TotkIAo8zv2D5PMFbqbO+Yafjl9lw7tV/hE5J
        zlaGASvJsJEratE1EfB7GAzfIHlYyU8Hm+U0zVYvXqg90Q971
X-Received: by 2002:a05:6402:1603:: with SMTP id f3mr29666980edv.274.1628514685586;
        Mon, 09 Aug 2021 06:11:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsBn38E/01SuiowZudPrXAASccbbFYi5v/N0fNRNffxu2X4kYSHdNIQQP0mWfQ0n1EBaDBhw==
X-Received: by 2002:a05:6402:1603:: with SMTP id f3mr29666944edv.274.1628514685342;
        Mon, 09 Aug 2021 06:11:25 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id cf16sm8023425edb.92.2021.08.09.06.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 06:11:24 -0700 (PDT)
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
Subject: [PATCH 1/2] dt-bindings: clock: samsung: convert Exynos3250 to dtschema
Date:   Mon,  9 Aug 2021 15:09:34 +0200
Message-Id: <20210809130935.80565-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210809130935.80565-1-krzysztof.kozlowski@canonical.com>
References: <20210809130935.80565-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Merge Exynos3250 clock controller bindings to existing DT schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/clock/exynos3250-clock.txt       | 57 -------------------
 .../bindings/clock/samsung,exynos-clock.yaml  |  3 +
 2 files changed, 3 insertions(+), 57 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/exynos3250-clock.txt

diff --git a/Documentation/devicetree/bindings/clock/exynos3250-clock.txt b/Documentation/devicetree/bindings/clock/exynos3250-clock.txt
deleted file mode 100644
index 7441ed519f02..000000000000
--- a/Documentation/devicetree/bindings/clock/exynos3250-clock.txt
+++ /dev/null
@@ -1,57 +0,0 @@
-* Samsung Exynos3250 Clock Controller
-
-The Exynos3250 clock controller generates and supplies clock to various
-controllers within the Exynos3250 SoC.
-
-Required Properties:
-
-- compatible: should be one of the following.
-  - "samsung,exynos3250-cmu" - controller compatible with Exynos3250 SoC.
-  - "samsung,exynos3250-cmu-dmc" - controller compatible with
-    Exynos3250 SoC for Dynamic Memory Controller domain.
-  - "samsung,exynos3250-cmu-isp" - ISP block clock controller compatible
-     with Exynos3250 SOC
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
-dt-bindings/clock/exynos3250.h header and can be used in device
-tree sources.
-
-Example 1: Examples of clock controller nodes are listed below.
-
-	cmu: clock-controller@10030000 {
-		compatible = "samsung,exynos3250-cmu";
-		reg = <0x10030000 0x20000>;
-		#clock-cells = <1>;
-	};
-
-	cmu_dmc: clock-controller@105c0000 {
-		compatible = "samsung,exynos3250-cmu-dmc";
-		reg = <0x105C0000 0x2000>;
-		#clock-cells = <1>;
-	};
-
-	cmu_isp: clock-controller@10048000 {
-		compatible = "samsung,exynos3250-cmu-isp";
-		reg = <0x10048000 0x1000>;
-		#clock-cells = <1>;
-	};
-
-Example 2: UART controller node that consumes the clock generated by the clock
-	   controller. Refer to the standard clock bindings for information
-	   about 'clocks' and 'clock-names' property.
-
-	serial@13800000 {
-		compatible = "samsung,exynos4210-uart";
-		reg = <0x13800000 0x100>;
-		interrupts = <0 109 0>;
-		clocks = <&cmu CLK_UART0>, <&cmu CLK_SCLK_UART0>;
-		clock-names = "uart", "clk_uart_baud0";
-	};
diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
index b0f58a1cf6cb..c7b07fcd3fa1 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
@@ -20,6 +20,9 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - samsung,exynos3250-cmu
+          - samsung,exynos3250-cmu-dmc
+          - samsung,exynos3250-cmu-isp
           - samsung,exynos5250-clock
           - samsung,exynos5420-clock
           - samsung,exynos5800-clock
-- 
2.30.2

