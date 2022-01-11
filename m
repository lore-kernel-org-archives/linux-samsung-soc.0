Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4166C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 11 Jan 2022 17:48:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344626AbiAKRsy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 11 Jan 2022 12:48:54 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:32892
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344117AbiAKRst (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 11 Jan 2022 12:48:49 -0500
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B7C1140023
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 17:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641923328;
        bh=LcRt8+t0LEGVlfTku7gPMrViX/Nt71eS6TfrRb0aKjQ=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=O1wJau/yx+I7et521BeX5dRieFSaZAwFxiXMhUAJGwVmmeadC5d9quw1XMTcqW9ek
         q2NX1Ktslo7P8lMVmoQq+jUzriaophinVHadxN5jVUht5CFoVI/v4UXUfKdefVgTvy
         YKEnHH7NWSjWx50xLdNYTfvco2uZpZPiRFfWOJPLnbEfnEscxkoebzD8kHrcif6qSo
         q89VJhTqJ3o2+PoKddn4GCuso3VTmQeBSu/+6Ar9FATGyMwLWTStY9JFDsQ50YyziD
         HQ+mfmUMkjxgbMgiWUupLNjPjn7FJLyMyyxJdpWovSFvATgFoi44LmC+UBm9H1CZF9
         Hb51UUWPl2DvQ==
Received: by mail-ed1-f70.google.com with SMTP id v18-20020a056402349200b003f8d3b7ee8dso14010710edc.23
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 09:48:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LcRt8+t0LEGVlfTku7gPMrViX/Nt71eS6TfrRb0aKjQ=;
        b=m3E2kc058cH6orsCJXIM8xEUDnsTEKL/7d12gBxCE4MBnfBM/9SqfmOhZPIzU1BNop
         9G76ZnGiSW4M+/7Dfsi9gLS6udxgMjgpf+HtXmSptq8dmgCqYj853pvnQQRDdI3Bw0zw
         ggXWxvcPWz9EiukLubMAgiU2sCzdYT7504fTVteeD7D7Felpkv1xMF0SmVBh1ZroEZnt
         LmiN+Oh0M1jBvwtIkqM8qAarW2orV7Chz+aQ7OGWMxfzsp1rCDleEOvgig3od1ye1n6c
         93xGJlncQqyP1d0jEL/OeMqbJZcQL6OZ75BRJu/sMgKjS4iI+9p+TxBanMldsCZhGqqn
         c+IQ==
X-Gm-Message-State: AOAM530UOkma89NWIZNmZmAaHVJ9aw6Jn1HbiMCXUio8nJww28MZo1oP
        svNk+YfUYJKkOqUzVa4KagnKqv7pxlpi1oAT/haVNTPisB5ZgOwzmxC8gZfHy3Zgv91qobvJSzC
        CaLHUAFZkIeVKbpWTcEnD3e8A4Gm1Cj9itZALRCwmRsUBnoAt
X-Received: by 2002:a50:ce4a:: with SMTP id k10mr5454003edj.31.1641923328390;
        Tue, 11 Jan 2022 09:48:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgF1x3XntlDy5p/SEguWc1VAocNbGh5alkcyHXD9/D2HpsqnHXUWInQydT3dqUznGBo75t3A==
X-Received: by 2002:a50:ce4a:: with SMTP id k10mr5453985edj.31.1641923328228;
        Tue, 11 Jan 2022 09:48:48 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id i23sm5224489edt.93.2022.01.11.09.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 09:48:47 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 3/5] regulator: dt-bindings: maxim,max77843: add MAX77843 bindings
Date:   Tue, 11 Jan 2022 18:48:03 +0100
Message-Id: <20220111174805.223732-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220111174805.223732-1-krzysztof.kozlowski@canonical.com>
References: <20220111174805.223732-1-krzysztof.kozlowski@canonical.com>
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
 .../bindings/regulator/maxim,max77843.yaml    | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max77843.yaml

diff --git a/Documentation/devicetree/bindings/regulator/maxim,max77843.yaml b/Documentation/devicetree/bindings/regulator/maxim,max77843.yaml
new file mode 100644
index 000000000000..a963025e96c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/maxim,max77843.yaml
@@ -0,0 +1,65 @@
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
+  CHARGER:
+    type: object
+    $ref: regulator.yaml#
+    additionalProperties: false
+    description: |
+      Current regulator.
+
+    properties:
+      regulator-name: true
+      regulator-always-on: true
+      regulator-boot-on: true
+      regulator-min-microamp:
+        minimum: 100000
+      regulator-max-microamp:
+        maximum: 3150000
+
+    required:
+      - regulator-name
+
+patternProperties:
+  "^SAFEOUT[12]$":
+    type: object
+    $ref: regulator.yaml#
+    additionalProperties: false
+    description: |
+      Safeout LDO regulator.
+
+    properties:
+      regulator-name: true
+      regulator-always-on: true
+      regulator-boot-on: true
+      regulator-min-microvolt:
+        minimum: 3300000
+      regulator-max-microvolt:
+        maximum: 4950000
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

