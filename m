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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23EA1C43214
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Aug 2021 09:32:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2D76610CB
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Aug 2021 09:32:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239101AbhHJJcx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 10 Aug 2021 05:32:53 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:42606
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239090AbhHJJcw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Aug 2021 05:32:52 -0400
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id B671A40C86
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Aug 2021 09:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628587948;
        bh=2daM3RukL8uFtRevasOftGMEg/bNtv3suJb8BFZCflI=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=HRDWck7oYV6pcj2vIjAqL++Kf0kxXYYYD90AG+Ke9m/mhWKFJfPcSimbrJ6gF1qM0
         qzLRnunnvHq6cxVGLGC736oZ6vU4R0GtJqfT6iI5Zp2K71ygqrsPdy8Na7EdCkAX22
         zx6EQ0ioQe9Jj9fRH0FIGHjlCosm/sUMtOJO2ExP8XLH7EE9Mu0m0ih6Qasl7PPVbi
         0oUu+60utb8yrQQZ+o5vjXpGu/a4D4tHIyp83ojxHlO0URE0kw31H1wOScwOYr6hSh
         uurN1r0astKqubTNRJ1nXc09hrmhw6SCbRffir30rFBRLaW0w/CzeEbskxyeuDHfR4
         kjgqWavf/EYRg==
Received: by mail-ej1-f72.google.com with SMTP id h17-20020a1709070b11b02905b5ced62193so327946ejl.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Aug 2021 02:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2daM3RukL8uFtRevasOftGMEg/bNtv3suJb8BFZCflI=;
        b=kY4FdMI5+6/Jf6rY2uUNYwp8OsLwLKjokpo5u2/owHLl2do/BOnZGHOfG0Xzqgm3+e
         XGRB7mxH+d+fkjdKbggeNzArQjSgeCWBd7zPW7tyWN66B4dbuMhuGzXVOc99owq9+jGZ
         Dd+kJlKElRHf/NpBUpRn4TgYLbJxAeePqotiQrga+tynKwXK4gxye175pHeByrKGX/JB
         c4KoDuVcOFiJFiTgOWbT74W7BO03PwWQUiuV2Ly1JNNCHhYFS3lWs6q87/dFAyu+Vrm1
         JAjfYE0Uok7lYWRjs0mOiywOJTHMvr/Ckh/8PQzqF3w8Glff1N4MpnDgGGCVRxsgi6z3
         9UEA==
X-Gm-Message-State: AOAM530dKRe0Pc9J2m+SxbHZzwGlBVZq9mHLxBy9ObcNIuzG9mfXzEsM
        ZHWtFHcAWnB/3reR9w0lWd940XbQWgInRzIWRFXj0rWyjuvgSdnUx0ek0b/36dv3EJwIphhy5vz
        V5MOqRftjPl9b0NbMwtEobiUwVuJLxYs4Z8oTuLTbAMvp4b1d
X-Received: by 2002:aa7:c1cf:: with SMTP id d15mr3780469edp.201.1628587948413;
        Tue, 10 Aug 2021 02:32:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx432BrR+0hLr9Y9vBJZo/WSHHaR2sbl0Gik2v0R/GnYBa+AxH+7bX0LVCaIULenuV34xDDBA==
X-Received: by 2002:aa7:c1cf:: with SMTP id d15mr3780448edp.201.1628587948263;
        Tue, 10 Aug 2021 02:32:28 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id q21sm5117606ejs.43.2021.08.10.02.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 02:32:27 -0700 (PDT)
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
Subject: [PATCH v2 1/8] dt-bindings: clock: samsung: convert Exynos5250 to dtschema
Date:   Tue, 10 Aug 2021 11:31:38 +0200
Message-Id: <20210810093145.26153-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210810093145.26153-1-krzysztof.kozlowski@canonical.com>
References: <20210810093145.26153-1-krzysztof.kozlowski@canonical.com>
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

