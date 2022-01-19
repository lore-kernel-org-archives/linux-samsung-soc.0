Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 315EAC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 19 Jan 2022 20:10:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357268AbiASUKQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 19 Jan 2022 15:10:16 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:58546
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1357221AbiASUKN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 Jan 2022 15:10:13 -0500
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D1D3E40046
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jan 2022 20:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642623012;
        bh=OI1v3v2do2JpaG4iEWGXiW3KIkLzyCyv5Mi1khRNczo=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=TQrg4YnbKM/vt2oK8zcGLazqy7A/rK0TpcCU1lV9rHCRs7+oOlRsWH8zDyIfmyLuD
         zHvWU1AfMB/MSD1Kh7naE3Uy4CYqocaHVt7ZmdNjefZjVhInZoa8s68K7n3d9LDX9v
         bUk58eNSI9MnHRXM2yLpBVgQDQx8PxcXC3/67tbgzYu3SKKGwoUt980qEs64Mz406y
         5BqCqjuJlMUtdo5aNvmvfDKOXi6ayAMtRGRyBZSYYGi6EddjoA/V+AqzNV4xUTueeg
         H77A6ZSc3dvnjOZW4Uue9syUZvQsRnhSAcLXRC8fN7c5ytbcSW8GXmSTvYs7jbQFu0
         YfyTRqJ7VdmxA==
Received: by mail-ed1-f70.google.com with SMTP id a18-20020aa7d752000000b00403d18712beso3713892eds.17
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jan 2022 12:10:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OI1v3v2do2JpaG4iEWGXiW3KIkLzyCyv5Mi1khRNczo=;
        b=vXKUK8vCXm7qXsrgTZytE6yaIah8OUs2carWIXh8XQivknl2UD7TeV5HCAV4nkrZ1D
         mKk8cStKX2JM3NhegOoix4IM1uv0va5NU+phm7RTm14pCJXpOGvivfOTMk+qJMzyPX2J
         Yx5EPSnQG1Yutxy84J4j7WBKJe4dnL6EK5ys/FxvIOKEiw7r0pX9rOkHszBYvTPuoBIG
         RemRg568cYyHC6MpmRpSUN+B9Fyl6xCSZpvRNTlh03Kup7GwgQtxz1EFCb9NoPfZIa9o
         IjNSnoSHi/BHBtCvp5efePE49Q04cbpaPJfbwumVDmeAsrE8iey1QC3hCF5lPZSHzGjv
         xWzw==
X-Gm-Message-State: AOAM532HjU1M1yDH0J5OglZddYbpuXRipZUv5OvMndT/ZJvYcPETqCf8
        REUgqcEQZZAb85NR4QN4FvQm4NJuXNWDVN7ywkUdFc8JIlxCzlXYr82qUhotO2sg1hdY9wMOnwa
        6Nt9DNByGooAATDmJPXbtCTPdE40Wnazpn5jxIWp1uNbNSqwn
X-Received: by 2002:a17:907:6d9b:: with SMTP id sb27mr16562566ejc.139.1642623012131;
        Wed, 19 Jan 2022 12:10:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbMDqql6veyRi+CRtgtcNlpTb3anuIsgG8+eGO4+VxQIYp/p5x9Z3ynE8z5H2EjzPVr7tcTw==
X-Received: by 2002:a17:907:6d9b:: with SMTP id sb27mr16562535ejc.139.1642623011894;
        Wed, 19 Jan 2022 12:10:11 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id a26sm215005ejr.213.2022.01.19.12.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 12:10:10 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
        Balletbo i Serra <enric.balletbo@collabora.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Pratyush Yadav <p.yadav@ti.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org
Cc:     Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v4 1/5] ARM: dts: exynos: split dmas into array of phandles in Exynos5250
Date:   Wed, 19 Jan 2022 21:10:01 +0100
Message-Id: <20220119201005.13145-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220119201005.13145-1-krzysztof.kozlowski@canonical.com>
References: <20220119201005.13145-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

"dmas" property should be rather an array of phandles, as dtschema
points.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Andi Shyti <andi@etezian.org>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 139778928b93..102bb57bf704 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -496,8 +496,7 @@ spi_0: spi@12d20000 {
 			status = "disabled";
 			reg = <0x12d20000 0x100>;
 			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&pdma0 5
-				&pdma0 4>;
+			dmas = <&pdma0 5>, <&pdma0 4>;
 			dma-names = "tx", "rx";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -512,8 +511,7 @@ spi_1: spi@12d30000 {
 			status = "disabled";
 			reg = <0x12d30000 0x100>;
 			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&pdma1 5
-				&pdma1 4>;
+			dmas = <&pdma1 5>, <&pdma1 4>;
 			dma-names = "tx", "rx";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -528,8 +526,7 @@ spi_2: spi@12d40000 {
 			status = "disabled";
 			reg = <0x12d40000 0x100>;
 			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&pdma0 7
-				&pdma0 6>;
+			dmas = <&pdma0 7>, <&pdma0 6>;
 			dma-names = "tx", "rx";
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.32.0

