Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C70CFC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  6 Feb 2022 14:05:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240173AbiBFOFM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 6 Feb 2022 09:05:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237347AbiBFOFL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 6 Feb 2022 09:05:11 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C10D9C043184
        for <linux-samsung-soc@vger.kernel.org>; Sun,  6 Feb 2022 06:05:10 -0800 (PST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A34CB40042
        for <linux-samsung-soc@vger.kernel.org>; Sun,  6 Feb 2022 13:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644155894;
        bh=lOiKlVY+li7+FmiBN2L8P4Y/x6OELAmIkj/zsUkdPsw=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=k0Rfp2/5WDHPc0bLLLn9cyz/70mefXYyLY9R2lBhGUcQ+7JRt1S4GBFanY9On9+f/
         5iKA39yR1QBUkcndsZuqkRGKe6UduOCqixw9WtxjdPQNlxMfQRJ+sb9wLRgstZnvPr
         FwK76U9+/Nq8z1rhX3Bx3eHxxoaZ8ilLtUcfgSKbq9pUo6y5CYfOlDLvpGHnmOCeU6
         BON1Qj2isCQ+qYwKIFXYXc1VNvajneSE9jBi7J1eBNhbNjKCHuGETfHxAQZKgPZhj9
         imvmcKoeG33/O6sHRm1dSaKxWvoLTf2dkrH47KISihGf0WxjwqiC9zHVd7t4HSS+Mp
         0qhnO18k76Kug==
Received: by mail-wm1-f72.google.com with SMTP id a17-20020a05600c069100b0037bb7eb6944so157430wmn.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 06 Feb 2022 05:58:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lOiKlVY+li7+FmiBN2L8P4Y/x6OELAmIkj/zsUkdPsw=;
        b=o/rl57WVLkrxHlizOrY92UJG/jTQyXp7MGpGRfFlVCKh0MYsiXgJ4W2QjR+Mb6xuSn
         2dRBRVYIU6KMWGYhWFMv2you7Heyz1cEh7DB/TxjlRUkmFeEi7mfXQch3vF9yH5k5RgM
         /5NHrk3ZGhOIOvJZ+NB9FGBwBtqC1wzP2F/GEBphYoXEB3UpszDqm8t83wNeP6N1Eddd
         7WZ+kUnYH4v+BNdAcRztL2nGf2BoR+bwfv3bIBYTWy6DWhVD1434WyhJ9wvJEDWx2iPh
         CtJ6gBSHlM9gurtXHvpM/em3R3VFSXZPEuQcvtegomozT/FFl2KzBTCKR5yMgKwKWG5v
         4kvQ==
X-Gm-Message-State: AOAM532s1vKPNfxSEZASURUTDjQTn5DZSOTw7fn7pdGlUAcS4YF7kNG1
        jNoLCD2S7yIZ8g0kMe974EYMFmeeW8WlrkQZUmShILqYtqR22JU1kEV+e8Yr7DNPcCB5WRYrx48
        yXr0Xn9wJ0w/Yn8Bo4BY3HwXlfNDUZVqO+7Iw3GfHOXCJJh4s
X-Received: by 2002:a1c:a187:: with SMTP id k129mr10736763wme.194.1644155894249;
        Sun, 06 Feb 2022 05:58:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlhe4nNbdnLxL2YSPguLC5yr1KsrO1jPoWlnLroSOGauoLKGrgo4Z8u8tDCDm7WLYdWBcOgw==
X-Received: by 2002:a1c:a187:: with SMTP id k129mr10736749wme.194.1644155894090;
        Sun, 06 Feb 2022 05:58:14 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id e9sm8296888wrg.60.2022.02.06.05.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 05:58:13 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/8] dt-bindings: memory: lpddr3-timings: convert to dtschema
Date:   Sun,  6 Feb 2022 14:58:01 +0100
Message-Id: <20220206135807.211767-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220206135807.211767-1-krzysztof.kozlowski@canonical.com>
References: <20220206135807.211767-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert the LPDDR3 memory timings bindings to DT schema format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../ddr/jedec,lpddr3-timings.yaml             | 153 ++++++++++++++++++
 .../memory-controllers/ddr/lpddr3-timings.txt |  58 -------
 2 files changed, 153 insertions(+), 58 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3-timings.yaml
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/ddr/lpddr3-timings.txt

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3-timings.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3-timings.yaml
new file mode 100644
index 000000000000..98bc219e8a25
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3-timings.yaml
@@ -0,0 +1,153 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,lpddr3-timings.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LPDDR3 SDRAM AC timing parameters for a given speed-bin
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+properties:
+  compatible:
+    const: jedec,lpddr3-timings
+
+  reg:
+    maxItems: 1
+    description: |
+      Maximum DDR clock frequency for the speed-bin, in Hz.
+
+  min-freq:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Minimum DDR clock frequency for the speed-bin, in Hz.
+
+  tCKE:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      CKE minimum pulse width (HIGH and LOW pulse width) in pico seconds.
+
+  tCKESR:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      CKE minimum pulse width during SELF REFRESH (low pulse width during
+      SELF REFRESH) in pico seconds.
+
+  tFAW:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Four-bank activate window in pico seconds.
+
+  tMRD:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Mode register set command delay in pico seconds.
+
+  tR2R-C2C:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Additional READ-to-READ delay in chip-to-chip cases in pico seconds.
+
+  tRAS:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Row active time in pico seconds.
+
+  tRC:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      ACTIVATE-to-ACTIVATE command period in pico seconds.
+
+  tRCD:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      RAS-to-CAS delay in pico seconds.
+
+  tRFC:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Refresh Cycle time in pico seconds.
+
+  tRPab:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Row precharge time (all banks) in pico seconds.
+
+  tRPpb:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Row precharge time (single banks) in pico seconds.
+
+  tRRD:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Active bank A to active bank B in pico seconds.
+
+  tRTP:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Internal READ to PRECHARGE command delay in pico seconds.
+
+  tW2W-C2C:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Additional WRITE-to-WRITE delay in chip-to-chip cases in pico seconds.
+
+  tWR:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      WRITE recovery time in pico seconds.
+
+  tWTR:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Internal WRITE-to-READ command delay in pico seconds.
+
+  tXP:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Exit power-down to next valid command delay in pico seconds.
+
+  tXSR:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      SELF REFRESH exit to next valid command delay in pico seconds.
+
+required:
+  - compatible
+  - min-freq
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    lpddr3 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        timings@800000000 {
+            compatible = "jedec,lpddr3-timings";
+            reg = <800000000>;
+            min-freq = <100000000>;
+            tCKE = <3750>;
+            tCKESR = <3750>;
+            tFAW = <25000>;
+            tMRD = <7000>;
+            tR2R-C2C = <0>;
+            tRAS = <23000>;
+            tRC = <33750>;
+            tRCD = <10000>;
+            tRFC = <65000>;
+            tRPab = <12000>;
+            tRPpb = <12000>;
+            tRRD = <6000>;
+            tRTP = <3750>;
+            tW2W-C2C = <0>;
+            tWR = <7500>;
+            tWTR = <3750>;
+            tXP = <3750>;
+            tXSR = <70000>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/lpddr3-timings.txt b/Documentation/devicetree/bindings/memory-controllers/ddr/lpddr3-timings.txt
deleted file mode 100644
index 84705e50a3fd..000000000000
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/lpddr3-timings.txt
+++ /dev/null
@@ -1,58 +0,0 @@
-* AC timing parameters of LPDDR3 memories for a given speed-bin.
-
-The structures are based on LPDDR2 and extended where needed.
-
-Required properties:
-- compatible : Should be "jedec,lpddr3-timings"
-- min-freq : minimum DDR clock frequency for the speed-bin. Type is <u32>
-- reg : maximum DDR clock frequency for the speed-bin. Type is <u32>
-
-Optional properties:
-
-The following properties represent AC timing parameters from the memory
-data-sheet of the device for a given speed-bin. All these properties are
-of type <u32> and the default unit is ps (pico seconds).
-- tRFC
-- tRRD
-- tRPab
-- tRPpb
-- tRCD
-- tRC
-- tRAS
-- tWTR
-- tWR
-- tRTP
-- tW2W-C2C
-- tR2R-C2C
-- tFAW
-- tXSR
-- tXP
-- tCKE
-- tCKESR
-- tMRD
-
-Example:
-
-timings_samsung_K3QF2F20DB_800mhz: lpddr3-timings@800000000 {
-	compatible	= "jedec,lpddr3-timings";
-	reg		= <800000000>; /* workaround: it shows max-freq */
-	min-freq	= <100000000>;
-	tRFC		= <65000>;
-	tRRD		= <6000>;
-	tRPab		= <12000>;
-	tRPpb		= <12000>;
-	tRCD		= <10000>;
-	tRC		= <33750>;
-	tRAS		= <23000>;
-	tWTR		= <3750>;
-	tWR		= <7500>;
-	tRTP		= <3750>;
-	tW2W-C2C	= <0>;
-	tR2R-C2C	= <0>;
-	tFAW		= <25000>;
-	tXSR		= <70000>;
-	tXP		= <3750>;
-	tCKE		= <3750>;
-	tCKESR		= <3750>;
-	tMRD		= <7000>;
-};
-- 
2.32.0

