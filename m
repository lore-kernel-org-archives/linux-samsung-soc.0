Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ACD7C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Feb 2022 17:19:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383692AbiBHRTY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Feb 2022 12:19:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383496AbiBHRTR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Feb 2022 12:19:17 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72316C061579
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Feb 2022 09:19:16 -0800 (PST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1B2834017B
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Feb 2022 17:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644340755;
        bh=lAYCF0oFl9nGAtjZLrRDfxUB8PgsnopuWgeZlWJgjg4=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=pWhoAI4BEKfG6myvGiVvW3y8BEpvFPmJat5Fg4Mku0TJIWY4fmENfuTrsj1Ux7jqg
         NpKBbtGOlaeI5kM0xyzyyAFRLuvtfmK5nz5mnPJ0CMCQ1fOa0DOlgefwyF1Xfg4qb0
         1hMEdoUzbgo2XFVj+IARzdSlC9S50jf8PKAt719saUNdXJmGFuvwgAMrx8K6wLGPyb
         8Pd2P9D/t24jEXS0ojh8OzFE+QWiogWlNXO+VKct/JkFMZ9fDWkEk7GXdF5/cmMQPg
         7M8kb63lcDnv6dB0DIN0iq5SKlJjnjNSxx9t3WPRdgS3Nwu/ZDolf6we/J4PomX+qt
         9X6h2OW5oQHIQ==
Received: by mail-ed1-f72.google.com with SMTP id n8-20020a50cc48000000b0040f345d624aso5884367edi.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Feb 2022 09:19:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lAYCF0oFl9nGAtjZLrRDfxUB8PgsnopuWgeZlWJgjg4=;
        b=bxJJDZVFO9vZh5Qid331TQRfF2wBv/uHpRrjThZfoy1zOrMcPu44DYFH+3rW7RLOcD
         aLgiNfy/nmmg8xpX4j50HB7i7fVp4HdSENXZopsImIxjIgqNHcGP8XQ5l9ufBSz9pAp+
         MQS7xIBKtu4tTSCieqSQvKxVkSxRCUHhrvPIcLsRZuBmyari10tMYzGCNb8e/tW2cpOD
         92x76WN98TAFWxvn6gDbZSRKkODqXjhNJ7hXp9RtmEwUCOCtSbhDq8on5KSfozEBuD+n
         qkBzx4sFhxPoX3dBNYXn1LT5qttlk7LXceJfvbecqmIXlpiQXDH7AjpvN2SC2HdpkuhO
         JSMQ==
X-Gm-Message-State: AOAM533xoKMDVuyKf2iC4z833Xp+0fpCT4i11os0cgak+VxikweiFc+p
        ENI92uHIDdpj3yXv79q/ulz4P5vw1Azbhs7bgw/TFsMeD0CkQlODZ5BoEt95o0XkrGOP2v4L7qO
        inKzgC1q56SujzGBWU4BwBhtyJDhvCpkQOyoiMpoe6zZU38ye
X-Received: by 2002:a05:6402:26c8:: with SMTP id x8mr5675169edd.80.1644340754538;
        Tue, 08 Feb 2022 09:19:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGbFLwRrBY5BwHpSgBbXGOoRElSE/B0TmO0zX/pZeqJzCVowi5xXNxxbrl6PdvIGlV9Er9gw==
X-Received: by 2002:a05:6402:26c8:: with SMTP id x8mr5675152edd.80.1644340754363;
        Tue, 08 Feb 2022 09:19:14 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id r10sm5125550ejy.148.2022.02.08.09.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 09:19:13 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 03/10] dt-bindings: phy: samsung,exynos-hdmi-phy: convert to dtschema
Date:   Tue,  8 Feb 2022 18:18:16 +0100
Message-Id: <20220208171823.226211-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
References: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert the Exynos HDMI PHY bindings to DT schema format and put them
next to other PHYs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../display/exynos/exynos_hdmiphy.txt         | 15 -------
 .../bindings/phy/samsung,exynos-hdmi-phy.yaml | 44 +++++++++++++++++++
 2 files changed, 44 insertions(+), 15 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos_hdmiphy.txt
 create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos-hdmi-phy.yaml

diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_hdmiphy.txt b/Documentation/devicetree/bindings/display/exynos/exynos_hdmiphy.txt
deleted file mode 100644
index 162f641f7639..000000000000
--- a/Documentation/devicetree/bindings/display/exynos/exynos_hdmiphy.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-Device-Tree bindings for hdmiphy driver
-
-Required properties:
-- compatible: value should be one of the following:
-	1) "samsung,exynos5-hdmiphy" <DEPRECATED>
-	2) "samsung,exynos4210-hdmiphy".
-	3) "samsung,exynos4212-hdmiphy".
-- reg: I2C address of the hdmiphy device.
-
-Example:
-
-	hdmiphy {
-		compatible = "samsung,exynos4210-hdmiphy";
-		reg = <0x38>;
-	};
diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos-hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos-hdmi-phy.yaml
new file mode 100644
index 000000000000..c61574e10b2a
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/samsung,exynos-hdmi-phy.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/samsung,exynos-hdmi-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos SoC HDMI PHY
+
+maintainers:
+  - Inki Dae <inki.dae@samsung.com>
+  - Joonyoung Shim <jy0922.shim@samsung.com>
+  - Seung-Woo Kim <sw0312.kim@samsung.com>
+  - Kyungmin Park <kyungmin.park@samsung.com>
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - samsung,exynos4210-hdmiphy
+          - samsung,exynos4212-hdmiphy
+      - const: samsung,exynos5-hdmiphy
+        deprecated: true
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hdmi-phy@38 {
+            compatible = "samsung,exynos4210-hdmiphy";
+            reg = <0x38>;
+        };
+    };
-- 
2.32.0

