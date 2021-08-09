Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 354E8C41537
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Aug 2021 12:07:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 186A960F8F
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Aug 2021 12:07:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234861AbhHIMH4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 9 Aug 2021 08:07:56 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:45246
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234655AbhHIMH4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Aug 2021 08:07:56 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 000EF3F34E
        for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Aug 2021 12:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628510854;
        bh=OzcbdzDbFX/7hdNHc1Uaa9h5AIzXuGJQ7WWbGJRZv2I=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=vT5aS4I5Kdj47PGmMYysl39CKw+RMVFUfbMraIe3NfVCF40EwBZgAgf6wDAc3gyB2
         u5zo87/Qbr5O3M4FIxWDd/AFWK8N77omRjz/mI+QRF0vR5GyP2S1QL+OpRHJqOUuM8
         RmBETDakSc/xYhhj0A7Zs4/sJop1FsCCMbyrSxLMgH4AxAWr5z4hKuzCW/dt7nFlOw
         3uWkatC0i8Y49pbvjuEEpkLWY2rlJlJTIPndSAQ93VizXDAFxasU4go48+CPZ0pjIu
         cP1laEpXLGW9iXHw4GJnv0hxZ0kr2sgBSjzQKky+kCn/7pqGogt8wvyUWZgtExvjEy
         if85n0IvO5SaQ==
Received: by mail-ed1-f69.google.com with SMTP id v20-20020aa7d9d40000b02903be68450bf3so964722eds.23
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Aug 2021 05:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OzcbdzDbFX/7hdNHc1Uaa9h5AIzXuGJQ7WWbGJRZv2I=;
        b=sWlmo+Jf1PGGltGRv60WqaotQpfuMiHm3fB0UE8qocg7yv41jRBvmOTomlqsOzD8yW
         dE4SFi2QPGbbExH5+BoEL4q3fIk4bWiJ2YordLZucsKx5UduT/JK1RsohEPAfA5wdmBV
         t6hPAYQUbZ1ijG3UFOqTYZeKVoyfE4cORA1+LekztPfnyfR4xTHfpWVtFBwiPojfh2zR
         R6+Toaufy/C3wuT/RYo8pDYQoJ7wyiB+phm+JqKKXa6P17lG3P+Vs3zPF344hK2LJQmb
         UiDRWSJaLpV3jPGCtqKPaPvPU8PekdfjKPUoFirutNFyV1LsMig5bO/panRZmULWXitU
         Qm5Q==
X-Gm-Message-State: AOAM531TE3UF55XCSnAQdxVNLkWuHIwUH6J5c4BHVln7QFZrS83D1gL2
        I2fmBmqustDuCPXhfSTqPOFpzPB8CBGGjG9bAq76eU9eijT1oZ+fpwCAH5JtE7RqFyg89zI/qjY
        s03G+orX6Gs56NBUxxUAyjGHbKJ+lRLLvFEFDVc+Yypi/m6gr
X-Received: by 2002:aa7:dc02:: with SMTP id b2mr28698703edu.46.1628510854767;
        Mon, 09 Aug 2021 05:07:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwl0z9zY6TIRsWFOr2u74gnQQlWSGYod2iNeNyrZ86XebFxOWaMyJnUCR3NQeVehyALnrzY2g==
X-Received: by 2002:aa7:dc02:: with SMTP id b2mr28698690edu.46.1628510854621;
        Mon, 09 Aug 2021 05:07:34 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id i6sm8084863edt.28.2021.08.09.05.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 05:07:34 -0700 (PDT)
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
Subject: [PATCH 2/3] dt-bindings: clock: samsung: add bindings for Exynos external clock
Date:   Mon,  9 Aug 2021 14:05:43 +0200
Message-Id: <20210809120544.56596-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210809120544.56596-1-krzysztof.kozlowski@canonical.com>
References: <20210809120544.56596-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Document the bindings for Samsung Exynos external to SoC
(oscclk/XXTI/XusbXTI) clock provided on boards.  The bindings are
already implemented in most of the Exynos clock drivers and DTS files.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../clock/samsung,exynos-ext-clock.yaml       | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos-ext-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos-ext-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos-ext-clock.yaml
new file mode 100644
index 000000000000..64d027dbe3b2
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos-ext-clock.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/samsung,exynos-ext-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung SoC external/osc/XXTI/XusbXTI clock
+
+maintainers:
+  - Chanwoo Choi <cw00.choi@samsung.com>
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+  - Tomasz Figa <tomasz.figa@gmail.com>
+
+description: |
+  Samsung SoCs require an external clock supplied through XXTI or XusbXTI pins.
+
+properties:
+  compatible:
+    enum:
+      - samsung,clock-xxti
+      - samsung,clock-xusbxti
+      - samsung,exynos5420-oscclk
+
+  "#clock-cells":
+    const: 0
+
+  clock-frequency: true
+
+  clock-output-names:
+    maxItems: 1
+
+required:
+  - compatible
+  - clock-frequency
+
+additionalProperties: false
+
+examples:
+  - |
+    fixed-rate-clocks {
+        clock {
+            compatible = "samsung,clock-xxti";
+            clock-frequency = <24000000>;
+        };
+    };
-- 
2.30.2

