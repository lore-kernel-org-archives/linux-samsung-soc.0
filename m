Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F28C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Jun 2022 17:58:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244404AbiFTR6K (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Jun 2022 13:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243937AbiFTR5l (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Jun 2022 13:57:41 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60EA41F2C4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2022 10:57:40 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id fu3so22605617ejc.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2022 10:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AJQuruVrTZv1nynKWNjB1vjGLvsDIVSRslYYaj6JlpY=;
        b=M65tnED65OqJVAxSCBkJnGQmHwgrsIYi5e0h6QJAQ7fctahuQIrbOUqTqQUonE1G3Z
         v5PIgcBMqgyE5z3vYfbMk2hEDgxAfzXjX6DnZAw/w3p37KpSHuSIlcJE7eFAQ18oclbx
         mcKgGbHzqFvDfe4VyYOZnQhk8GIFekj5mRNjijcE8lcH8VLTOutYa92ochTWISB+Utdf
         btL08omZ3byAWYW4eUKYqPmgkvKHQmAgO9EbZsTIBTemTetHI14SYhT9oTK1hc/RJHUI
         MZx7k3CgXoV0UtwnMv3Oz8FUBQDPcvsW87y9pyX0sEUEBKvJc8dOn4rmmdzY1YlVlALI
         iaxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AJQuruVrTZv1nynKWNjB1vjGLvsDIVSRslYYaj6JlpY=;
        b=Hw1CvZuncrVtRRs09gbkjaj0vMDaDeC2EiEZHAR8LlUXIvQsTUgbJ4cI8+DsPWkB+k
         dwmDfMUaPCJIZYwtJa3FXH4yi1Lq2NsIOuNeG4zG0h8sOxOeED9Qqs93yc0O9Vgt2voK
         V1bZWGilU1xVvZzssiJ3YUQ4d+7oH4djUAkAG/GBQqd4R84O2j0aAl+jx7sxOwl8YIiF
         9/wY7UcLiEaxYJhOYnv2LujJqBRwPuzpn60venDt0B26WXt0fKE/mLufZwOB/MgFdz3/
         fBJ2yNegQfVT5q7xiKRslepPcdIKJV87jEjkMeJrPBQ2weRt04dRikv6HahdAXupM6wm
         hmxQ==
X-Gm-Message-State: AJIora9kDj/mZWffkMBnZHayXpJEsPDz4feUHnAC2GBlOlOOlpAEEgky
        O5UCJT9OwlML0lMJuIHuZ0sDnA==
X-Google-Smtp-Source: AGRyM1u5mzC+exD0UTFj2M5x/7WCl2DFpSLx2iD4jDg+DUR1XDEC0nnM+cdiUCJ+iX6AksDbASeDjQ==
X-Received: by 2002:a17:907:1686:b0:710:6ff6:1b97 with SMTP id hc6-20020a170907168600b007106ff61b97mr22359781ejc.378.1655747858935;
        Mon, 20 Jun 2022 10:57:38 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g13-20020aa7c84d000000b004357b717a96sm4309925edt.85.2022.06.20.10.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 10:57:38 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 8/8] ARM: dts: exynos: add function and color to LED nodes in Odroid XU/XU3
Date:   Mon, 20 Jun 2022 19:57:16 +0200
Message-Id: <20220620175716.132143-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175716.132143-1-krzysztof.kozlowski@linaro.org>
References: <20220620175716.132143-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add common LED properties - the function and color - to LED nodes in
Exynos5422 Odroid XU/XU3/XU3-Lite, so we can drop in some places
deprecated label property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi b/arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi
index 982752e1df24..8c0e1716c0b3 100644
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
@@ -27,7 +30,8 @@ led-1 {
 		};
 
 		led-2 {
-			label = "blue:heartbeat";
+			function = LED_FUNCTION_HEARTBEAT;
+			color = <LED_COLOR_ID_BLUE>;
 			pwms = <&pwm 2 2000000 0>;
 			pwm-names = "pwm2";
 			max-brightness = <255>;
@@ -40,6 +44,8 @@ led-controller-2 {
 
 		led-3 {
 			label = "red:microSD";
+			function = LED_FUNCTION_DISK_ACTIVITY;
+			color = <LED_COLOR_ID_RED>;
 			gpios = <&gpx2 3 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
 			linux,default-trigger = "mmc1";
-- 
2.34.1

