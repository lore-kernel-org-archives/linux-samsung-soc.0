Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B36B5C43334
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jun 2022 08:52:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238684AbiFGIwy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jun 2022 04:52:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238669AbiFGIwo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 04:52:44 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B57301CFD6
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 01:52:42 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id fu3so32281749ejc.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jun 2022 01:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YT+2L+1k/jLLOrfW59KWU9Ya4hbG+ZAnHljBrrzu/WY=;
        b=tZkBrcugm3d+uQGBHLu4ISyC/+KePxoHoClbAmHkFE3GsMicQ3j8IOeUj3qLCey0tt
         Ek1qMFU3f7JxSPcwm4QFJv557/uhvbHmZTgn+v671w3SmupKwb7h6efflBq3aDTJrTul
         TT3Y+yf49bKOMQMsODvyx6QGsp3pdB6F+ZBG+VsyTifYhzotQaRUpPqEWkiyRykz4uKJ
         WrNe+u2LHmJ2w6B/KUMzBcnD5NUv3C7lcqpIg7BHBy5ZCNhA71W7MYG9O1WwHertEhp9
         A1NGG0XcTvFEXvJ0Ywa1TS/l9JO65SFUAufrlRA0WWU1hys1GuPKsPd4nW9wiwbbfR4F
         uE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YT+2L+1k/jLLOrfW59KWU9Ya4hbG+ZAnHljBrrzu/WY=;
        b=FJm7olNTGdPaeDIEElUrlLbWwVJ4AJnw/uRrIvpt+PzCGdjaLBspbekCT2kRqjpiOS
         G4XxBuBc+/ALmoqt9UheW22MoXmOatKnAQPFdmcnezPHHSxHzsjwsWULVxqXW574eeI0
         LTbTtEVINvDlwOOwTw5K2SvhCzXHWEKVSzBe6U3481cFOsy+DLBa6RwM03k/KwPweK6S
         KyRCnGptqDSGFezSAe7B1v+5r3fgwLkmUcNOwbeMQroGCEr9k5+/Hlvr33i2yCvDrPbv
         A5VWKPtvhIGnixbE0jH8f4Q6bT+mtGU6MuenoXq4NeWt1u/tA0VTCOm+RjhAKIngtJPk
         ItIw==
X-Gm-Message-State: AOAM530hahI9hFdEg/SQrKAcwOwRtvrn7s4LK+QUwXTkfVllGeEXmAdf
        qq5EGh1DlaCTEec3s8FmqpmLFQ==
X-Google-Smtp-Source: ABdhPJyYViMegf8NUq6mrTDz88Uv43gvwiUkl1wdp7laXDNLo/hB8QGFuDQ0f3CoqvYDk+FdJGU9/Q==
X-Received: by 2002:a17:906:dc89:b0:6f4:d3a9:34ed with SMTP id cs9-20020a170906dc8900b006f4d3a934edmr25179930ejc.459.1654591961278;
        Tue, 07 Jun 2022 01:52:41 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id lk24-20020a170906cb1800b006fa84a0af2asm7458137ejb.16.2022.06.07.01.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 01:52:40 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 7/8] ARM: dts: exynos: add function and color to LED node in Odroid XU4
Date:   Tue,  7 Jun 2022 10:52:30 +0200
Message-Id: <20220607085231.72246-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607085231.72246-1-krzysztof.kozlowski@linaro.org>
References: <20220607085231.72246-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add common LED properties - the function and color - to LED node in
Exynos5422 Odroid XU4.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos5422-odroidxu4.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu4.dts b/arch/arm/boot/dts/exynos5422-odroidxu4.dts
index 1c24f9b35973..64683f682c07 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu4.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu4.dts
@@ -9,6 +9,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/sound/samsung-i2s.h>
 #include "exynos5422-odroidxu3-common.dtsi"
 
@@ -22,6 +23,8 @@ led-controller {
 
 		led-1 {
 			label = "blue:heartbeat";
+			function = LED_FUNCTION_HEARTBEAT;
+			color = <LED_COLOR_ID_BLUE>;
 			pwms = <&pwm 2 2000000 0>;
 			pwm-names = "pwm2";
 			max-brightness = <255>;
-- 
2.34.1

