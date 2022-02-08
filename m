Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FCF3C4321E
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Feb 2022 17:19:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383513AbiBHRTZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Feb 2022 12:19:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383517AbiBHRTX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Feb 2022 12:19:23 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F32A6C0612C1
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Feb 2022 09:19:19 -0800 (PST)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D3C1E4004D
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Feb 2022 17:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644340758;
        bh=wsWLsYLohqc24CY+DvCwQmjmrJB1cZZyKqkEteo8zKw=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=L25PdHfFdTxy2YDdndnt2Y4/lGjhtUnALe7BEin5bKWjX6Lf5R7xcA7yLRU+yYcRU
         pulMifMX9PjR+fC2aWYjKstBY4TtruoGzmkUtavGjGn1IGZjIvFXvFlKC/FCii2DbW
         LdYtATZ6kMXV9FyPlV3ck08ckptssPtTuKbgtMBMtZjrGhmULUwM8pQdIFkSnrHxDa
         kss0V56LhUuMf3lrQPeVmT7HRaaxe2kLnBa1QpGwlm4oZxXt5hx/wWUqrMs/VionCL
         2q4csGagIyyoI7Og0GRncV57F2oth25WUGCIPJGe8LDtqjyY3Uj9L52XRaIopEpCU/
         2G2v0EcVbhvWw==
Received: by mail-ej1-f69.google.com with SMTP id o7-20020a170906860700b006cbe6deec1bso2362712ejx.22
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Feb 2022 09:19:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wsWLsYLohqc24CY+DvCwQmjmrJB1cZZyKqkEteo8zKw=;
        b=yPSZHSywbM+ZDb//cYhx8uqotjH8Tkg7LDQnX54dxPXMXQ3YoMO04khP78YiSZeKXK
         zdedaqaIW9ADIBUYeADGk0rxMy1/cBc37XXrwq02d4z50ZziXKwYre1M0cAvIkBzauOL
         iC2wuW1YtgZtbdA0f5/TbTKNgRjwTshIkb/EZPDB9SwUFCPXAp6fV7FXPnJ8laB+O+AR
         jIle7NEX2SOP7urAAp0+WyH691exNBqdWAnjNP4hMgW2IQbK9iIevrcWlmWz9QsEn4/S
         U8zEpeh6AUEqcjFh4pz6iHfgsTyGs80XdrhKWy+aVPHEu0GVvVuYF2zXUUEZKVvzzHfm
         TfYg==
X-Gm-Message-State: AOAM531PQqoIKAuUMNyxkqZhxBhUFJSjVpP2c0ntf2Mkvqrl11lVfBQb
        zWCu4lsSJZdx/14x8BGzuj2VZ+pldTjvnlwSzzUyQ1AShOR9DPAcphPtdBQpKEaiWkHWbfKZ950
        JINU/czQNAm4exX4UfxNY2HfvQsZeImwSRuY6fDkR7ujTJzuv
X-Received: by 2002:a17:906:9b87:: with SMTP id dd7mr4512019ejc.552.1644340758527;
        Tue, 08 Feb 2022 09:19:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzY0F7r0kLyPgMZZGqkUbCU8KjDhU3RXIohWlNO6hLTLuOou/cnXcs5p5tX1Nu6bOpKpEpjlg==
X-Received: by 2002:a17:906:9b87:: with SMTP id dd7mr4511993ejc.552.1644340758311;
        Tue, 08 Feb 2022 09:19:18 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id r10sm5125550ejy.148.2022.02.08.09.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 09:19:17 -0800 (PST)
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
Subject: [PATCH 06/10] dt-bindings: display: samsung,exynos-hdmi-ddc: convert to dtschema
Date:   Tue,  8 Feb 2022 18:18:19 +0100
Message-Id: <20220208171823.226211-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
References: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert the Exynos HDMI DDC bindings to DT schema format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../display/exynos/exynos_hdmiddc.txt         | 15 -------
 .../samsung/samsung,exynos-hdmi-ddc.yaml      | 42 +++++++++++++++++++
 2 files changed, 42 insertions(+), 15 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos_hdmiddc.txt
 create mode 100644 Documentation/devicetree/bindings/display/samsung/samsung,exynos-hdmi-ddc.yaml

diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_hdmiddc.txt b/Documentation/devicetree/bindings/display/exynos/exynos_hdmiddc.txt
deleted file mode 100644
index 41eee971562b..000000000000
--- a/Documentation/devicetree/bindings/display/exynos/exynos_hdmiddc.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-Device-Tree bindings for hdmiddc driver
-
-Required properties:
-- compatible: value should be one of the following
-	1) "samsung,exynos5-hdmiddc" <DEPRECATED>
-	2) "samsung,exynos4210-hdmiddc"
-
-- reg: I2C address of the hdmiddc device.
-
-Example:
-
-	hdmiddc {
-		compatible = "samsung,exynos4210-hdmiddc";
-		reg = <0x50>;
-	};
diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,exynos-hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/samsung/samsung,exynos-hdmi-ddc.yaml
new file mode 100644
index 000000000000..f998a3a5b71f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/samsung/samsung,exynos-hdmi-ddc.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/samsung/samsung,exynos-hdmi-ddc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos SoC HDMI DDC
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
+      - const: samsung,exynos4210-hdmiddc
+      - const: samsung,exynos5-hdmiddc
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
+        ddc@50 {
+            compatible = "samsung,exynos4210-hdmiddc";
+            reg = <0x50>;
+        };
+    };
-- 
2.32.0

