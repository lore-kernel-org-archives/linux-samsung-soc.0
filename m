Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6183C64EC4
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Feb 2023 19:29:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbjBGT3F (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Feb 2023 14:29:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbjBGT3D (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Feb 2023 14:29:03 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75FD83B0C1
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Feb 2023 11:29:02 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso12297398wms.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Feb 2023 11:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PPt0d21EGc/jow/fpKXjyuyxRoi0vr0T/kgkjEZ24Nk=;
        b=Hen3NJo56OhW8DFZAq4lQYwYUmAbzFS5GJedAd8Sdq669L9i1UG3eQQOeb44CbNj++
         2Y73Igg8vusNGGf87qDyF7ISQ65fAjt8+57ROeYxRyNFRJUx+bcRsPRd6s3cOdw7tFxZ
         jQq7TqB/1yvjmY0Y4m6bfRo7HjM8cnFyYML+bkk3qD1beGYioGGG3QhcBjopb2OWNoeV
         flpfekOHUf1wQaoDfBGkl43WmYUfgsDta9lsRoT4rY+1XZCYXzVOiWUjIB5AlWOaNb93
         C9capCo3nYoEjLIQftbRFSEKJFh31w/Bap2bro74dqmPJf5f4mOe748u6GQZOgbtFqBz
         HREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PPt0d21EGc/jow/fpKXjyuyxRoi0vr0T/kgkjEZ24Nk=;
        b=Hn6PPcXU+dEWUQgKELSXMzg4VKFqPrf6drGOtXMcVUyzcSIto5KoA1sovGlFXl8BWz
         /4flcdd7TXsqXX435g0bdNTJCG5LTpqxOBclCCi27jqp7TCklDCvBMU7Fcr1tsemHeS+
         MIb+PQ+g9pr/KdDGY6i051+DOFIxv19xUL96SO7jmVbeJYZryuamdOm6QoNy0qBO+3U4
         v2ltBn8Ld5HAybfS2Eql6t+jvsS+igVpTCAbgNzU7/z1PF3U9sTKivsQxu2gYb5RL09g
         3qbX5yKCgolR+VR27tSGooBdcQKzZUPbu7v9BJgCDPrOTaYr9lFqGvcbHPPbgKesRvr2
         +25A==
X-Gm-Message-State: AO0yUKUVSgXLjwFZup0lJJGTfBrvCgLMrvsJBmF6O14EW3Z7DXoVxm6g
        OSyU9u0WDKyG3MtRoXPSWQ5hpg==
X-Google-Smtp-Source: AK7set9fz9HQsmLNOGzGZf/2oRs8JqN+jVQHS/qsjtqeFz0RSJPY2xc0aDbDxYtYUoOxixEXOHdJBg==
X-Received: by 2002:a05:600c:3513:b0:3dc:c5c:b94f with SMTP id h19-20020a05600c351300b003dc0c5cb94fmr4084434wmq.39.1675798141001;
        Tue, 07 Feb 2023 11:29:01 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j33-20020a05600c1c2100b003db0ad636d1sm22770818wms.28.2023.02.07.11.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 11:29:00 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] ARM: dts: exynos: move MIPI phy to PMU node in Exynos4
Date:   Tue,  7 Feb 2023 20:28:51 +0100
Message-Id: <20230207192851.549242-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207192851.549242-1-krzysztof.kozlowski@linaro.org>
References: <20230207192851.549242-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The MIPI phy is actually part of the Power Management Unit system
controller.  It does not have its own address space, thus keeping the
node under soc causes warnings:

  xynos4412-i9305.dtb: soc: video-phy: {'compatible': ['samsung,s5pv210-mipi-video-phy'],
    '#phy-cells': [[1]], 'syscon': [[11]], 'phandle': [[13]]} should not be valid under {'type': 'object'}

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4.dtsi    | 13 ++++++-------
 arch/arm/boot/dts/exynos4412.dtsi |  2 +-
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 44dcb1377475..8dd6976ab0a7 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -105,12 +105,6 @@ memory-controller@12570000 {
 			reg = <0x12570000 0x14>;
 		};
 
-		mipi_phy: video-phy {
-			compatible = "samsung,s5pv210-mipi-video-phy";
-			#phy-cells = <1>;
-			syscon = <&pmu_system_controller>;
-		};
-
 		pd_mfc: power-domain@10023c40 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x10023c40 0x20>;
@@ -181,11 +175,16 @@ sys_reg: syscon@10010000 {
 		};
 
 		pmu_system_controller: system-controller@10020000 {
-			compatible = "samsung,exynos4210-pmu", "syscon";
+			compatible = "samsung,exynos4210-pmu", "simple-mfd", "syscon";
 			reg = <0x10020000 0x4000>;
 			interrupt-controller;
 			#interrupt-cells = <3>;
 			interrupt-parent = <&gic>;
+
+			mipi_phy: mipi-phy {
+				compatible = "samsung,s5pv210-mipi-video-phy";
+				#phy-cells = <1>;
+			};
 		};
 
 		dsi_0: dsi@11c80000 {
diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index 11f9dd94b6b3..7fa3e5fd6801 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -798,7 +798,7 @@ &pmu {
 };
 
 &pmu_system_controller {
-	compatible = "samsung,exynos4412-pmu", "syscon";
+	compatible = "samsung,exynos4412-pmu", "simple-mfd", "syscon";
 	clock-names = "clkout0", "clkout1", "clkout2", "clkout3",
 			"clkout4", "clkout8", "clkout9";
 	clocks = <&clock CLK_OUT_DMC>, <&clock CLK_OUT_TOP>,
-- 
2.34.1

