Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA22C25B0E
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Aug 2022 18:16:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244136AbiHHSQD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 8 Aug 2022 14:16:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243978AbiHHSQC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 8 Aug 2022 14:16:02 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37F82B7D1
        for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Aug 2022 11:16:00 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id v131-20020a1cac89000000b003a4bb3f786bso7826349wme.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Aug 2022 11:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=QRWRO8agMBm5i20KyVm3mywJyV1BaORmn3HrLI4GpCc=;
        b=pwqMX7Q9CHrO7SpRd5ToAko8dl6oZZDH80VvBOh5clpHnWpVs8NYF+2Lkcj/Jw0LFg
         4Xtg6KIDgW8qhTgvAPdYszHFLRiKAjIqAnt/HZ8rQXwdCG6EmEIplo+avaxIuNqeQX68
         Zu0ZKXPRcC8uYjCkBUd8qnhxmeYOVU0p9gJWjaphj713cnryNMs6wZ7sqe/7XAb0ZjmO
         QuevMnxxe7c8L0tEm0bcVRFPfnziEaJJPaVhkvGlU+T0WEUV8ksHddoi1B43e2szwym8
         sTXGjTcFxw3GY781nUbWgkzvVahVhEWor/v2H2pbzTZeOyFA2KtH9304WtRPyAIdjIQw
         XMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=QRWRO8agMBm5i20KyVm3mywJyV1BaORmn3HrLI4GpCc=;
        b=Vpuwgi/a78/5BuCDg/GtWYbQ0SWz5YPvDqEKVyUgrAfSxv2kvTxodZVNu4m5o0ADIm
         z5rFOjl8zLDikOeV1eIvmR5d+SvRf1GOPldT/qTQI1hvLk/5p77mNrzadVFT3StFZAAh
         bE+xTaax0S+psVYjFqqXYAVJ+DzUKR7YhY7A7kcfSeayZ/8jUQx3tcQH+tVUa48hUTAv
         tcYgS+mrNsokad89t2VkiJIgdnjHbbqdMUFSXQ79gLVrDV8hTUg6/LDTtyMKEZ2Z9tcE
         eAC8rm+tvRaSYWTQY5UUUqk1PW0kaa5QW3xIY4gx+zl67FPzbcv1r6IAqx9tGBWNq7FZ
         xMJg==
X-Gm-Message-State: ACgBeo07gb2P3SiI3WYzHT1dGnpV36evbin+MosjYZ/Gpb1zTe/AlARg
        Gz8prbyADTqcwcDPkTr+YtNCqXOQ0Id3qg==
X-Google-Smtp-Source: AA6agR4Wuu50Mj+pYnt7tY3CJjHpyNSUyGeVjSHsZ5J4loZftwx36rOlwB40WstVF6ooDbr2f8BTRA==
X-Received: by 2002:a05:600c:4f07:b0:3a3:2277:7064 with SMTP id l7-20020a05600c4f0700b003a322777064mr13267433wmq.181.1659982558784;
        Mon, 08 Aug 2022 11:15:58 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id m1-20020a7bcb81000000b003a3278d5cafsm18572351wmi.28.2022.08.08.11.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 11:15:58 -0700 (PDT)
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
Subject: [PATCH 1/7] dt-bindings: clock: Add bindings for Exynos850 CMU_AUD
Date:   Mon,  8 Aug 2022 21:15:57 +0300
Message-Id: <20220808181557.10385-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

CMU_AUD generates Cortex-A32 clock, bus clock and audio clocks for
BLK_AUD. Add clock indices and binding documentation for CMU_AUD.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 .../clock/samsung,exynos850-clock.yaml        | 19 ++++++
 include/dt-bindings/clock/exynos850.h         | 68 ++++++++++++++++++-
 2 files changed, 86 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
index 80ba60838f2b..523fdfaae891 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
@@ -33,6 +33,7 @@ properties:
     enum:
       - samsung,exynos850-cmu-top
       - samsung,exynos850-cmu-apm
+      - samsung,exynos850-cmu-aud
       - samsung,exynos850-cmu-cmgp
       - samsung,exynos850-cmu-core
       - samsung,exynos850-cmu-dpu
@@ -88,6 +89,24 @@ allOf:
             - const: oscclk
             - const: dout_clkcmu_apm_bus
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos850-cmu-aud
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: AUD clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_aud
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/exynos850.h b/include/dt-bindings/clock/exynos850.h
index 0b6a3c6a7c90..3dc55d4e5b9e 100644
--- a/include/dt-bindings/clock/exynos850.h
+++ b/include/dt-bindings/clock/exynos850.h
@@ -58,7 +58,10 @@
 #define CLK_MOUT_CLKCMU_APM_BUS		46
 #define CLK_DOUT_CLKCMU_APM_BUS		47
 #define CLK_GOUT_CLKCMU_APM_BUS		48
-#define TOP_NR_CLK			49
+#define CLK_MOUT_AUD			49
+#define CLK_GOUT_AUD			50
+#define CLK_DOUT_AUD			51
+#define TOP_NR_CLK			52
 
 /* CMU_APM */
 #define CLK_RCO_I3C_PMIC		1
@@ -87,6 +90,69 @@
 #define CLK_GOUT_SYSREG_APM_PCLK	24
 #define APM_NR_CLK			25
 
+/* CMU_AUD */
+#define CLK_DOUT_AUD_AUDIF		1
+#define CLK_DOUT_AUD_BUSD		2
+#define CLK_DOUT_AUD_BUSP		3
+#define CLK_DOUT_AUD_CNT		4
+#define CLK_DOUT_AUD_CPU		5
+#define CLK_DOUT_AUD_CPU_ACLK		6
+#define CLK_DOUT_AUD_CPU_PCLKDBG	7
+#define CLK_DOUT_AUD_FM			8
+#define CLK_DOUT_AUD_FM_SPDY		9
+#define CLK_DOUT_AUD_MCLK		10
+#define CLK_DOUT_AUD_UAIF0		11
+#define CLK_DOUT_AUD_UAIF1		12
+#define CLK_DOUT_AUD_UAIF2		13
+#define CLK_DOUT_AUD_UAIF3		14
+#define CLK_DOUT_AUD_UAIF4		15
+#define CLK_DOUT_AUD_UAIF5		16
+#define CLK_DOUT_AUD_UAIF6		17
+#define CLK_FOUT_AUD_PLL		18
+#define CLK_GOUT_AUD_ABOX_ACLK		19
+#define CLK_GOUT_AUD_ASB_CCLK		20
+#define CLK_GOUT_AUD_CA32_CCLK		21
+#define CLK_GOUT_AUD_CNT_BCLK		22
+#define CLK_GOUT_AUD_CODEC_MCLK		23
+#define CLK_GOUT_AUD_DAP_CCLK		24
+#define CLK_GOUT_AUD_GPIO_PCLK		25
+#define CLK_GOUT_AUD_PPMU_ACLK		26
+#define CLK_GOUT_AUD_PPMU_PCLK		27
+#define CLK_GOUT_AUD_SPDY_BCLK		28
+#define CLK_GOUT_AUD_SYSMMU_CLK		29
+#define CLK_GOUT_AUD_SYSREG_PCLK	30
+#define CLK_GOUT_AUD_TZPC_PCLK		31
+#define CLK_GOUT_AUD_UAIF0_BCLK		32
+#define CLK_GOUT_AUD_UAIF1_BCLK		33
+#define CLK_GOUT_AUD_UAIF2_BCLK		34
+#define CLK_GOUT_AUD_UAIF3_BCLK		35
+#define CLK_GOUT_AUD_UAIF4_BCLK		36
+#define CLK_GOUT_AUD_UAIF5_BCLK		37
+#define CLK_GOUT_AUD_UAIF6_BCLK		38
+#define CLK_GOUT_AUD_WDT_PCLK		39
+#define CLK_MOUT_AUD_CPU		40
+#define CLK_MOUT_AUD_CPU_HCH		41
+#define CLK_MOUT_AUD_CPU_USER		42
+#define CLK_MOUT_AUD_FM			43
+#define CLK_MOUT_AUD_PLL		44
+#define CLK_MOUT_AUD_TICK_USB_USER	45
+#define CLK_MOUT_AUD_UAIF0		46
+#define CLK_MOUT_AUD_UAIF1		47
+#define CLK_MOUT_AUD_UAIF2		48
+#define CLK_MOUT_AUD_UAIF3		49
+#define CLK_MOUT_AUD_UAIF4		50
+#define CLK_MOUT_AUD_UAIF5		51
+#define CLK_MOUT_AUD_UAIF6		52
+#define IOCLK_AUDIOCDCLK0		53
+#define IOCLK_AUDIOCDCLK1		54
+#define IOCLK_AUDIOCDCLK2		55
+#define IOCLK_AUDIOCDCLK3		56
+#define IOCLK_AUDIOCDCLK4		57
+#define IOCLK_AUDIOCDCLK5		58
+#define IOCLK_AUDIOCDCLK6		59
+#define TICK_USB			60
+#define AUD_NR_CLK			61
+
 /* CMU_CMGP */
 #define CLK_RCO_CMGP			1
 #define CLK_MOUT_CMGP_ADC		2
-- 
2.30.2

