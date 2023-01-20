Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED307C05027
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Jan 2023 17:31:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbjATRbz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Jan 2023 12:31:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230374AbjATRbk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 12:31:40 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CD90D0D8C
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 09:31:25 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id o17-20020a05600c511100b003db021ef437so4235317wms.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 09:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPDJ68b8IxMUl5mB1tsFwQDgmc6rDP80xVh613X2ajQ=;
        b=zbCADTBQxsQofsRbTh94uiwCE+Qc648XidbvI5CdCs8O/xacqejqzrThdBrPyrYIzx
         zUmnl8NTcGN9vXQ4Y3gBOqf79/O6o/VHqoGklAh6CXyb8ZFfBxxDMwwb0vWGUD2G8PBn
         XtA/ayeaojCofVcAcBshr3hcui8BeH4dF5g+P/jsABcqRZvfIo6194FQzT2NKc1tu2Xp
         qhA2ztPr3cGKxzuh+wrPY/iURtziL8kRIlhZHHHxB0N1W3UG3iRbi9XoaUNSbH+EF4XO
         drR4VcS0e4PBjxBrUd18u0AM6Ex20n6yoWXDl1Tw11Nzwh11Y0qvnEF/oKssmUXEtQns
         +b/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lPDJ68b8IxMUl5mB1tsFwQDgmc6rDP80xVh613X2ajQ=;
        b=BxT3WU+wHTCRQIeNWwvWYc0CuNLW4Jxohy4P6bUa5ykCzwmS8E+Oi30sA66H3qYUhO
         Zz/2galKzLpaZhJAkOabPvpY8gVWCqtmuWy1UQbFDF8pJcD9mlGNSqSKKr4enbh/Tztk
         c2ZGDPNGcd6Hc/FzM7NnNPuDgDFKm7EDaaFQ+4Bmm2/2cuFSFREUT1d5pt0GQ5y05LhM
         QBXvj7oWYnRoTqsSoxvnqdqUFHkpJ9wm7CmimuD7ETurxZsTWoPlq19S65inPDcWfRWw
         dhGBfj403bSwgbcDoXcGa6t+Dtj3lVDNUioHIQtgA4grYHZNkxyBSu8U3VwUAbbWpWWZ
         CIxA==
X-Gm-Message-State: AFqh2kraWOtvYq2d9jhFsbahlLzWw5g9vqd223Bbkg1xBVAoOQqTd7fY
        V8Xk4ivmYlh88LE2h6Itbkza3g==
X-Google-Smtp-Source: AMrXdXsVSMzW2njv7OxvmaEwmew5JekBBPV987YVwQLPl7+fvw2taHhYxWLpSoFBtw2wr6Vaul67vg==
X-Received: by 2002:a05:600c:3d8d:b0:3db:2c8:d7e1 with SMTP id bi13-20020a05600c3d8d00b003db02c8d7e1mr15078867wmb.20.1674235884721;
        Fri, 20 Jan 2023 09:31:24 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id d22-20020a1c7316000000b003db0dbbea53sm2819179wmb.30.2023.01.20.09.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 09:31:24 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/6] arm64: dts: exynos: add VPH_PWR regulator on TM2
Date:   Fri, 20 Jan 2023 18:31:14 +0100
Message-Id: <20230120173116.341270-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120173116.341270-1-krzysztof.kozlowski@linaro.org>
References: <20230120173116.341270-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

VPH_PWR is routed to battery, so it is not configurable.  However few
devices, e.g. WM5110 expect speaker power supplies, thus provide the
regulator for full hardware description.  Audio amplifier also accepts
that power supply.

Keep ordering the nodes by renaming existing IRDA regulator.

This fixes dtbs_check warnings:

  exynos5433-tm2e.dtb: audio-codec@0: 'SPKVDDL-supply' is a required property
  exynos5433-tm2e.dtb: audio-codec@0: 'SPKVDDR-supply' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi      | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 6f701297a665..3785a6580bdf 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -99,11 +99,18 @@ max98504: amplifier@31 {
 
 			DIOVDD-supply = <&ldo3_reg>;
 			DVDD-supply = <&ldo3_reg>;
-			/* PVDD-supply to VPH_PWR */
+			PVDD-supply = <&vph_pwr_regulator>;
 		};
 	};
 
-	irda_regulator: irda-regulator {
+	vph_pwr_regulator: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "VPH_PWR";
+		regulator-min-microvolt = <4200000>;
+		regulator-max-microvolt = <4200000>;
+	};
+
+	irda_regulator: regulator-irda {
 		compatible = "regulator-fixed";
 		enable-active-high;
 		gpio = <&gpr3 3 GPIO_ACTIVE_HIGH>;
@@ -1298,6 +1305,8 @@ wm5110: audio-codec@0 {
 		CPVDD-supply = <&ldo18_reg>;
 		DBVDD2-supply = <&ldo18_reg>;
 		DBVDD3-supply = <&ldo18_reg>;
+		SPKVDDL-supply = <&vph_pwr_regulator>;
+		SPKVDDR-supply = <&vph_pwr_regulator>;
 
 		controller-data {
 			samsung,spi-feedback-delay = <0>;
-- 
2.34.1

