Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23601C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jun 2022 08:52:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238656AbiFGIwn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jun 2022 04:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238528AbiFGIwm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 04:52:42 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A480314D36
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 01:52:36 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id n28so22041380edb.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jun 2022 01:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rD/1Bx8Gd7OKYwtuHbi2Y1F/IfDjcD3uslaR6lEC5yw=;
        b=RRpooTaCdmWQ70hmo6aYhrzwCvxGXEsQ//HkFOZplQM+4KbF94ucjCBARufO0jmAor
         9aKvuFAc14q5EZWvj+PIxcsa+S7u4h24HOMm3zdKAOIIRnnY4XBd1eaMDcSe3RIIrpqA
         KhWCi7KRWk8U1qsk87VkSJTr8b3/K8rHZd8LAyN0TCkElbJTc8qVOL0y53cCA7Wyu9j9
         ZMQ0M9jJIUZ3E7lIm4s2Sbky2X7NEaj4HwMjcWz3aIGHTRlXIy5ZcUnofRQFdoeUDgQ6
         9UK92LcD2hg7mURo2fFZlaYhN7mSltJ1vW9xYFerfGaKqATo0MviUEg4ZbgiGpb/i/BI
         QhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rD/1Bx8Gd7OKYwtuHbi2Y1F/IfDjcD3uslaR6lEC5yw=;
        b=zIluP8NwAAerhsUMZsnPDMGJ1kb3Ntsox8Shxi+inevDtTjWYM20G3a6WcOqPTIiMm
         Mn5IjkbT5nbvBw9x4R8HwBT4Ks7S2k4PL7b0Zja8F7NViqxqs1oYDgDBrommTSVw8Pf3
         K96Hlp3WsJbPBEoshAdqH4g0nL/7c+GTQOZUEzg8wvZtGzwMAIqw4jua4hy4HH5TdQIs
         PiFCAcIhyCwnJaS8ORYuGk2jZSqvqvqZxeCXnNwdXfSuPEw7hCwxqlHB5TXIo+JmJMFx
         w3wRIMuxaWECWry8bK72TwoNNUrNCWF7UkOcDjhHqa+phe2ZTUmUovvNGvUDOKoMVCPy
         SBrA==
X-Gm-Message-State: AOAM533er5UufttxeK3ed8ZoIL7kj8Z7iwlXf2e0tk7dS5jJBsRyEilW
        cvyPnOByxgP/eiv+vQ9b3/VzTlZO9Vv7Og==
X-Google-Smtp-Source: ABdhPJxYbFqv7g0vrUkta7V3cYoskbZV2DjV9lp6k5ZCI5T2LBGY8n6vRGjnp7ldQ1Gu9EO+zBJ1iw==
X-Received: by 2002:a05:6402:b09:b0:42d:bd80:11ac with SMTP id bm9-20020a0564020b0900b0042dbd8011acmr32349165edb.244.1654591955176;
        Tue, 07 Jun 2022 01:52:35 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id lk24-20020a170906cb1800b006fa84a0af2asm7458137ejb.16.2022.06.07.01.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 01:52:34 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/8] ARM: dts: exynos: add function to LED node in Origen 4210
Date:   Tue,  7 Jun 2022 10:52:24 +0200
Message-Id: <20220607085231.72246-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add common LED property - the function - to LED node in Origen 4210.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4210-origen.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index a08ce2f37ea2..82c4ebdf98ac 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -15,6 +15,7 @@
 #include "exynos4210.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 #include "exynos-mfc-reserved-memory.dtsi"
 
 / {
@@ -86,6 +87,7 @@ leds {
 		compatible = "gpio-leds";
 		status {
 			gpios = <&gpx1 3 GPIO_ACTIVE_LOW>;
+			function = LED_FUNCTION_HEARTBEAT;
 			linux,default-trigger = "heartbeat";
 		};
 	};
-- 
2.34.1

