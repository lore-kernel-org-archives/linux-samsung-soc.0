Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D353C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Feb 2022 15:00:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232533AbiBVPAp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 22 Feb 2022 10:00:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231694AbiBVPA3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Feb 2022 10:00:29 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAC4B10E054
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2022 06:59:52 -0800 (PST)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BFFDB40310
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2022 14:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645541991;
        bh=1P7qQVIntzoTj3/oLgMEwV7rKt1l7cL2m41gmrqktTo=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=bU6JK5adMWxlJBra+LF0Ror6FdImeaukVNNCrbw3yE8hwL6RUZK2oBpGpbE2I4J0G
         T1n1jVbzQQD+SMc/12x4kD/z7afsVR27irY4K4IKMH08Sa9bFwWMisBQ2tr8D8RgUf
         b/MA7aVxpbG2YcjZ1M/MO9FhOJLgQxuJv1MeKx6U6Sa0b5CVpzjs/A4jbxT3PFZijN
         +I2jlBtUmZy9dmaDmymZtGEbLT9YiPktsa/aQsYOBeSCBVrdpV2eHN92EHRisEd0eN
         rtQvAzzV0oXWPhv8tOSiIOtNBM0jcCo/J3i0/276sR0g6lUAZGuzbbYBGciyBz3M9d
         jooZCxqpRkBIA==
Received: by mail-ej1-f69.google.com with SMTP id sa22-20020a1709076d1600b006ce78cacb85so5897270ejc.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2022 06:59:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1P7qQVIntzoTj3/oLgMEwV7rKt1l7cL2m41gmrqktTo=;
        b=dqieBwSY1tQ7NzzafKXg/kutEagiRXbsMzydLpxSRLSP4XzO3JR1imXukt+lyUFfJd
         BxxW78shRUUZdgHISXceFqzNsBIbkRBh65Dy1tmWij1aBx3+tbpGwM2ZPSdJg+7/nEzU
         iiFdljHsae4fZEDZpwqKizisRBIy8aGJjbWvmPvBUr1qtJGk5/paK68L83MpHSOyRFed
         1kpXuUwPovXPmyKoc+z/HnLlHlyzTt/ppuRwyZ3u263c8OunU9wg6BfbQIkGxmqGRaUl
         ehGtyW7fVQ5eiP1LXozGZ94/beOO1tVCLCr+hzJrRBJoiBV2Yxj+iqysnLYAlNIg0xp3
         PemQ==
X-Gm-Message-State: AOAM5321R+XGjKjLBGlWCTzuGeoftkZKlc2+EzwxayRp0Rq5w+qdQnf3
        b6Mkb/dtA0HJ8K06Ns4x0FDIrMWvwouUFfl6T30++iOnYOYQvbk7bxuBvtHi79jE0P4I4znLAj2
        1q/Dqf6QRNbBK/mDRtcaUa7aOGu9mZdjUnCg9CygaghF/0TIp
X-Received: by 2002:a50:e04e:0:b0:410:d961:523a with SMTP id g14-20020a50e04e000000b00410d961523amr27317313edl.223.1645541991400;
        Tue, 22 Feb 2022 06:59:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUtYJeXKFR/3UPBCev0P+VF4C8MI1ryF08nvFtYgouje4ha2q2QFFwRqFjiPr36iU06TskIg==
X-Received: by 2002:a50:e04e:0:b0:410:d961:523a with SMTP id g14-20020a50e04e000000b00410d961523amr27317282edl.223.1645541991213;
        Tue, 22 Feb 2022 06:59:51 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id m2sm2467960ejb.20.2022.02.22.06.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 06:59:50 -0800 (PST)
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
Subject: [PATCH v2 07/15] dt-bindings: ufs: mediatek,ufs: convert to dtschema
Date:   Tue, 22 Feb 2022 15:58:46 +0100
Message-Id: <20220222145854.358646-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert the Mediatek Universal Flash Storage (UFS) Controller to DT
schema format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/ufs/mediatek,ufs.yaml | 67 +++++++++++++++++++
 .../devicetree/bindings/ufs/ufs-mediatek.txt  | 45 -------------
 2 files changed, 67 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
 delete mode 100644 Documentation/devicetree/bindings/ufs/ufs-mediatek.txt

diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
new file mode 100644
index 000000000000..1cf530b5c57d
--- /dev/null
+++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Universal Flash Storage (UFS) Controller
+
+maintainers:
+  - Stanley Chu <stanley.chu@mediatek.com>
+
+allOf:
+  - $ref: ufs-common.yaml
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8183-ufshci
+      - mediatek,mt8192-ufshci
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: ufs
+
+  phys:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  vcc-supply: true
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - phys
+  - reg
+  - vcc-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        ufs@ff3c0000 {
+            compatible = "mediatek,mt8183-ufshci";
+            reg = <0 0x11270000 0 0x2300>;
+            interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_LOW>;
+            phys = <&ufsphy>;
+
+            clocks = <&infracfg_ao CLK_INFRA_UFS>;
+            clock-names = "ufs";
+            freq-table = <0 0>;
+
+            vcc-supply = <&mt_pmic_vemc_ldo_reg>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/ufs/ufs-mediatek.txt b/Documentation/devicetree/bindings/ufs/ufs-mediatek.txt
deleted file mode 100644
index 63a953b672d2..000000000000
--- a/Documentation/devicetree/bindings/ufs/ufs-mediatek.txt
+++ /dev/null
@@ -1,45 +0,0 @@
-* Mediatek Universal Flash Storage (UFS) Host Controller
-
-UFS nodes are defined to describe on-chip UFS hardware macro.
-Each UFS Host Controller should have its own node.
-
-To bind UFS PHY with UFS host controller, the controller node should
-contain a phandle reference to UFS M-PHY node.
-
-Required properties for UFS nodes:
-- compatible         : Compatible list, contains the following controller:
-                       "mediatek,mt8183-ufshci" for MediaTek UFS host controller
-                       present on MT8183 chipsets.
-                       "mediatek,mt8192-ufshci" for MediaTek UFS host controller
-                       present on MT8192 chipsets.
-- reg                : Address and length of the UFS register set.
-- phys               : phandle to m-phy.
-- clocks             : List of phandle and clock specifier pairs.
-- clock-names        : List of clock input name strings sorted in the same
-                       order as the clocks property. "ufs" is mandatory.
-                       "ufs": ufshci core control clock.
-- freq-table-hz      : Array of <min max> operating frequencies stored in the same
-                       order as the clocks property. If this property is not
-                       defined or a value in the array is "0" then it is assumed
-                       that the frequency is set by the parent clock or a
-                       fixed rate clock source.
-- vcc-supply         : phandle to VCC supply regulator node.
-
-Example:
-
-	ufsphy: phy@11fa0000 {
-		...
-	};
-
-	ufshci@11270000 {
-		compatible = "mediatek,mt8183-ufshci";
-		reg = <0 0x11270000 0 0x2300>;
-		interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_LOW>;
-		phys = <&ufsphy>;
-
-		clocks = <&infracfg_ao INFRACFG_AO_UFS_CG>;
-		clock-names = "ufs";
-		freq-table-hz = <0 0>;
-
-		vcc-supply = <&mt_pmic_vemc_ldo_reg>;
-	};
-- 
2.32.0

