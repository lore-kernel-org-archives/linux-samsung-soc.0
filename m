Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9CC6C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Dec 2021 12:47:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238631AbhL2MrJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 29 Dec 2021 07:47:09 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:34502
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238613AbhL2MrG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Dec 2021 07:47:06 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C785B407C0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Dec 2021 12:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640782025;
        bh=NVZDNZbcxMe60AjIyWq0dP9vH4MaxZTaIUYRQc7qGok=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=Omi+qO22L3hJW2xcbtWzULFS165huVz60aHfge2Bpw6ErPj5S4Pnw4VLhO3P1sKOE
         KjZJeXEGHEt5Nxt1pUImzFpLSgHpgnO4YSC4jmBmDdmIb/YzREMLJsb5Ni7tIdO7Tm
         disGyuN+15b8wBpE89xKShfZtwEdpRJdKjgWDcV72GuLW0d/srMKB67y3rGkYcDqPk
         JA4q4A4kJVDTzNnvMFefFlpRkh8MRkKjeH10f9bpRIb4cMmNLIsGehZQK1H4c6WqLp
         6cnVYvC1zMxOC4qwskdoj1MQBAGDPEDpmgbw7Jw6IGibUF2KOzMYzo42+emmRjCPed
         ySrImDitvPS0g==
Received: by mail-lf1-f69.google.com with SMTP id n7-20020a056512388700b0042a063bb38cso690477lft.14
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Dec 2021 04:47:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NVZDNZbcxMe60AjIyWq0dP9vH4MaxZTaIUYRQc7qGok=;
        b=v2K6p3czdIODJFqp0ngF4zJC8LRCetNjuztCMDjPBxm97/qL+cFW9G+EaWoDIcPDy0
         zjZ/LmAPwcsg6HICGkmc4iL/IcCGZTVmGpNrn9jT1lLAujzMPcRcFnFlKWcewHGzGsm2
         zMkyTwJeWaUUFrLaj+Mv/AUZxB7Ssfr1kcy13n//PHW6UmWDtzRF/mflGCbLLcVv7pCy
         /Oyca34IZqYNGmkio8kzChBxlGPdZsqvfTZeQCbYktgZpvvZISXXTb48dE+v5gXG2JME
         gcxhJo+u45rRObFW8Xwum5G8zts51yWEPPmh1j0MqOoFfEzpMtI3mTYIkxqrtPHWId54
         c4mg==
X-Gm-Message-State: AOAM533Ry2+l0rur3JwK+vRNhtfm1/DEM0C83nPFOoybwHOJNOp9fduk
        R2VMbdI/TmPk4UQ7CwVvUjTtrlqRJBnePAF1KiAKtJCoEhag0GuWZEqpE58lNdZx57MFm8x/66P
        aYL7+DLGPiuvPFi3adQASgLOy2pmD8QunmPs7Lf3xhEMw80O9
X-Received: by 2002:a2e:a58e:: with SMTP id m14mr9998746ljp.172.1640782024255;
        Wed, 29 Dec 2021 04:47:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJysgtAYCi/aDd+5Ib3QCtjvGG5GYx3B+fcDxG5/MXwsPeTVwy8kTmO4sA8Z7NWAnwKjLlaM4g==
X-Received: by 2002:a2e:a58e:: with SMTP id m14mr9998733ljp.172.1640782024076;
        Wed, 29 Dec 2021 04:47:04 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id e11sm711158ljn.73.2021.12.29.04.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 04:47:03 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Inki Dae <inki.dae@samsung.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Beomho Seo <beomho.seo@samsung.com>
Subject: [PATCH 3/5] regulator: dt-bindings:  maxim,max77843: add MAX77843 bindings
Date:   Wed, 29 Dec 2021 13:46:29 +0100
Message-Id: <20211229124631.21576-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211229124631.21576-1-krzysztof.kozlowski@canonical.com>
References: <20211229124631.21576-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Document the bindings for MAX77843 regulator driver.  The bindings are
almost identical to MAX77693 bindings, except the actual names of
regulators.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/regulator/maxim,max77843.yaml    | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max77843.yaml

diff --git a/Documentation/devicetree/bindings/regulator/maxim,max77843.yaml b/Documentation/devicetree/bindings/regulator/maxim,max77843.yaml
new file mode 100644
index 000000000000..1ab58c756d7c
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/maxim,max77843.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/maxim,max77843.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim MAX77843 MicroUSB and Companion Power Management IC regulators
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  This is a part of device tree bindings for Maxim MAX77843 MicroUSB Integrated
+  Circuit (MUIC).
+
+  See also Documentation/devicetree/bindings/mfd/maxim,max77843.yaml for
+  additional information and example.
+
+properties:
+  compatible:
+    const: maxim,max77843-regulator
+
+patternProperties:
+  "^SAFEOUT[12]$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description: |
+      Safeout LDO regulator.
+
+    properties:
+      regulator-min-microvolt: true
+      regulator-max-microvolt: true
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
+required:
+  - compatible
+
+additionalProperties: false
-- 
2.32.0

