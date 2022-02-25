Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C47FDC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 25 Feb 2022 15:37:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242181AbiBYPiH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 25 Feb 2022 10:38:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242185AbiBYPiF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 25 Feb 2022 10:38:05 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71B714D248
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Feb 2022 07:37:31 -0800 (PST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3616740300
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Feb 2022 15:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645803450;
        bh=EaZIuP8aCiZ2Pg8BQs9OaJlXxn1NfGegDq7D5c3gugE=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=JsSXzsfTNd734kbyqf3vgS9sTs4ucbb6XDTYlO855lA0CUgBC5h1I9xUVZgbgmvW3
         PXuE4xhdSOyT+qoPO1zHofk8j9aEtkz00TXGewTuVgEHK4yuhPLP2fzrMhpd8+Y+M/
         I7W/3fFnNqb9mlqbQP2rTYVhtVUkuEDBZz+XPio1juO7r6s2gFRedjvsZ6Uz52QAXq
         y2q3+HtY60FPoOMfOFGt7tTaNJWNv3v6S+9rMv324F/iReYkZn+iOLzPKij6Ey3tBj
         VXFzRkykDXEbeUrTQC3WvPEmCpUHGeeRGqCRjZUe0bw8xj4glhbklqXrpKn5k7dR8T
         Z6migXP8c4XeQ==
Received: by mail-wm1-f69.google.com with SMTP id z15-20020a1c4c0f000000b00380d331325aso1469465wmf.6
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Feb 2022 07:37:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EaZIuP8aCiZ2Pg8BQs9OaJlXxn1NfGegDq7D5c3gugE=;
        b=l1sM49t42GKLvwiTize9LFyqjcUSm5bps7HgFAnwfuawatarUqfCh5dD7PfAqgeJeQ
         2cFswARKn3BVcT6jwRFEvKmyVKRBczvCdBvDbraVSBMvcl03m1lJ8e+sY4CRVYqW+GKM
         dcbS5oog+HaRguTZMQmK5LY+C6JMs0y4zMoRN07Y+GZbarSl51mjbO1GOCnxEIWSJAnL
         JKP+p5bCWjoRLZCsKWAuGkg7A4QSxemgmqzp5teRFKZQdkXjdaz1oAwLmNdrmfPQOnns
         grPlFVgW43ER7yM1ecspEG0uilH9O59ov0c+qTTtnrvZPkcQ7xAGJ5AHZ3RB0CC2rZTe
         YJTQ==
X-Gm-Message-State: AOAM530LSujTbdJlMT/4CNXi8xrH2SM5bnQB1O+j/EsGQ3GdjzpTR1tG
        6ts0g/Jzxphx1x/6hq8RlUEyBsF4Pf/CCSSCGk0G2DMuRCsvcSCDYVqC5Z1qUOlS03oUqglHRMG
        vKdR8yHbChvbJB1bK8xN0jo917hCTfHgGHgEIXrzkkrdvQazC
X-Received: by 2002:a05:600c:54a:b0:381:3b1:cea8 with SMTP id k10-20020a05600c054a00b0038103b1cea8mr3296618wmc.76.1645803449828;
        Fri, 25 Feb 2022 07:37:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzv1D4gTqAbPxLOPgjzglkuWUH3oiR1QobSGW/+QPMmmFGhvoFo79IwgTO/MqnzcQrUp1Nzww==
X-Received: by 2002:a05:600c:54a:b0:381:3b1:cea8 with SMTP id k10-20020a05600c054a00b0038103b1cea8mr3296593wmc.76.1645803449594;
        Fri, 25 Feb 2022 07:37:29 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id p15-20020adfce0f000000b001edc0bcf875sm2647168wrn.102.2022.02.25.07.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 07:37:28 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 2/3] ARM: dts: exynos: add a specific compatible to MCT
Date:   Fri, 25 Feb 2022 16:36:49 +0100
Message-Id: <20220225153650.289923-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220225153650.289923-1-krzysztof.kozlowski@canonical.com>
References: <20220225153650.289923-1-krzysztof.kozlowski@canonical.com>
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

