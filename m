Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE49C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 29 Jan 2022 19:37:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353135AbiA2ThR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 29 Jan 2022 14:37:17 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:37336
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1353091AbiA2ThG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 29 Jan 2022 14:37:06 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BDBA13F20A
        for <linux-samsung-soc@vger.kernel.org>; Sat, 29 Jan 2022 19:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643485017;
        bh=wEL89/ynvDT+atuZL4csG/pFwiNgDZ9SBr5HgtriJD4=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=kzM9J9TwroUBteAw9GDoNccmP7zEFRCPw93NcmMBL1dC/3wBSRtW6I0EdhN+NxKRP
         MWYvJc9b2vD0jqBI0isQ9ods5tDvERiecYHfn8GCfErvGXRX4qr5DpG7bqrxzMbXiL
         97/A8K2JiK7Qh0VNhuZdEli+Tc7EBnb26Q3V+uR8dt3kqbvcnU+NxUuKtAK2tT7uAU
         vbJzpcxgFgyX7DBQK/DtoM2+ZUBMTcb2BEilWZN0W8Olh7on0ydG4yo8EpPDNSJ3uN
         RSKYdKU3pd5YMsdhTYkDcph6Fa6rqkhqGNYRfeb1/WaoFwT1//tjWCcMmB/YSeL947
         CBUs9BFVCVPcA==
Received: by mail-ed1-f69.google.com with SMTP id ed6-20020a056402294600b004090fd8a936so4775017edb.23
        for <linux-samsung-soc@vger.kernel.org>; Sat, 29 Jan 2022 11:36:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wEL89/ynvDT+atuZL4csG/pFwiNgDZ9SBr5HgtriJD4=;
        b=eo7GRo/NTRgc3IAJmxhDAe2Ik9smNuI9nIsEfDrP/BrhmFLZr4hnNP4gd7Zo0ko7N6
         /AMo+0KjzzUZS88kaYea7/DxhTV4DPmZIuvq0cXtoDpxNH63t7Rr7etDWRan9i6jzoE/
         ob/KhOTtuRvatKgrndw+p7q2HVSYw4d0n+7RSxH4HlDpfydbbGDNyMi0l6mO8WFIK3Dm
         VGOWKw5u9yAqS0GVhX8gF8blOTBUozmACCpJTqh2g12e1gUWN47AnZwplmb8xvTHd9Xq
         SERfWc6nH/ayc4KKK8fxqgL2hkNApFTuX3Q9vm8qTd/ESbZ91J8yS44n+u2Ofc/Rp9ck
         2YIA==
X-Gm-Message-State: AOAM533oYCN6bS4yMa6RIx2BExEkIVG4Edj6TSs2ZDi8yHwUVMaeL39f
        y+tC0a5J5GtvNAqdmgQb/vxZ9FwC4ohfeA9zpXB2aLYnsc81jCf4wJ8jSc1XBdMvBJqsAedPq8Q
        JyW8kjckPhT0+BIXtuJ95FKsoQr/ihNKhbReBlZhge5hTrjcB
X-Received: by 2002:a17:907:7f88:: with SMTP id qk8mr7708997ejc.622.1643485016439;
        Sat, 29 Jan 2022 11:36:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIgwaMH7JjSWPd08LTkb2moQW6C24pusHL1cGkG0T2qvrd39Ci/vgQ+6J35I6bR1JyOn/FSw==
X-Received: by 2002:a17:907:7f88:: with SMTP id qk8mr7708987ejc.622.1643485016259;
        Sat, 29 Jan 2022 11:36:56 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id bf21sm14968026edb.2.2022.01.29.11.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 11:36:55 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 6/8] dt-bindings: phy: samsung,exynos5250-sata-phy: convert to dtschema
Date:   Sat, 29 Jan 2022 20:36:44 +0100
Message-Id: <20220129193646.372481-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220129193646.372481-1-krzysztof.kozlowski@canonical.com>
References: <20220129193646.372481-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert the Samsung Exynos5250 SoC SATA PHY bindings to DT schema
format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../phy/samsung,exynos5250-sata-phy.yaml      | 64 +++++++++++++++++++
 .../devicetree/bindings/phy/samsung-phy.txt   | 26 --------
 2 files changed, 64 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos5250-sata-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos5250-sata-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos5250-sata-phy.yaml
new file mode 100644
index 000000000000..62b39bb46585
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/samsung,exynos5250-sata-phy.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/samsung,exynos5250-sata-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos5250 SoC SATA PHY
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Marek Szyprowski <m.szyprowski@samsung.com>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+
+properties:
+  compatible:
+    const: samsung,exynos5250-sata-phy
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: sata_phyctrl
+
+  "#phy-cells":
+    const: 0
+
+  reg:
+    maxItems: 1
+
+  samsung,syscon-phandle:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to PMU system controller interface.
+
+  samsung,exynos-sataphy-i2c-phandle:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to I2C SATA interface.
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - "#phy-cells"
+  - reg
+  - samsung,syscon-phandle
+  - samsung,exynos-sataphy-i2c-phandle
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/exynos5250.h>
+
+    phy@12170000 {
+        compatible = "samsung,exynos5250-sata-phy";
+        reg = <0x12170000 0x1ff>;
+        clocks = <&clock CLK_SATA_PHYCTRL>;
+        clock-names = "sata_phyctrl";
+        #phy-cells = <0>;
+        samsung,syscon-phandle = <&pmu_system_controller>;
+        samsung,exynos-sataphy-i2c-phandle = <&sata_phy_i2c>;
+    };
diff --git a/Documentation/devicetree/bindings/phy/samsung-phy.txt b/Documentation/devicetree/bindings/phy/samsung-phy.txt
index d26ac7401258..1ee78016dc72 100644
--- a/Documentation/devicetree/bindings/phy/samsung-phy.txt
+++ b/Documentation/devicetree/bindings/phy/samsung-phy.txt
@@ -1,29 +1,3 @@
-Samsung SATA PHY Controller
----------------------------
-
-SATA PHY nodes are defined to describe on-chip SATA Physical layer controllers.
-Each SATA PHY controller should have its own node.
-
-Required properties:
-- compatible        : compatible list, contains "samsung,exynos5250-sata-phy"
-- reg : offset and length of the SATA PHY register set;
-- #phy-cells : must be zero
-- clocks : must be exactly one entry
-- clock-names : must be "sata_phyctrl"
-- samsung,exynos-sataphy-i2c-phandle : a phandle to the I2C device, no arguments
-- samsung,syscon-phandle : a phandle to the PMU system controller, no arguments
-
-Example:
-	sata_phy: sata-phy@12170000 {
-		compatible = "samsung,exynos5250-sata-phy";
-		reg = <0x12170000 0x1ff>;
-		clocks = <&clock 287>;
-		clock-names = "sata_phyctrl";
-		#phy-cells = <0>;
-		samsung,exynos-sataphy-i2c-phandle = <&sata_phy_i2c>;
-		samsung,syscon-phandle = <&pmu_syscon>;
-	};
-
 Device-Tree bindings for sataphy i2c client driver
 --------------------------------------------------
 
-- 
2.32.0

