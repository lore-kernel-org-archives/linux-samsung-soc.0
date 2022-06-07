Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D732FC43334
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jun 2022 08:52:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237656AbiFGIwx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jun 2022 04:52:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238666AbiFGIwo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 04:52:44 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4EAA1C903
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 01:52:42 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id z7so22017755edm.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jun 2022 01:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OapD3u8DomPXjbd8E0R7YCXIachZWLk3usrmeEbpFXo=;
        b=pwe80uBatLu7X4lqc+cj/wQz5j6Z12sV71Cs5XsOfAK7RC/EW6emZgCSstiPvQD5HO
         CxdFNdFYsCepMxsW4n+Xq+CWSK/Zi1OboF9pUcVaxlZNpBSqvOscWGrUoAaGO8yYghdd
         jW25ILEukRsJmIOJJlP67CIZz6JRAFFc3e40Rl7D1RCYuGdp3ArYMv2zIwNeGl6EY5Kl
         JZmvyWdShxVGGBDETh+MuVS7FmTz+yA6+a4owsh+KGbSm5AMMi2tbYM2ykSg9wpxzqBw
         EeHKSZQ7g/WZVpmPbY9zJ97oh7ZWFXtOKeCxhA2qeMBKBRJM1ymJBM8lScZlKYG7L/V6
         FgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OapD3u8DomPXjbd8E0R7YCXIachZWLk3usrmeEbpFXo=;
        b=ohaehztveuJy3+FjbwSREFXkS/CItA7sCU9glgTvf4raUWEic/3uLQoHfK720o1Y9o
         xpKwCZGq37OVXYAEU1hZEzj9+MOuF2DqLyTFpOxb0hmL4wxJf3RcTXE7MY6iM9+gEkZs
         xlWlk3w25awaZjdiyCLN0E3EH5tYpZalL9sRIaFnU8zl75GDT7aNuNMtFTxItEeGFnJj
         20YbucUfZBxxXhnS0gV+0SA4CVXwZ0abSj/ETi3sMk3aoK2L4yJQ7W6SJROmuRZMMrv0
         1TDaZdwWtvfTH2uF0cR4o7bklzt1cvCug9NFue3Giu6fKhp3KoGFV4Vav4J+jSi+Zi5G
         80Qw==
X-Gm-Message-State: AOAM5333ySClqJ6D2HI9G4qWupc77ek3EGMWIkJ/ilNpd8VYk+GjMETh
        tcjCk+lrHllBRW256g/aMYM7VA==
X-Google-Smtp-Source: ABdhPJw7RJjDpizAzDQGq5EM/WF+JeSoXP061+e/qJWgF/HEWaNinPmoyUFpT1f32/n3NwbhzYHz5Q==
X-Received: by 2002:a05:6402:254e:b0:431:35df:5e38 with SMTP id l14-20020a056402254e00b0043135df5e38mr17145811edb.385.1654591962303;
        Tue, 07 Jun 2022 01:52:42 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id lk24-20020a170906cb1800b006fa84a0af2asm7458137ejb.16.2022.06.07.01.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 01:52:41 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 8/8] ARM: dts: exynos: add function and color to LED nodes in Odroid XU/XU3
Date:   Tue,  7 Jun 2022 10:52:31 +0200
Message-Id: <20220607085231.72246-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607085231.72246-1-krzysztof.kozlowski@linaro.org>
References: <20220607085231.72246-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add common LED properties - the function and color - to LED nodes in
Exynos5422 Odroid XU/XU3/XU3-Lite.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi b/arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi
index 982752e1df24..4e17c040d0be 100644
--- a/arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi
+++ b/arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi
@@ -9,6 +9,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	led-controller-1 {
@@ -16,6 +17,8 @@ led-controller-1 {
 
 		led-1 {
 			label = "green:mmc0";
+			function = LED_FUNCTION_DISK_ACTIVITY;
+			color = <LED_COLOR_ID_GREEN>;
 			pwms = <&pwm 1 2000000 0>;
 			pwm-names = "pwm1";
 			/*
@@ -28,6 +31,8 @@ led-1 {
 
 		led-2 {
 			label = "blue:heartbeat";
+			function = LED_FUNCTION_HEARTBEAT;
+			color = <LED_COLOR_ID_BLUE>;
 			pwms = <&pwm 2 2000000 0>;
 			pwm-names = "pwm2";
 			max-brightness = <255>;
@@ -40,6 +45,8 @@ led-controller-2 {
 
 		led-3 {
 			label = "red:microSD";
+			function = LED_FUNCTION_DISK_ACTIVITY;
+			color = <LED_COLOR_ID_RED>;
 			gpios = <&gpx2 3 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 			linux,default-trigger = "mmc1";
-- 
2.34.1

