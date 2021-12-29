Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F1E8C4167B
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Dec 2021 14:15:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240244AbhL2OPn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 29 Dec 2021 09:15:43 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:36628
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240195AbhL2OPk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Dec 2021 09:15:40 -0500
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3432A3FFDE
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Dec 2021 14:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640787338;
        bh=oVH2+WRf243xqhmGcQPlVR++PNNcWS7ogs/wCBMm8AQ=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=GLFdgviibskdJv8gXzpFEZBalZMn8UkF6vPkdF2W5kMO/8K6Y+jDjsK3YOF6yuBCr
         wjXmS2l2rfbElnQxt7x9pvOSTsN9p08jFDw5Usieqt4qC3MyqE0ujDTvGh93VRckrq
         rvVIQNWRShap7D6q1Iw196Te04Ty2aXfrXB9AIHfzNtsOcSWwPWi1D5fwcqTXddwk5
         PqJ7lpjzgruJWP6hFonocKY5Kt9IVeQuanbEo97GOw/NUbBBaHz5KdsmbsqLt5/ahj
         c5iPyJPdSr+EMs1fskma9tMn6lKlJ7rXiCgDx4hyWWURyl9C1aYy45vhIgAn6v9LnC
         4ebL+vjxjJA+Q==
Received: by mail-lj1-f199.google.com with SMTP id j15-20020a2e6e0f000000b0022db2724332so4969487ljc.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Dec 2021 06:15:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oVH2+WRf243xqhmGcQPlVR++PNNcWS7ogs/wCBMm8AQ=;
        b=P/Iavt7x5gICbNWyfFUlgRTiIBNCC8yEe+qyCNOnzXN/x3bq6M3/9xEIGnZ02nQmdS
         pdZbbrEBB/q7u2czaQEnVofr38P++pE/BMeg5VqAhifdYCZimnT6CzDR56nf2h1rRAOn
         gJ4MS3l4SOIAXW3ht/Fkr++c5Dm+tkjqvEAJ8TbJowJbOQx4DuqpaW5asDMV5bO7euZC
         ZvjVrakZZR3Z8+oQvbdcdgme32d6KRpoo0+8Cfoy0V/NeZE+FTGJdxn0cEOOaq18WV6x
         yoT1t8jvqFSY3s2W+giGIjgvB9tBF1kshjbCOD9QoD/Y+P3vgC2PUqgaTJ94GR506vhD
         jD8Q==
X-Gm-Message-State: AOAM532+o2xZKbUb5y3yh054wtydVJspKHKOaCg6T93uMl9CnVUrAQt0
        fZxsJu6x2DYA9eWE0bspa913IDXrimHN05r2bR14O3hZ+EFqYeLJsx9eHR6M1bDIX4Jc7D/rLvj
        XXx6wTrsgzmSAAq2uJZAxn1G6hrXEZUn/Kj+S7rBSgtuKuu/e
X-Received: by 2002:a05:6512:1590:: with SMTP id bp16mr23016214lfb.407.1640787337326;
        Wed, 29 Dec 2021 06:15:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMAQJ4OARSXHncOgegzuj7gQusK77tDMk8km7b3wp/J8akQSrN4cAW6NgajRmaT+BNEw3trA==
X-Received: by 2002:a05:6512:1590:: with SMTP id bp16mr23016195lfb.407.1640787337089;
        Wed, 29 Dec 2021 06:15:37 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id a16sm1316164ljm.98.2021.12.29.06.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 06:15:36 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 3/4] regulator: dt-bindings: maxim,max14577: convert to dtschema
Date:   Wed, 29 Dec 2021 15:15:23 +0100
Message-Id: <20211229141524.34174-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211229141524.34174-1-krzysztof.kozlowski@canonical.com>
References: <20211229141524.34174-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert the regulator bindings of Maxim MAX14577/MAX77835 MUIC to DT
schema format.  The existing bindings were defined in
../bindings/mfd/max14577.txt.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/regulator/maxim,max14577.yaml    | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max14577.yaml

diff --git a/Documentation/devicetree/bindings/regulator/maxim,max14577.yaml b/Documentation/devicetree/bindings/regulator/maxim,max14577.yaml
new file mode 100644
index 000000000000..e7c2d9c948ce
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/maxim,max14577.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/maxim,max14577.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim MAX14577/MAX77836 MicroUSB and Companion Power Management IC regulators
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  This is a part of device tree bindings for Maxim MAX14577/MAX77836 MicroUSB
+  Integrated Circuit (MUIC).
+
+  See also Documentation/devicetree/bindings/mfd/maxim,max14577.yaml for
+  additional information and example.
+
+properties:
+  compatible:
+    enum:
+      - maxim,max14577-regulator
+      - maxim,max77836-regulator
+
+patternProperties:
+  "^SAFEOUT$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description: |
+      Safeout LDO regulator (fixed voltage).
+
+    properties:
+      regulator-min-microvolt:
+        const: 4900000
+      regulator-max-microvolt:
+        const: 4900000
+
+    required:
+      - regulator-name
+
+  "^CHARGER$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description: |
+      Current regulator.
+
+    properties:
+      regulator-min-microamp: true
+      regulator-max-microamp: true
+
+    required:
+      - regulator-name
+
+  "^LDO[12]$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description: |
+      Current regulator.
+
+    properties:
+      regulator-min-microvolt: true
+      regulator-max-microvolt: true
+
+    required:
+      - regulator-name
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: maxim,max14577-regulator
+    then:
+      properties:
+        LDO1: false
+        LDO2: false
+
+additionalProperties: false
-- 
2.32.0

