Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED61C001DB
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Aug 2023 13:13:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbjHGNNE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Aug 2023 09:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbjHGNND (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Aug 2023 09:13:03 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA1E2CA
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Aug 2023 06:13:01 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fbea147034so38661685e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Aug 2023 06:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691413980; x=1692018780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZW8bAZOpofrAZ+E1cERRtB886PDebwGsovf/Pz2sHNY=;
        b=NBFvLuOfuqii+YsiP6fAqg2jYNwaUOzi+zy+p6hiHsBwUqsGaqC+jifC8WkeFzHJ3p
         9bGi50BRrixhKZ/AGczbT2D3DNDVj03v9oFDRRHS2WkCOxSgt0ReT/fFhGpFPPQaiYse
         HjxvkP/NPV8DohAp7J6hq4SeaAVItFAQMsVt+SfbSHFhqvYCiX33LEnBwSQkefvkpPrQ
         yAG2arWbsqrzYzjfXZ0MuU6zVyGjf0a83K1Qw76IAac7k0Q0bdpmgA3og9NEk19823Rs
         PFfEj+kknB+PamtZqAc8GhCIC/I8vL8fk56b6X5XQc+PMdXeDdJWaaRsa4824aUoVD8b
         8PLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691413980; x=1692018780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZW8bAZOpofrAZ+E1cERRtB886PDebwGsovf/Pz2sHNY=;
        b=hZvkaXLwTXomXmTjuPNyUyVBG2nl/Jtp/6crJO3YEUiKAQN/JCCrkQDV3RtU5mqgCX
         xzoxJ1f6L6lSY6gL4DW1SgSWPTp97FzHkSnrdep0LXzzpmaX1z9ft1ssZcvFoDDSfhFx
         l0mAZ1ML9VF5HSc9X7bhLrb9trSd6b8NxYdmM1D6ekrLMtm+4MFh4vCXpTE2cpmhQBjA
         W15nplreTD4Oe5qGbpAM9QDXnzk2R9FMOCl58nKYk1l9YRkiWgRp+0XlusBdd5ecxZDn
         vqIsrLbWVpHGhe4PZWmfs6zjlaiYhdALoxwdnh0yStNbfPJxbkjINGB77f1X4Tu16u3m
         HAZQ==
X-Gm-Message-State: AOJu0Yxyo2U3SmagRyk+8eZrvxm3lJB7l08xhI6xpLULkIfri/DniCNA
        8VWH8+ys1yOdqn1jtwcsUwqrCw==
X-Google-Smtp-Source: AGHT+IFgUw/IsPxcji669Ya7tWBBXSklfkr9EK6+mKTk1ImVlXR/2gF4Mefli/6npyXEZ+Id6V2QeA==
X-Received: by 2002:a1c:f60b:0:b0:3fa:991c:2af9 with SMTP id w11-20020a1cf60b000000b003fa991c2af9mr5860825wmc.16.1691413980429;
        Mon, 07 Aug 2023 06:13:00 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id j9-20020a5d4489000000b0031411b7087dsm10618428wrq.20.2023.08.07.06.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 06:13:00 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/3] media: dt-bindings: samsung,exynos4212-fimc-is: replace duplicate pmu node with phandle
Date:   Mon,  7 Aug 2023 15:12:54 +0200
Message-Id: <20230807131256.254243-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The FIMC IS camera must access the PMU (Power Management Unit) IO memory
to control camera power.  This was achieved by duplicating the PMU node
as its child like:

  soc@0 {
    system-controller@10020000 { ... }; // Real PMU

    camera@11800000 {
      fimc-is@12000000 {
        // FIMC IS camera node
        pmu@10020000 {
          reg = <0x10020000 0x3000>; // Fake PMU node
        };
      };
    };
  };

This is not a correct representation of the hardware.  Mapping the PMU
(Power Management Unit) IO memory should be via syscon-like phandle
(samsung,pmu-syscon, already used for other drivers), not by duplicating
"pmu" Devicetree node inside the FIMC IS.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Add Rb tag.
---
 .../media/samsung,exynos4212-fimc-is.yaml         | 15 ++++++++++-----
 .../devicetree/bindings/media/samsung,fimc.yaml   |  5 +----
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.yaml b/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.yaml
index 3691cd4962b2..3a5ff3f47060 100644
--- a/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.yaml
+++ b/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.yaml
@@ -75,13 +75,20 @@ properties:
   power-domains:
     maxItems: 1
 
+  samsung,pmu-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Power Management Unit (PMU) system controller interface, used to
+      power/start the ISP.
+
 patternProperties:
   "^pmu@[0-9a-f]+$":
     type: object
     additionalProperties: false
+    deprecated: true
     description:
       Node representing the SoC's Power Management Unit (duplicated with the
-      correct PMU node in the SoC).
+      correct PMU node in the SoC). Deprecated, use samsung,pmu-syscon.
 
     properties:
       reg:
@@ -131,6 +138,7 @@ required:
   - clock-names
   - interrupts
   - ranges
+  - samsung,pmu-syscon
   - '#size-cells'
 
 additionalProperties: false
@@ -179,15 +187,12 @@ examples:
                  <&sysmmu_fimc_fd>, <&sysmmu_fimc_mcuctl>;
         iommu-names = "isp", "drc", "fd", "mcuctl";
         power-domains = <&pd_isp>;
+        samsung,pmu-syscon = <&pmu_system_controller>;
 
         #address-cells = <1>;
         #size-cells = <1>;
         ranges;
 
-        pmu@10020000 {
-            reg = <0x10020000 0x3000>;
-        };
-
         i2c-isp@12140000 {
             compatible = "samsung,exynos4212-i2c-isp";
             reg = <0x12140000 0x100>;
diff --git a/Documentation/devicetree/bindings/media/samsung,fimc.yaml b/Documentation/devicetree/bindings/media/samsung,fimc.yaml
index 79ff6d83a9fd..530a08f5d3fe 100644
--- a/Documentation/devicetree/bindings/media/samsung,fimc.yaml
+++ b/Documentation/devicetree/bindings/media/samsung,fimc.yaml
@@ -236,15 +236,12 @@ examples:
                      <&sysmmu_fimc_fd>, <&sysmmu_fimc_mcuctl>;
             iommu-names = "isp", "drc", "fd", "mcuctl";
             power-domains = <&pd_isp>;
+            samsung,pmu-syscon = <&pmu_system_controller>;
 
             #address-cells = <1>;
             #size-cells = <1>;
             ranges;
 
-            pmu@10020000 {
-                reg = <0x10020000 0x3000>;
-            };
-
             i2c-isp@12140000 {
                 compatible = "samsung,exynos4212-i2c-isp";
                 reg = <0x12140000 0x100>;
-- 
2.34.1

