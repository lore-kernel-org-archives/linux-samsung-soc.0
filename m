Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D24C04E69
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 15 Aug 2023 06:10:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234980AbjHOGJh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 15 Aug 2023 02:09:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235053AbjHOGI4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 15 Aug 2023 02:08:56 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 439851985
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Aug 2023 23:07:46 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-99c1d03e124so624398766b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Aug 2023 23:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692079665; x=1692684465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wTMk4Woz/EZYIcqFQgzmU+/E3P8H+JM4A/YpF4NCfqM=;
        b=urnxjSqxMikEQfcT3KMGuKLsicozlpx+/A3pk4LSGdGyzx65TEztG8CVtPO8HMkV9l
         vbuZs7FHyQ4EAH7n5d+BeMTgqPJrjNxNK/WZmvyHuAzBHsByuEenRFTZM8wiUuhPovcb
         bFunCRlw/ocxSZ6u4E5Jgi5y1zlSImYlHcLTCY0YIIfWowNmUov3rhWxT+vUm2+mMYQB
         /XHSqgthQ1Fi7XYtZqppvmLy2XRmv7FPDvbIrgf7baXRgHfM5ewiWknzzZfOWnusm//s
         xjRKYExIz3OQS4KO7DhSMAvcqlm/JYTV3ExoC7+GaSi2kpVkYOPS26X6jfToakRPGE6Z
         yy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692079665; x=1692684465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wTMk4Woz/EZYIcqFQgzmU+/E3P8H+JM4A/YpF4NCfqM=;
        b=EY+vptJDHjJQC0C/aLY99QCya0lak7hgk3CeSv8RrPqgS9G89UCqDiH4GzIjaHLapG
         9v1v76hofjy3PRlJrj+ws37JELCZP9jsObFfqavir7hr7NiOnQn3G+XYCM12Kgin4zir
         jjwJb/iXeZdILDer+ZLr9nugdhcxfwSXNrwTOOSo5QY4cJAp/XK4WUrKCMlyPGLTt8kQ
         M3q2Xjp9W2C/9s4z4PI/tAHlethGVqkaXeatcqjQuCCaHZMONzJqEXkDPtURu7YdSQ6w
         odlysuZW7Jle4o2xMsHBvPKkwmS8AL0thxSHnRFX+91bf3YmXbgls/pENJSUAG2j+IvF
         PpRw==
X-Gm-Message-State: AOJu0Yw1YcHsN12WLcLmrnV6Pms3x4lNLm/f9iQ9qNvW9IFVDp209NwM
        s7rOYcrW6ThKEiKHaRi+ab+jZg==
X-Google-Smtp-Source: AGHT+IGZxgRb22WFOJacUKaIsnXaedC55nsD+lKx7gM4qBsvSd7OIO9GZpJ4Vqr+kVLhrnl/mVhWGg==
X-Received: by 2002:a17:906:cc4f:b0:99b:cb7a:c164 with SMTP id mm15-20020a170906cc4f00b0099bcb7ac164mr8974236ejb.62.1692079664754;
        Mon, 14 Aug 2023 23:07:44 -0700 (PDT)
Received: from krzk-bin.. ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id gw4-20020a170906f14400b00993b381f808sm6528093ejb.38.2023.08.14.23.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 23:07:44 -0700 (PDT)
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
Subject: [PATCH v3 1/3] media: dt-bindings: samsung,exynos4212-fimc-is: replace duplicate pmu node with phandle
Date:   Tue, 15 Aug 2023 08:07:37 +0200
Message-Id: <20230815060739.30160-1-krzysztof.kozlowski@linaro.org>
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

Changes in v3:
1. None

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

