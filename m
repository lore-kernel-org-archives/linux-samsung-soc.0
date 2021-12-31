Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C56C43219
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 31 Dec 2021 16:23:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbhLaQXQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 31 Dec 2021 11:23:16 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:47086
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229719AbhLaQXP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 31 Dec 2021 11:23:15 -0500
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CC6683FFDF
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Dec 2021 16:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640967794;
        bh=TYQDhufvF3dxxVaXqhrn9x3yXNTguVKeSUg6CF/Pu1A=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=ZGM0VUoODkTjCRmr84VxQxB3LHEhK6wFA+McTAnRsWfkvaSHTYTqIgr5TvMDuaLyL
         xNW3rfF6Rz0WjABWijYxv8EsPUZlBj9N8zMBSxaRC+wp+atysVohfOs1+gsITHfELw
         SJOOSYCP2JXCbdlnnhn/vTgFGA6GJvEJ8eqDJd+cvEOqNFefRx05LO+tcgskCXdGtw
         VCkNA8Kz1JUmc9ABGOZcMHwrTsxItz7GcwedQpX5r9t8/4ePO+ZQmF4teKnblxHdTz
         P1M4y3El1Dhf3f+jjf68Ftf95Wn7gxpRFFu0dnpxpoXVH6j32idnn940xayT7nM9QR
         n0m/rxu5wu9QQ==
Received: by mail-lf1-f70.google.com with SMTP id k25-20020a056512331900b004259a8d8090so5258237lfe.12
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Dec 2021 08:23:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TYQDhufvF3dxxVaXqhrn9x3yXNTguVKeSUg6CF/Pu1A=;
        b=um19nvH8RQtsZphyTF6zuvOQ3CmjCY8cW1cBXdGsvHLv5wO0r+oWMfIffygtrjQd6l
         N26G+dx+QG2iockN7bB7VQLaU/I5v/ivSxC7lRTcVaE262ChkKqsgD+ssAK9CxwOASL2
         H+rcmI8BJDNfYn7JTutz8RjbUOEF/YT6IHLdzqxzu5q8X/ni0aHBicCUW/V/x3gqZmsq
         1wRgX1uAdb/K6qs53eH8br2OqDMIgBURyegICxiqT2Fm/V3AsGCDpbSZ1t8x628FBmce
         jOoH9A05cSLJ/Sb9Hc/Fnritd6l5uu2fYvJUcJ7bkVrRnPM9aaw6B8djatwxDyC/c+DG
         LeAA==
X-Gm-Message-State: AOAM532Xc2eWPr+odl3duiv9tMmddTHWkiLhHGbgiGBT3TCBTq4UzUgZ
        xya12OCO6FnH9oYXlUJ3h05NiJpJMBQInGvnc1db6DYE52ijCvWp4zBtSUrFt0tz+OaohgPz8XS
        i3rPHJtNfSPNY+vEgW2+DBdx4NQr4pj9X80voUpYGP5pWFPjy
X-Received: by 2002:ac2:5308:: with SMTP id c8mr15709063lfh.346.1640967793971;
        Fri, 31 Dec 2021 08:23:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfI68aZyORD7ymPiMxjgDgLNurfNGeqb1R1idIOEPZ03VOY//QW61m1jBTSOjmJ3F/SnpnCQ==
X-Received: by 2002:ac2:5308:: with SMTP id c8mr15709039lfh.346.1640967793786;
        Fri, 31 Dec 2021 08:23:13 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id y20sm1510835ljn.69.2021.12.31.08.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Dec 2021 08:23:13 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 19/24] arm64: dts: exynos: align pinctrl with dtschema in Exynos850
Date:   Fri, 31 Dec 2021 17:23:04 +0100
Message-Id: <20211231162309.257587-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211231161930.256733-1-krzysztof.kozlowski@canonical.com>
References: <20211231161930.256733-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Align the pin controller related nodes with dtschema.  No functional
change expected.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../boot/dts/exynos/exynos850-pinctrl.dtsi    | 52 +++++++++----------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
index f576b29c9b16..a71acf358d2d 100644
--- a/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
@@ -13,7 +13,7 @@
 #include <dt-bindings/pinctrl/samsung.h>
 
 &pinctrl_alive {
-	gpa0: gpa0 {
+	gpa0: gpa0-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -30,7 +30,7 @@ gpa0: gpa0 {
 			     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	gpa1: gpa1 {
+	gpa1: gpa1-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -47,7 +47,7 @@ gpa1: gpa1 {
 			     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	gpa2: gpa2 {
+	gpa2: gpa2-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -64,7 +64,7 @@ gpa2: gpa2 {
 			     <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	gpa3: gpa3 {
+	gpa3: gpa3-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -81,7 +81,7 @@ gpa3: gpa3 {
 			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	gpa4: gpa4 {
+	gpa4: gpa4-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -94,7 +94,7 @@ gpa4: gpa4 {
 			     <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	gpq0: gpq0 {
+	gpq0: gpq0-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -134,7 +134,7 @@ uart1_pins: uart1-pins {
 };
 
 &pinctrl_cmgp {
-	gpm0: gpm0 {
+	gpm0: gpm0-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -144,7 +144,7 @@ gpm0: gpm0 {
 		interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	gpm1: gpm1 {
+	gpm1: gpm1-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -154,7 +154,7 @@ gpm1: gpm1 {
 		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	gpm2: gpm2 {
+	gpm2: gpm2-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -164,7 +164,7 @@ gpm2: gpm2 {
 		interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	gpm3: gpm3 {
+	gpm3: gpm3-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -174,7 +174,7 @@ gpm3: gpm3 {
 		interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	gpm4: gpm4 {
+	gpm4: gpm4-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -184,7 +184,7 @@ gpm4: gpm4 {
 		interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	gpm5: gpm5 {
+	gpm5: gpm5-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -256,7 +256,7 @@ spi2_pins: spi2-pins {
 };
 
 &pinctrl_aud {
-	gpb0: gpb0 {
+	gpb0: gpb0-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -264,7 +264,7 @@ gpb0: gpb0 {
 		#interrupt-cells = <2>;
 	};
 
-	gpb1: gpb1 {
+	gpb1: gpb1-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -322,7 +322,7 @@ aud_fm_idle_pins: aud-fm-idle-pins {
 };
 
 &pinctrl_hsi {
-	gpf2: gpf2 {
+	gpf2: gpf2-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -367,7 +367,7 @@ sd2_pdn_pins: sd2-pdn-pins {
 };
 
 &pinctrl_core {
-	gpf0: gpf0 {
+	gpf0: gpf0-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -375,7 +375,7 @@ gpf0: gpf0 {
 		#interrupt-cells = <2>;
 	};
 
-	gpf1: gpf1 {
+	gpf1: gpf1-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -434,7 +434,7 @@ sd0_bus8_pins: sd0-bus8-pins {
 };
 
 &pinctrl_peri {
-	gpc0: gpc0 {
+	gpc0: gpc0-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -442,7 +442,7 @@ gpc0: gpc0 {
 		#interrupt-cells = <2>;
 	};
 
-	gpc1: gpc1 {
+	gpc1: gpc1-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -450,7 +450,7 @@ gpc1: gpc1 {
 		#interrupt-cells = <2>;
 	};
 
-	gpg0: gpg0 {
+	gpg0: gpg0-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -458,7 +458,7 @@ gpg0: gpg0 {
 		#interrupt-cells = <2>;
 	};
 
-	gpg1: gpg1 {
+	gpg1: gpg1-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -466,7 +466,7 @@ gpg1: gpg1 {
 		#interrupt-cells = <2>;
 	};
 
-	gpg2: gpg2 {
+	gpg2: gpg2-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -474,7 +474,7 @@ gpg2: gpg2 {
 		#interrupt-cells = <2>;
 	};
 
-	gpg3: gpg3 {
+	gpg3: gpg3-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -482,14 +482,14 @@ gpg3: gpg3 {
 		#interrupt-cells = <2>;
 	};
 
-	gpp0: gpp0 {
+	gpp0: gpp0-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
 		interrupt-controller;
 		#interrupt-cells = <2>;
 	};
-	gpp1: gpp1 {
+	gpp1: gpp1-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -497,7 +497,7 @@ gpp1: gpp1 {
 		#interrupt-cells = <2>;
 	};
 
-	gpp2: gpp2 {
+	gpp2: gpp2-gpio-bank {
 		gpio-controller;
 		#gpio-cells = <2>;
 
-- 
2.32.0

