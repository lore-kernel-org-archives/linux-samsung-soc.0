Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92395CCA481
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Jun 2022 17:50:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242197AbiFTRuq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Jun 2022 13:50:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243900AbiFTRuo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Jun 2022 13:50:44 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAA75CE06
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2022 10:50:41 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id s12so22590854ejx.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2022 10:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rKzakFWTWfXnseWFxBBYL7rUhvEO3Gskk+MqcotQ/qY=;
        b=yIVgS9Y91nbzr8uBT04DsbQA9t181ktdKZK1yQ1Jd0jKWaq0vfYcdwzJX+kMCUQgNu
         fCnhGuF9JSDQwTvwhLq7ipEncinHboQIAc/p0/uYRFrsbtH6RqT+7iA3zTfs1cKvJjw5
         5z+d38zbnp//cd0i6KRjv2cljC6IfsNNbUGkJOa8PxUbYC/3abULforXc1xvrhRFDbsJ
         lwyJeYXnbR/teUzWlgtm6WWZ3JrkBL5xPL6DoP3FnsEMdaRa9bD+xBQu0DrYQE6BWTYC
         VeFy+G+h1+OzcF4FLjjJ8RwQU3vPWtlYZ1NbcHBCJ8MYmexvspuYlGU7kJhBAVfDI0Su
         lDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rKzakFWTWfXnseWFxBBYL7rUhvEO3Gskk+MqcotQ/qY=;
        b=sWlOoCtJeZPIFPS8ruG53QcW1lEOXu9lYnm6xQCAqg4WHizvxp6z/iAFIIUob1sHdN
         MOStNdaqgcE5ccR03McpiSEnY00dfVcl4ZUYc4bAruR2pDQ4lvnSu9PQxSlvBvKrqdky
         G/PM9HHyt3G74zqthiIz/AOFhWMnFJgv/D/AaM8T1xgTkcXD4W8Udp/U8lhuLbeDgGSe
         2nW4tBUNxHKkJY0Y4IXnvobobDXFybZpqzgQrkfuLUqyoUdKw57frnOoWZXBiMhW9+uu
         qmERRj2Fg8Q4zOWEfzhTF3omigDLnxx0WLbs2TqbGrGy/qYlHLs0GBM9TZdmOJNnTKac
         CzUA==
X-Gm-Message-State: AJIora895G7shDAnRuCi/SL8n9zIWmuZulLd0/Fq0j8+/iiM3f3UrTUL
        HyLS1IK0noApWeEC5VF8fto4jA==
X-Google-Smtp-Source: AGRyM1t9bF4JL2oWNx9ovmlEKyx935aEBmGrCjUM2UYWrD9twYvEViy3XSehfyIez9QJ1xt1hpTghg==
X-Received: by 2002:a17:907:da2:b0:711:f408:f098 with SMTP id go34-20020a1709070da200b00711f408f098mr21972885ejc.208.1655747441492;
        Mon, 20 Jun 2022 10:50:41 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d13-20020a170906304d00b00704757b1debsm6346056ejd.9.2022.06.20.10.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 10:50:41 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/3] ARM: dts: exynos: add function and color to aat1290 flash LED node in Galaxy S3
Date:   Mon, 20 Jun 2022 19:50:33 +0200
Message-Id: <20220620175033.130468-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175033.130468-1-krzysztof.kozlowski@linaro.org>
References: <20220620175033.130468-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add common LED properties - the function and color - to aat1290 flash
LED node in Galaxy S3, so we can drop deprecated label property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
index 46640b490a8c..94122e9c6625 100644
--- a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
+++ b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
@@ -7,6 +7,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/leds/common.h>
 #include "exynos4412-midas.dtsi"
 
 / {
@@ -26,7 +27,8 @@ led-controller {
 		pinctrl-2 = <&camera_flash_isp>;
 
 		led {
-			label = "flash";
+			function = LED_FUNCTION_FLASH;
+			color = <LED_COLOR_ID_WHITE>;
 			led-max-microamp = <520833>;
 			flash-max-microamp = <1012500>;
 			flash-max-timeout-us = <1940000>;
-- 
2.34.1

