Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82533C3F6B0
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  9 Aug 2022 11:33:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237532AbiHILdd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 9 Aug 2022 07:33:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240823AbiHILd2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 9 Aug 2022 07:33:28 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31692237D3
        for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Aug 2022 04:33:27 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id y13so21595274ejp.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Aug 2022 04:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=jTfBMFFqxbGvOgp0VwE8SaVXdxbb2zeVwI+VWdA5/rE=;
        b=Y0w+wJ5VFA2rAVSJO1ZWztlgzPkVpXtUawhrOsmKnPOP5XjqHjln7kwj18d4jZlcS+
         kczRYRXYq5m0YMqewCNgfc0AtDbZ6zYYiKXEJTJmnRxhxJPiqk/1UEDxJaqkBqkkMMIu
         mD6XX95EoNN1FoeIiwJ2TEFTzQtk08p70IAX/v2IwozCnUrj3mE8mTg5EXSG9CNP29z8
         GEt+zbK5NaVNPcno03tRowsyfMgQJO4cQC6YKutAkunDtpzDYNk3VNp7X/xTvqU3b2X6
         xEpEBNWbbSQAqdozCm3Ldsaqj57sJ6hfONVYBSSCl77OEp25msinuN7gCz5IHa2IqbvM
         wbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=jTfBMFFqxbGvOgp0VwE8SaVXdxbb2zeVwI+VWdA5/rE=;
        b=Mdr4pUS4nI0m/RqvMAA1jVe73TMovut9fWXaKZ/DqMeP0qWPS8OoCIRc8lCag4WYUT
         UdVpVtZBzNbwaNLSrEBJwNArIMSv7rIfgwslRE4CB2nbEDpyo07zTw0G0Hguu4h7b8RN
         M4aFe4AwyzethYc13KvaQ2hVhJy+a4NjTb5eM+C/uDlHzTnlft7lcFffv8k37U+khOVH
         h6fUH0W/HBW9wXygys8d917eVsjzO3Z5g2fc42oZQkiKjfnernnnTkM2qKzTOADIyTbS
         MtjrnDVcaUTD6qtdS+af/d0dJuBoS8z+JFqo5ier2yJ+IX0FaQ4kB7ZEft2tJXv2fXdY
         KVBg==
X-Gm-Message-State: ACgBeo0UEvlbl6Mk1OBkDfEoamfXsttTlYUpkuNYUTK2bFRlrjYvfIta
        sgv29yPFOj4TX+GuOfjHlq4tCA==
X-Google-Smtp-Source: AA6agR6KVl4gyubgkeCMVB/diYxZxD2ReUqGPjjV21Eu4MJ1ThfGHQp0s2QzfAVLu6zPta82T2mh8w==
X-Received: by 2002:a17:907:e89:b0:730:af06:e345 with SMTP id ho9-20020a1709070e8900b00730af06e345mr17666305ejc.665.1660044805663;
        Tue, 09 Aug 2022 04:33:25 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id b1-20020a17090630c100b00732a5b339afsm787652ejb.92.2022.08.09.04.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 04:33:25 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 1/9] dt-bindings: clock: Add bindings for Exynos850 CMU_AUD
Date:   Tue,  9 Aug 2022 14:33:15 +0300
Message-Id: <20220809113323.29965-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220809113323.29965-1-semen.protsenko@linaro.org>
References: <20220809113323.29965-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

CMU_AUD generates Cortex-A32 clock, bus clock and audio clocks for
BLK_AUD. Add clock indices and binding documentation for CMU_AUD.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - (none)

 .../clock/samsung,exynos850-clock.yaml        | 19 ++++++
 include/dt-bindings/clock/exynos850.h         | 68 ++++++++++++++++++-
 2 files changed, 86 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
index aa11815ad3a3..53511f056251 100644
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

