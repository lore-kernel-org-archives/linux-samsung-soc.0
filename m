Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E02FCCA47F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Jun 2022 17:57:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244798AbiFTR5t (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Jun 2022 13:57:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244888AbiFTR5f (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Jun 2022 13:57:35 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 519951E3F4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2022 10:57:34 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id fd6so13412046edb.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2022 10:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5+pVyj/qFEp29tpQxIWH7FoXmtAWrO9FKE1G079+Ajc=;
        b=B/KsLq/Lk+So/UEOtbHZNvxNdkmqZFTLYPB01vscYlpE3VZYXEGaCCHlkU8dt/Sedb
         wgHsQScOTxo+NM7HXzHW6nBEzIpLiV05sHDL8puTKheqmNLuHNC6U5NS+BuXtgH3zoZh
         qXCbvY/ddDIYqqmSEW1oPF7cQn0/kiQZHMs3rufcNi8X3IhLTKebq1FmPRA7o+iS08P4
         RrrXdLI64Ips1Kpsr/pVfNzGh/VlsbpNX7dg+gLZ9Fq1pwGmOp/A/36NXW0yI5jfAs2x
         3mhwUnbaoXIOuM5LWfSwwXAANF8Hnn75RCL82iWfANF+0Wh9PjlsWZsecRXYLPC4rR20
         ixkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5+pVyj/qFEp29tpQxIWH7FoXmtAWrO9FKE1G079+Ajc=;
        b=4H+EplQSqRLf57AcdAqf8bWxWQtmQfcIc6iG7U7xSVOsmejZfMIe+HhEFzI66eUagI
         4BIm55Zd5bD849rH+aK2kef5XlD4fUv3T4bhBCrPYNqOlx1IA3BHoWy3U6Zte3HuD3Zu
         tnll6kvWqAXcRqv0hvo8yVbctEelRhc7C1C72PZtlOYbMUhYiuc3c0KmI8Y5ylbDwy6S
         c/Z5X+haxhBn1BDyibu10MHRGmw7b7yzHKdSn4gxM/INR33TozOvHRNvopIOzQhGa9cs
         xo4+Q1X/1Vw0cIQPsDREdeZj8u0vYmJcwAUz8XmHU9+RsDu4rOk3fA4s3NUveebtfsio
         8rYg==
X-Gm-Message-State: AJIora9h9VFUJvRpMbohUCg4rtFqarI2cwtsF+engHbBiszlzhPHbLU8
        ajKTzmcFYltbgu7q/3QECD/3Dg==
X-Google-Smtp-Source: AGRyM1uwBUerPKbg2aLvFEQMZWi65D2flR3WDgHeR47VVJOScNTs3Ig31XuCSeyXzV9g+EOZhAlfPg==
X-Received: by 2002:a05:6402:1597:b0:435:88fb:5b1d with SMTP id c23-20020a056402159700b0043588fb5b1dmr5009766edv.316.1655747853793;
        Mon, 20 Jun 2022 10:57:33 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g13-20020aa7c84d000000b004357b717a96sm4309925edt.85.2022.06.20.10.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 10:57:33 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/8] ARM: dts: exynos: add function and color to LED nodes in Itop Elite
Date:   Mon, 20 Jun 2022 19:57:11 +0200
Message-Id: <20220620175716.132143-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175716.132143-1-krzysztof.kozlowski@linaro.org>
References: <20220620175716.132143-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add common LED properties - the function and color - to LED nodes in
Exynos4412 Itop Elite, so we can drop in some places deprecated label
property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4412-itop-elite.dts | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4412-itop-elite.dts b/arch/arm/boot/dts/exynos4412-itop-elite.dts
index a9406280b979..ccba69dea750 100644
--- a/arch/arm/boot/dts/exynos4412-itop-elite.dts
+++ b/arch/arm/boot/dts/exynos4412-itop-elite.dts
@@ -11,6 +11,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pwm/pwm.h>
 #include <dt-bindings/sound/samsung-i2s.h>
 #include "exynos4412-itop-scp-core.dtsi"
@@ -28,7 +29,8 @@ leds {
 		compatible = "gpio-leds";
 
 		led2 {
-			label = "red:system";
+			function = LED_FUNCTION_HEARTBEAT;
+			color = <LED_COLOR_ID_RED>;
 			gpios = <&gpx1 0 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 			linux,default-trigger = "heartbeat";
@@ -36,6 +38,7 @@ led2 {
 
 		led3 {
 			label = "red:user";
+			color = <LED_COLOR_ID_RED>;
 			gpios = <&gpk1 1 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 		};
-- 
2.34.1

