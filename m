Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24275C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 11 Jan 2022 17:48:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344169AbiAKRsv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 11 Jan 2022 12:48:51 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:32866
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241290AbiAKRss (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 11 Jan 2022 12:48:48 -0500
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9449440047
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 17:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641923327;
        bh=KtzaeAS3vHdxLiX+UAOcYpw4x029KYpzx4CNQuL/lKY=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=QqoXNe126LMEbui0jdtl1XY0PTGNk+bQAEt+2X+dsgkPraYGEaH8ODy3nFVpReTRm
         gZxDcxV0m5t+2WLQVHINOjM88Nl78rL1kwcA5mBVBZ8kBJ4on6x3VzE8U0zIRx7Owx
         QRlJuuXBBiNLv7AaHDl6Jik5MFdrFNBekhC6FfqpsN+2Tmola4qBxwJTit2HpMQEC6
         +qy4wI0+u9hDNWQ4BPzLJ7KXgPiHfcavOT2TRQf3TITtWWYKCrmt7iXgcoCXRrO1Vi
         gwwRO6qWiSMUR0Kg4uRayhhya03/gQabXm3I2FFvjb9Px8J1qnwubLztaHT1t2jvv3
         fbHF8/DVmp6Dg==
Received: by mail-ed1-f71.google.com with SMTP id j10-20020a05640211ca00b003ff0e234fdfso1348681edw.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 09:48:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KtzaeAS3vHdxLiX+UAOcYpw4x029KYpzx4CNQuL/lKY=;
        b=jAl//27ouf0RNzRz2FIlCz5iJSM8PypIlt6nlCPJriuUjmEaPAQLmKi9b/8f05+mZ+
         DeBruF68T2QX2/0ETfzRYB7uH3ZZzcgUpqYwnJO8VacH/rehvXZJuhwOSr1ILq04OXiU
         rQwXX8qQcm5NmHErK+fWvVqIQCIud2w2cRA2ow7+xWDmHjxAhVR9YzBMrMHjGPQg8Dqk
         u7AhsYT3wpbyAJxhtST5WLCl5TjCabk1IRF0YDbA/fB8kgp47JyhkkuPpBcNfW3mGTRK
         z+SeUyiqr1VbvarTt9mMxU2mrbbZaK22dafUZfsWj/KohlfrB72w69pS7BLXqHpBHKJa
         uR9g==
X-Gm-Message-State: AOAM530y4tvBPQDsGDibl94tFkF8GjfpzMmZvDckGw3OzuE6TQuKthNi
        h1Ybt07ZMjhZOmSmEOGSsJBjUg5aWmk976yMm0A/E4CwgxeDLvSHsfWgllVy5Plmh29u3ih1TCH
        vVXJ3nQcWYxqfkLJTPWBCn5Kiz03jvdKNZ0M/EDRyvsBJfTtL
X-Received: by 2002:a17:907:6da0:: with SMTP id sb32mr4730971ejc.455.1641923327243;
        Tue, 11 Jan 2022 09:48:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOxlUAVlC4YuYQpRipmbsqUYnDmolm/iGG7kaEKNH1SQBIaGmimpIrXXHt3wLrnMj/QIsfRw==
X-Received: by 2002:a17:907:6da0:: with SMTP id sb32mr4730956ejc.455.1641923327047;
        Tue, 11 Jan 2022 09:48:47 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id i23sm5224489edt.93.2022.01.11.09.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 09:48:46 -0800 (PST)
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
Cc:     Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/5] dt-bindings: extcon: maxim,max77843: add MAX77843 bindings
Date:   Tue, 11 Jan 2022 18:48:02 +0100
Message-Id: <20220111174805.223732-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220111174805.223732-1-krzysztof.kozlowski@canonical.com>
References: <20220111174805.223732-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Document the bindings for MAX77843 MUIC/extcon driver, based on
Exynos5433 TM2 devicetree.  These are neither accurate nor finished
bindings but at least allow parsing existing DTS files.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/extcon/maxim,max77843.yaml       | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/extcon/maxim,max77843.yaml

diff --git a/Documentation/devicetree/bindings/extcon/maxim,max77843.yaml b/Documentation/devicetree/bindings/extcon/maxim,max77843.yaml
new file mode 100644
index 000000000000..f9ffe3d6f957
--- /dev/null
+++ b/Documentation/devicetree/bindings/extcon/maxim,max77843.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/extcon/maxim,max77843.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim MAX77843 MicroUSB and Companion Power Management IC Extcon
+
+maintainers:
+  - Chanwoo Choi <cw00.choi@samsung.com>
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  This is a part of device tree bindings for Maxim MAX77843 MicroUSB
+  Integrated Circuit (MUIC).
+
+  See also Documentation/devicetree/bindings/mfd/maxim,max77843.yaml for
+  additional information and example.
+
+properties:
+  compatible:
+    const: maxim,max77843-muic
+
+  connector:
+    $ref: /schemas/connector/usb-connector.yaml#
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Any connector to the data bus of this controller should be modelled using
+      the OF graph bindings specified
+    properties:
+      port:
+        $ref: /schemas/graph.yaml#/properties/port
+
+required:
+  - compatible
+  - connector
+
+additionalProperties: false
-- 
2.32.0

