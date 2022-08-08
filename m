Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A337C00140
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Aug 2022 18:16:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244215AbiHHSQH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 8 Aug 2022 14:16:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243931AbiHHSQE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 8 Aug 2022 14:16:04 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8CDB120A3
        for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Aug 2022 11:16:01 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id v5so5210140wmj.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Aug 2022 11:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=jwpB4SBICrxpQZFhOApDSXu/bCSEYaYVhT4OUlCJ//g=;
        b=LtkigQ0ABWSJBlvEqNXo1Kah3dvRFTEcc2gpwobRB4K5ST3nm8hU/TwWCRl+j6N40Q
         Jg7PtMG2BpKf5EmLQvPDA867mPSbyF2MuO50RcS6ZOxHtG1SnRqoUwd0+P42ZYCiD6KU
         f5zS/oxM4JHsZtczer9YqFFctp/VHueA532368065Qd72m4sradr3up1KIKtsnCH4smT
         2v8wkfgld63yAu/z5xSB3oWVkac30ysnTc6ROn/pNLnSe3eYd5OKfWuhrSSg+6XhoerV
         FO857yjP7z8vfWlLuky8c50D+5FCsBsIjET7lE6eulZdpJaI5F9BN6emXRmi2foOCC6h
         hCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=jwpB4SBICrxpQZFhOApDSXu/bCSEYaYVhT4OUlCJ//g=;
        b=zjL9rd1PLF96ZpiYjsGJDhvsPlEugmZ9GMxeiEixdKw/nL3L7q1sWmiYwM+hQIjRjt
         /gZDwsEqH7YichL68m6nXXvSxSwM1tI1WdtxAc+v9UGeaPUtE+nkm2gD+qNMeriw14Bc
         fwfloGkLJLLlsO2cZiZQx+ScMYDmIt41Rsfr/K1u1QjTWlBpLdfpFn5QnnexKDdzdK/V
         8WsBL3o7K2RBziHb++Z0oXREzZDm/hE/hN0u0waZ0G0VG1T2J429Z+HZ2dw7iHtjeusi
         lbjvWE/WO26NNAG/Vp2eiGvM7wwiBXgEn9Rtm5YogsGQt8YOVDZBnRG1Hf4xIM313Ifw
         wC0w==
X-Gm-Message-State: ACgBeo1p8my3dPGfQAeE3PD3YE9kWb76byQ3QGonqcDxEKP6hl2dgN9S
        0brzm7z1r5VTyPiczGQ1mdHblA==
X-Google-Smtp-Source: AA6agR6ZDsxOt5M5z2VAtx65/CeAg58R1uLsJAkCcRmvd4+UGb8OXpw3NjMyu07m1IhYsDQj/qNpLA==
X-Received: by 2002:a05:600c:4ecc:b0:3a3:3861:72c2 with SMTP id g12-20020a05600c4ecc00b003a3386172c2mr18362200wmq.46.1659982561527;
        Mon, 08 Aug 2022 11:16:01 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id j6-20020a05600c190600b003a31b79dc0esm42252297wmq.1.2022.08.08.11.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 11:16:01 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] dt-bindings: clock: Add bindings for Exynos850 CMU_MFCMSCL
Date:   Mon,  8 Aug 2022 21:16:00 +0300
Message-Id: <20220808181600.10491-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

CMU_MFCMSCL generates MFC, M2M, MCSC and JPEG clocks for BLK_MFCMSCL.
Add clock indices and binding documentation for CMU_MFCMSCL.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 .../clock/samsung,exynos850-clock.yaml        | 25 +++++++++++++++
 include/dt-bindings/clock/exynos850.h         | 32 ++++++++++++++++++-
 2 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
index c9f78ae7a9fa..fdd9ccee49c4 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
@@ -39,6 +39,7 @@ properties:
       - samsung,exynos850-cmu-dpu
       - samsung,exynos850-cmu-hsi
       - samsung,exynos850-cmu-is
+      - samsung,exynos850-cmu-mfcmscl
       - samsung,exynos850-cmu-peri
 
   clocks:
@@ -216,6 +217,30 @@ allOf:
             - const: dout_is_vra
             - const: dout_is_gdc
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos850-cmu-mfcmscl
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: Multi-Format Codec clock (from CMU_TOP)
+            - description: Memory to Memory Scaler clock (from CMU_TOP)
+            - description: Multi-Channel Scaler clock (from CMU_TOP)
+            - description: JPEG codec clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_mfcmscl_mfc
+            - const: dout_mfcmscl_m2m
+            - const: dout_mfcmscl_mcsc
+            - const: dout_mfcmscl_jpeg
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/exynos850.h b/include/dt-bindings/clock/exynos850.h
index f8bf26f118c1..88d5289883d3 100644
--- a/include/dt-bindings/clock/exynos850.h
+++ b/include/dt-bindings/clock/exynos850.h
@@ -73,7 +73,19 @@
 #define CLK_DOUT_IS_ITP			61
 #define CLK_DOUT_IS_VRA			62
 #define CLK_DOUT_IS_GDC			63
-#define TOP_NR_CLK			64
+#define CLK_MOUT_MFCMSCL_MFC		64
+#define CLK_MOUT_MFCMSCL_M2M		65
+#define CLK_MOUT_MFCMSCL_MCSC		66
+#define CLK_MOUT_MFCMSCL_JPEG		67
+#define CLK_GOUT_MFCMSCL_MFC		68
+#define CLK_GOUT_MFCMSCL_M2M		69
+#define CLK_GOUT_MFCMSCL_MCSC		70
+#define CLK_GOUT_MFCMSCL_JPEG		71
+#define CLK_DOUT_MFCMSCL_MFC		72
+#define CLK_DOUT_MFCMSCL_M2M		73
+#define CLK_DOUT_MFCMSCL_MCSC		74
+#define CLK_DOUT_MFCMSCL_JPEG		75
+#define TOP_NR_CLK			76
 
 /* CMU_APM */
 #define CLK_RCO_I3C_PMIC		1
@@ -225,6 +237,24 @@
 #define CLK_GOUT_IS_SYSREG_PCLK		23
 #define IS_NR_CLK			24
 
+/* CMU_MFCMSCL */
+#define CLK_MOUT_MFCMSCL_MFC_USER		1
+#define CLK_MOUT_MFCMSCL_M2M_USER		2
+#define CLK_MOUT_MFCMSCL_MCSC_USER		3
+#define CLK_MOUT_MFCMSCL_JPEG_USER		4
+#define CLK_DOUT_MFCMSCL_BUSP			5
+#define CLK_GOUT_MFCMSCL_CMU_MFCMSCL_PCLK	6
+#define CLK_GOUT_MFCMSCL_TZPC_PCLK		7
+#define CLK_GOUT_MFCMSCL_JPEG_ACLK		8
+#define CLK_GOUT_MFCMSCL_M2M_ACLK		9
+#define CLK_GOUT_MFCMSCL_MCSC_CLK		10
+#define CLK_GOUT_MFCMSCL_MFC_ACLK		11
+#define CLK_GOUT_MFCMSCL_PPMU_ACLK		12
+#define CLK_GOUT_MFCMSCL_PPMU_PCLK		13
+#define CLK_GOUT_MFCMSCL_SYSMMU_CLK		14
+#define CLK_GOUT_MFCMSCL_SYSREG_PCLK		15
+#define MFCMSCL_NR_CLK				16
+
 /* CMU_PERI */
 #define CLK_MOUT_PERI_BUS_USER		1
 #define CLK_MOUT_PERI_UART_USER		2
-- 
2.30.2

