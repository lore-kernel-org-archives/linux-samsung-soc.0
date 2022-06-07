Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9828CCA47F
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jun 2022 08:52:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238650AbiFGIwn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jun 2022 04:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238573AbiFGIwl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 04:52:41 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A295517A86
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 01:52:38 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 25so21768774edw.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jun 2022 01:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8xXqEkcH0037bjomWByGduT1N5+YgK5Gt+P/gddU4Bw=;
        b=D8IUv8a7VPnBrf0aIazoCEC2y70UZkecOpVSFMhKjuRjNqP7oRUkBOhRhvea0E3wxh
         A4tZNjfBhZS8GRqC03gP5gX+w08EqlzrypXQ8jQzAnBs0ZJ3DYuNqsnVJG0n/E3ra7LI
         yWFI+sl6n9BxQg+QqruWnKq1eJThUk/85X7j/n9uWN7Gg8oOsylC+dKIPiHYrFMORrfP
         kwBuNMjmR+MCCnm+F9nuBv+Y1Tx22M5jSb3bkkgsjhrFUU5M6kX8DsKQ3gnFj+Y469J4
         gVrLn0sU31AcLu0kRzHubJ6QWOZa2WVH6Q+qK2RkqkrFfwlYAxn1bMdGcLAe4XGrRyL0
         cpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8xXqEkcH0037bjomWByGduT1N5+YgK5Gt+P/gddU4Bw=;
        b=uiTFqtv7K/ZuYuin+9VQL5RpKEd8RDs4fPbTvpj4go0GDNuBsigcMm65GKV1XVT4Mx
         snWra0fLxI/RtizxvQKbjCWjOz0U/5A852H8Q/bTUt6BRy3kye574WoltS7lRK78Ucl6
         Gv/s7wErr/vKhsCsgOq7ddI5/y9jEm9HRH3OZXANGOzJRJWkdLvQ8+uFBGpPoCtfHfAG
         HEdnhN/xxkRffU+Ss+XCQrGEtbE+Mf7Hv5TIlAPhV3DQHrn0+rRhF50Z9vJQgvdt7a79
         loTZrovBZDPL8rOh0/WDwJjsLiFBCLAUlTCKMvtpujYiV0rgI+fXozObSX2CFJmGy+A1
         cQcA==
X-Gm-Message-State: AOAM532PGQXXJBWHDNHmCG0ctg9MVfuLryrnkPmj4OE4x+PcTt+sVNPo
        BM62s9uZFPuOpio6+466qXYx4l4wotMmrw==
X-Google-Smtp-Source: ABdhPJyxEsRZb3gvxbr12MkfWz8ngZU5UbaABCHYT19Zy93GODUzCV9ltepTwi3JRGT15w8uXCqMkA==
X-Received: by 2002:a05:6402:2806:b0:431:87c8:b45e with SMTP id h6-20020a056402280600b0043187c8b45emr3781509ede.130.1654591957201;
        Tue, 07 Jun 2022 01:52:37 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id lk24-20020a170906cb1800b006fa84a0af2asm7458137ejb.16.2022.06.07.01.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 01:52:36 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/8] ARM: dts: exynos: add function and color to LED nodes in Itop Elite
Date:   Tue,  7 Jun 2022 10:52:26 +0200
Message-Id: <20220607085231.72246-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607085231.72246-1-krzysztof.kozlowski@linaro.org>
References: <20220607085231.72246-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add common LED properties - the function and color - to LED nodes in
Exynos4412 Itop Elite.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4412-itop-elite.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-itop-elite.dts b/arch/arm/boot/dts/exynos4412-itop-elite.dts
index a9406280b979..0dec45a505b0 100644
--- a/arch/arm/boot/dts/exynos4412-itop-elite.dts
+++ b/arch/arm/boot/dts/exynos4412-itop-elite.dts
@@ -11,6 +11,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pwm/pwm.h>
 #include <dt-bindings/sound/samsung-i2s.h>
 #include "exynos4412-itop-scp-core.dtsi"
@@ -29,6 +30,8 @@ leds {
 
 		led2 {
 			label = "red:system";
+			function = LED_FUNCTION_HEARTBEAT;
+			color = <LED_COLOR_ID_RED>;
 			gpios = <&gpx1 0 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 			linux,default-trigger = "heartbeat";
@@ -36,6 +39,7 @@ led2 {
 
 		led3 {
 			label = "red:user";
+			color = <LED_COLOR_ID_RED>;
 			gpios = <&gpk1 1 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 		};
-- 
2.34.1

