Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8060C38A23
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Jan 2023 15:54:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231375AbjATPyu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Jan 2023 10:54:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231650AbjATPyf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 10:54:35 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75853CFD29
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 07:54:25 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so6148589wma.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 07:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4HSb4CmABtKmlomwbvp4nX1h5Hso98yPVlLAhjAEjQ=;
        b=NFvonsrCpa1/HDYc67FplCVs6GSE9m0yUsGlTT88OuygVrij6GAb7JkZalqb2CUZth
         zcBObdTPggI2cTsl46IWHkGph4dkh7J76Cr9F5oLZKZ5VPrGQutJBsZUO9nJdMenSctE
         HEcCBhWjZrzAmFFjw58cdjftR2s3voFanNJXn7RwTBIe/QzBvbzErChA0L7/O9JvgB1w
         6Pv3Lm9IcnLCYhhCNlZkWDCqtyneWTsmBoj29hDqqZSt3KUbhRr86PPZVWetnSuAmoH2
         bDAbyk+B3cVbxtH5lx2hWS8NnivDWH1Cl3BX9n/6AD33Ns5Ut8hxHU2K31p6AjzxjUHI
         IIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V4HSb4CmABtKmlomwbvp4nX1h5Hso98yPVlLAhjAEjQ=;
        b=nQNCbGEoC0UXX923OjWQVKA/JZUKgZ8n/xtBiWChpx95EO7PJ7to99ETmGqi9uoeL1
         fG8axXZ4ktL1c6tz91i6eJlLZgi/j2FzBHKlQofszh6dqQI1GFDbXhLgtlVP0HdXMx4m
         P8Eg5BBi1x93qZRS1VKf8dDMhn0WreFaZDYPAZMBkRxFBO5e++bEXR+AkCC0yxbcShXJ
         vOua0n2iRr7lYo/HS0oSQkxpIQAtth651bPgu4HIXTiE1GBdflgoJiZBvZHC7jEJG6kp
         W8jze9Fcmw+GI+rxjBMuJRnokEBwed9NBVhWXONZyly2AlBoJkIVNkxNer6EBqVHdmMq
         QLjQ==
X-Gm-Message-State: AFqh2kqkM8wTmnSiZFpX8OTr1TTJEbBbFMBEf7aXZpso5Y1P40cU8xr7
        tkIKv1twVRb07zQizN3KKdALAw==
X-Google-Smtp-Source: AMrXdXvbOH3SFcKsMG0jy+5e9JWTMOrmU/YgM9lPiYHVnFVEOFm+Rp2aWQJ27LYidTZef1sbXow4Ew==
X-Received: by 2002:a05:600c:2116:b0:3d6:10e:68a8 with SMTP id u22-20020a05600c211600b003d6010e68a8mr11050450wml.0.1674230064782;
        Fri, 20 Jan 2023 07:54:24 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n42-20020a05600c3baa00b003d96efd09b7sm3349596wms.19.2023.01.20.07.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 07:54:24 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     replicant@osuosl.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 08/11] ARM: dts: exynos: align HSOTG/USB node names
Date:   Fri, 20 Jan 2023 16:54:01 +0100
Message-Id: <20230120155404.323386-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120155404.323386-1-krzysztof.kozlowski@linaro.org>
References: <20230120155404.323386-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The DT schema expect HSOTG node names to be named "usb":

  exynos4210-smdkv310.dtb: hsotg@12480000: $nodename:0: 'hsotg@12480000' does not match '^usb(@.*)?'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos3250.dtsi | 2 +-
 arch/arm/boot/dts/exynos4.dtsi    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 9b25449d5311..36b47c2c1663 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -365,7 +365,7 @@ sysmmu_fimd0: sysmmu@11e20000 {
 			#iommu-cells = <0>;
 		};
 
-		hsotg: hsotg@12480000 {
+		hsotg: usb@12480000 {
 			compatible = "samsung,s3c6400-hsotg";
 			reg = <0x12480000 0x20000>;
 			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 5c4ecda27a47..55afe9972460 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -362,7 +362,7 @@ exynos_usbphy: exynos-usbphy@125b0000 {
 			status = "disabled";
 		};
 
-		hsotg: hsotg@12480000 {
+		hsotg: usb@12480000 {
 			compatible = "samsung,s3c6400-hsotg";
 			reg = <0x12480000 0x20000>;
 			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.34.1

