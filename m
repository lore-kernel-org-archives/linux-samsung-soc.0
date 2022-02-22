Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E938C43217
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Feb 2022 14:59:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233014AbiBVPAO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 22 Feb 2022 10:00:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233029AbiBVPAM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Feb 2022 10:00:12 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F0E510DA4F
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2022 06:59:46 -0800 (PST)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 58DAA407BE
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2022 14:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645541985;
        bh=hSZ7F8gBRrOjsQXCC6rZDxcT9sE5F7qcCO45OrXZ8Og=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=M6q4YCJdSZGLfQGPec74ObcfZgDcbTGX8FgTnNi+/3vNvtCTcFgcKXof60+MJMqPt
         KPdGnwKM76k7IioY8ToG7duEfYa+dG6lZfF1xmb0W6JzRVPQPbEYs3AHxJwrD4B4I9
         eO2abUBJQ5CmSHRxfzB1jyY00rhJiZy0Yy2KLLNlkS1CGt7a5FZcpYvAxcgm9frG4X
         jA+BEk0M+6D3xlz7ecmL2caXsApeP35RS7IkgXJSsDwedPxjVywqY9otOvEmgiRoKH
         an7Yh3t0Qu+6JNm3YJWc0KzjMpZqVNnYfVOtlrspHVjKdXdlt19W41zccdVzqFkBzY
         SwGGW20Zd6hnA==
Received: by mail-ej1-f71.google.com with SMTP id k21-20020a1709063e1500b006d0777c06d6so4980297eji.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2022 06:59:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hSZ7F8gBRrOjsQXCC6rZDxcT9sE5F7qcCO45OrXZ8Og=;
        b=AUmElp38h+mq4x80vcv+/7KvbzXqlPf2ls27Dl0dEInVF4midFZyngDTXNgPQm4O6A
         xPHEalheKM4zXVYsIi+UNEqGr5TSGTCGtqqq8FOpWcIyt05Vg9omINsZb8lDJOJjr0wB
         vXArjtUB2uhx0QERObAIh2UjKNMEXA1k4vzgk/uAwLSB41HttpCzItMU2aYdsGIU9hvE
         yU90HAH1imoPxb2lSiVZauK0RNiIhG+BQ/v/gcJuJp6BKLLpatXIWRxcv1VaqaBvfzAt
         EEV7ymsqIs0g80ZoDisFq+MaOvFJvVJJWqCFFvtVjwYmaBEOy02KwJViNdMQAPljuoRI
         HzNQ==
X-Gm-Message-State: AOAM532tMgsQdV0UOChN2Q7pJC4OzHqh+JfMkqLqgIIaV/toBjk44mfD
        lspsYRv6eY1cuVw0qeK+tUu/sIk94q8WUPcVIsnYfaTabTR5tJapF8PH2qKIRcp5hn1lbJgA37r
        z0IgIo/6NQQeAIZ91yqumlQYLWNzfamfONwEGknw9hONn477U
X-Received: by 2002:a17:906:b351:b0:6ca:8d27:526a with SMTP id cd17-20020a170906b35100b006ca8d27526amr20328741ejb.289.1645541984768;
        Tue, 22 Feb 2022 06:59:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxWI4axJkVwBbmPapLPc5fCL1iXsNaaZjBGwawNt2yW9KIZGUlWJR52lTA7TnshFvIcz51bMQ==
X-Received: by 2002:a17:906:b351:b0:6ca:8d27:526a with SMTP id cd17-20020a170906b35100b006ca8d27526amr20328714ejb.289.1645541984504;
        Tue, 22 Feb 2022 06:59:44 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id m2sm2467960ejb.20.2022.02.22.06.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 06:59:44 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Yaniv Gardi <ygardi@codeaurora.org>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v2 03/15] dt-bindings: ufs: cdns,ufshc: convert to dtschema
Date:   Tue, 22 Feb 2022 15:58:42 +0100
Message-Id: <20220222145854.358646-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert the Cadence Universal Flash Storage (UFS) Controlle to DT schema
format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/ufs/cdns,ufshc.txt    | 32 ---------
 .../devicetree/bindings/ufs/cdns,ufshc.yaml   | 68 +++++++++++++++++++
 .../devicetree/bindings/ufs/ti,j721e-ufs.yaml |  7 +-
 3 files changed, 71 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/ufs/cdns,ufshc.txt
 create mode 100644 Documentation/devicetree/bindings/ufs/cdns,ufshc.yaml

diff --git a/Documentation/devicetree/bindings/ufs/cdns,ufshc.txt b/Documentation/devicetree/bindings/ufs/cdns,ufshc.txt
deleted file mode 100644
index 02347b017abd..000000000000
--- a/Documentation/devicetree/bindings/ufs/cdns,ufshc.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-* Cadence Universal Flash Storage (UFS) Controller
-
-UFS nodes are defined to describe on-chip UFS host controllers.
-Each UFS controller instance should have its own node.
-Please see the ufshcd-pltfrm.txt for a list of all available properties.
-
-Required properties:
-- compatible	: Compatible list, contains one of the following controllers:
-			"cdns,ufshc" - Generic CDNS HCI,
-			"cdns,ufshc-m31-16nm" - CDNS UFS HC + M31 16nm PHY
-		  complemented with the JEDEC version:
-			"jedec,ufs-2.0"
-
-- reg		: Address and length of the UFS register set.
-- interrupts	: One interrupt mapping.
-- freq-table-hz	: Clock frequency table.
-		  See the ufshcd-pltfrm.txt for details.
-- clocks	: List of phandle and clock specifier pairs.
-- clock-names	: List of clock input name strings sorted in the same
-		  order as the clocks property. "core_clk" is mandatory.
-		  Depending on a type of a PHY,
-		  the "phy_clk" clock can also be added, if needed.
-
-Example:
-	ufs@fd030000 {
-		compatible = "cdns,ufshc", "jedec,ufs-2.0";
-		reg = <0xfd030000 0x10000>;
-		interrupts = <0 1 IRQ_TYPE_LEVEL_HIGH>;
-		freq-table-hz = <0 0>, <0 0>;
-		clocks = <&ufs_core_clk>, <&ufs_phy_clk>;
-		clock-names = "core_clk", "phy_clk";
-	};
diff --git a/Documentation/devicetree/bindings/ufs/cdns,ufshc.yaml b/Documentation/devicetree/bindings/ufs/cdns,ufshc.yaml
new file mode 100644
index 000000000000..59588914ec76
--- /dev/null
+++ b/Documentation/devicetree/bindings/ufs/cdns,ufshc.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ufs/cdns,ufshc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence Universal Flash Storage (UFS) Controller
+
+maintainers:
+  - Jan Kotas <jank@cadence.com>
+
+# Select only our matches, not all jedec,ufs-2.0
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - cdns,ufshc
+          - cdns,ufshc-m31-16nm
+  required:
+    - compatible
+
+allOf:
+  - $ref: ufs-common.yaml
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - cdns,ufshc
+            # CDNS UFS HC + M31 16nm PHY
+          - cdns,ufshc-m31-16nm
+      - const: jedec,ufs-2.0
+
+  clocks:
+    minItems: 1
+    maxItems: 3
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: core_clk
+      - const: phy_clk
+      - const: ref_clk
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    ufs@fd030000 {
+        compatible = "cdns,ufshc", "jedec,ufs-2.0";
+        reg = <0xfd030000 0x10000>;
+        interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
+        freq-table = <0 0>, <0 0>;
+        clocks = <&ufs_core_clk>, <&ufs_phy_clk>;
+        clock-names = "core_clk", "phy_clk";
+    };
diff --git a/Documentation/devicetree/bindings/ufs/ti,j721e-ufs.yaml b/Documentation/devicetree/bindings/ufs/ti,j721e-ufs.yaml
index dc93fe2d3458..6cb0001e6a58 100644
--- a/Documentation/devicetree/bindings/ufs/ti,j721e-ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/ti,j721e-ufs.yaml
@@ -47,11 +47,10 @@ required:
 
 patternProperties:
   "^ufs@[0-9a-f]+$":
-    type: object
+    $ref: cdns,ufshc.yaml
     description: |
-      Cadence UFS controller node must be the child node. Refer
-      Documentation/devicetree/bindings/ufs/cdns,ufshc.txt for binding
-      documentation of child node
+      Cadence UFS controller node must be the child node.
+    unevaluatedProperties: false
 
 additionalProperties: false
 
-- 
2.32.0

