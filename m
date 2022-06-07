Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA79C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jun 2022 08:52:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238690AbiFGIwv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jun 2022 04:52:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238635AbiFGIwm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 04:52:42 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC0FE193EC
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 01:52:40 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id c2so22028196edf.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jun 2022 01:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FAcjGt3UJf1b3YwbNE0HOPIn29zQv8jSwkJdfcFsjz8=;
        b=z3ZyWpaC851Sqq3rWnMXD2nSwvwMcRl8+i8lm8g3t+8W8SDD2/ewsnmxAMmqp8wtor
         Tq4z0WQM9We3AQ4DA6Fjs7q1yqqXThHyCfSMpP4ZUmj4Wma/B0O38BArCdTtB850NqiH
         7rCRObI49vcFLMCwkgNucbP98pzFL4Qn9C8/oCg8R1lKiJBJmLM0mNooLECmFvm7yi/1
         fYVbXU3SG1K3KlvLJr/vsXtgfBSkRTGUA9wqeeBo69zffd08BbGacpyqqCxkPb8q3xp4
         BiufxoK9UkJ6cndWuxjeVRmkBFrVmjjBQGjDXPYlC7J0jKg/Ihrlf6hKx5lpHintL/St
         AzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FAcjGt3UJf1b3YwbNE0HOPIn29zQv8jSwkJdfcFsjz8=;
        b=nsLO+GT5G2yXA3XdmRaTTlL9jop1ps+Yf037d1xFRb2KX+84zsfUOYZ00bfNsBkJ/N
         6mp5w5h46ACAQaSP8/0dLcT9HUbS+Wd6CLskOJIJCen7f0xMn6yH0sW0nkjcMLcdfDP4
         MwV7G2a37XQr84CXJpBq2Q4GQwb3dX7DrnjlM2psKRzr/FTIRcqTfuQJ1K3OOPKyhPOu
         KFPS2cx8wg3Vpp29xM80/ZKj2QMidDVZ7wwzFz+HBuJpLEOYuLXqi6lOw79V+Q+RIz1l
         JUmBqO2AKFIoMLPxyXsYxusrWbr59E+Ce3EQ2yBcAkFvZJFQ39I3WohTx6hQ4u35KJ57
         TWPg==
X-Gm-Message-State: AOAM531EEC1BWVnMzCXZhG5jyd6x53vHT6omTqx8Su6GdpefsjhDeuZm
        UVSdE0QFELG9A9PIYuwiKgJCQw==
X-Google-Smtp-Source: ABdhPJwDzZeVPYvS8ULxbJ1Jld+MuPMYUbVc4NwLrr8W3qBk4cP+m4ga1DgO3my3xt5+dYQxsCxkFg==
X-Received: by 2002:a50:ed12:0:b0:42d:d1d3:493c with SMTP id j18-20020a50ed12000000b0042dd1d3493cmr31295737eds.174.1654591959273;
        Tue, 07 Jun 2022 01:52:39 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id lk24-20020a170906cb1800b006fa84a0af2asm7458137ejb.16.2022.06.07.01.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 01:52:38 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 5/8] ARM: dts: exynos: add function and color to LED nodes in Odroid X/X2
Date:   Tue,  7 Jun 2022 10:52:28 +0200
Message-Id: <20220607085231.72246-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607085231.72246-1-krzysztof.kozlowski@linaro.org>
References: <20220607085231.72246-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add common LED properties - the function and color - to LED nodes in
Exynos4412 Odroid X/X2.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4412-odroidx.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
index 1f17cc30ed14..dfa4adc9a767 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
@@ -9,6 +9,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/leds/common.h>
 #include "exynos4412-odroid-common.dtsi"
 
 / {
@@ -28,12 +29,15 @@ leds {
 		compatible = "gpio-leds";
 		led1 {
 			label = "led1:heart";
+			function = LED_FUNCTION_HEARTBEAT;
+			color = <LED_COLOR_ID_BLUE>;
 			gpios = <&gpc1 0 GPIO_ACTIVE_LOW>;
 			default-state = "on";
 			linux,default-trigger = "heartbeat";
 		};
 		led2 {
 			label = "led2:mmc0";
+			function = LED_FUNCTION_DISK_ACTIVITY;
 			gpios = <&gpc1 2 GPIO_ACTIVE_LOW>;
 			default-state = "on";
 			linux,default-trigger = "mmc0";
-- 
2.34.1

