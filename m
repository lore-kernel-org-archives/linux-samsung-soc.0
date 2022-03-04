Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12F6C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Mar 2022 12:25:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238047AbiCDMZx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Mar 2022 07:25:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237786AbiCDMZw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Mar 2022 07:25:52 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 299D21B01A5
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Mar 2022 04:25:05 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9BF163F621
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Mar 2022 12:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646396703;
        bh=8rZ/otR1F7WKrTMiyMk5wOYz0m0MXO9OQ24s6TpVerE=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=DwHhy6+MPsP1aNRmjIxp8rPI560OReEVAFxq1bdoGMdK5si1DrRboKxrzF9Pw/wln
         gEQZWkAY/jL8KlQXqc/qxl3l3mv9aM+x79lCT5kRoloz6xKKTHO0mftbIOZpQaLiCZ
         qKmlffLcSglclaIOIRr1fG4CVDAHMhXLPbdE8dUpYii0vegg+GSGmpfJxgFBZUnqO+
         rmmzdyv7hg/Z0gc6EZSxSAF6cM8Q7BXPRTJ9kbXYb/usMO4QF1HKk1FZC7gkYJftxn
         uP0jNT79K/VFzY23PlLsjps0EqQtOb4h5YggsIV/cw41faNJUAZAcJ2mi7Dvp2GBuC
         HItU9pUtdYmnA==
Received: by mail-ed1-f70.google.com with SMTP id bq19-20020a056402215300b0040f276105a4so4506605edb.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Mar 2022 04:25:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8rZ/otR1F7WKrTMiyMk5wOYz0m0MXO9OQ24s6TpVerE=;
        b=Gnk2x+ZMyVABUQRtWhckXe3YzlzNgabxnetro/RxnpAGFKtn4x3MiNpfhtz7Q0dwPh
         HNNst1tEQGVK+2rf5yJWToDL1ttRID8VBZ5rFS6CFv0FfjWuqZ/Hp8r4QJB6P4xTqgCS
         15yAkMdfa6EfYjJItGNX+Ib57gvPEnQtpftQ19f5rfEBTLVTgF9ox5C+jqRjuNhjm6AS
         bOODiz9LXp0I/O4l0WKevSfc0rg1sDLPvozHiYtdZboipMKV1dBTPAQdEdeI2oGZ04wY
         3MVRo7E3cnT9ots3ZgWt5cf7aU6MlbhQZ1uvi6f3gvttdCTughDr3pS9GagTS0mqIEMg
         k4VA==
X-Gm-Message-State: AOAM533ACTCJKiSdk1icBc2hxGQmlfoLQtHhqkFdoFw1uBzpazuAsO6k
        L2vNv/ggdFkmein08LnYHSBHpEJTECGzt10rBNBt0M3LsD/e3AE/oVwipYvdlXvkfEtqrRQXAu9
        NtUR9Gl9c1kePf/P/TtjmkxbR071wYwxawZ3lA0E6jwKddDF7
X-Received: by 2002:a17:907:168a:b0:6da:9167:47dc with SMTP id hc10-20020a170907168a00b006da916747dcmr6181645ejc.126.1646396703282;
        Fri, 04 Mar 2022 04:25:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYnlrU15FhMF0oUQPKf5WnMr8bWPH6aPXJDLlecWPFgjllSaff6YzTPQ5Q1kJHCpa0MndoPQ==
X-Received: by 2002:a17:907:168a:b0:6da:9167:47dc with SMTP id hc10-20020a170907168a00b006da916747dcmr6181627ejc.126.1646396703104;
        Fri, 04 Mar 2022 04:25:03 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id r23-20020aa7da17000000b00415a1431488sm2047368eds.4.2022.03.04.04.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 04:25:02 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 2/4] ARM: dts: exynos: add a specific compatible to MCT
Date:   Fri,  4 Mar 2022 13:24:22 +0100
Message-Id: <20220304122424.307885-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220304122424.307885-1-krzysztof.kozlowski@canonical.com>
References: <20220304122424.307885-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

One compatible is used for the Multi-Core Timer on most of the Samsung
Exynos SoCs, which is correct but not specific enough.  These MCT blocks
have different number of interrupts, so add a second specific
compatible to Exynos3250 and all Exynos5 SoCs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi | 3 ++-
 arch/arm/boot/dts/exynos5250.dtsi | 3 ++-
 arch/arm/boot/dts/exynos5260.dtsi | 3 ++-
 arch/arm/boot/dts/exynos54xx.dtsi | 3 ++-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index ae644315855d..41bb421e67c2 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -269,7 +269,8 @@ gic: interrupt-controller@10481000 {
 		};
 
 		timer@10050000 {
-			compatible = "samsung,exynos4210-mct";
+			compatible = "samsung,exynos3250-mct",
+				     "samsung,exynos4210-mct";
 			reg = <0x10050000 0x800>;
 			interrupts = <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 5baaa7eb71a4..63d1dcf2c55c 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -245,7 +245,8 @@ clock_audss: audss-clock-controller@3810000 {
 		};
 
 		timer@101c0000 {
-			compatible = "samsung,exynos4210-mct";
+			compatible = "samsung,exynos5250-mct",
+				     "samsung,exynos4210-mct";
 			reg = <0x101C0000 0x800>;
 			clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MCT>;
 			clock-names = "fin_pll", "mct";
diff --git a/arch/arm/boot/dts/exynos5260.dtsi b/arch/arm/boot/dts/exynos5260.dtsi
index 56271e7c4587..ff1ee409eff3 100644
--- a/arch/arm/boot/dts/exynos5260.dtsi
+++ b/arch/arm/boot/dts/exynos5260.dtsi
@@ -333,7 +333,8 @@ chipid: chipid@10000000 {
 		};
 
 		mct: timer@100b0000 {
-			compatible = "samsung,exynos4210-mct";
+			compatible = "samsung,exynos5260-mct",
+				     "samsung,exynos4210-mct";
 			reg = <0x100B0000 0x1000>;
 			clocks = <&fin_pll>, <&clock_peri PERI_CLK_MCT>;
 			clock-names = "fin_pll", "mct";
diff --git a/arch/arm/boot/dts/exynos54xx.dtsi b/arch/arm/boot/dts/exynos54xx.dtsi
index 2ddb7a5f12b3..3ec43761d8b9 100644
--- a/arch/arm/boot/dts/exynos54xx.dtsi
+++ b/arch/arm/boot/dts/exynos54xx.dtsi
@@ -74,7 +74,8 @@ smp-sram@53000 {
 		};
 
 		mct: timer@101c0000 {
-			compatible = "samsung,exynos4210-mct";
+			compatible = "samsung,exynos5420-mct",
+				     "samsung,exynos4210-mct";
 			reg = <0x101c0000 0xb00>;
 			interrupts-extended = <&combiner 23 3>,
 					      <&combiner 23 4>,
-- 
2.32.0

