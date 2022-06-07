Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D02BC43334
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jun 2022 08:52:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238607AbiFGIwl (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jun 2022 04:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238551AbiFGIwj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 04:52:39 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9624F17063
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 01:52:37 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id fd25so22063179edb.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jun 2022 01:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qh3Q8zeGGFs4NZvI256UuSMbulRCxHF8EyCSRlLMmBU=;
        b=V8MnplV7tM2O9koqV83l91wOu4UZ72fncx/MM5oAAg5dLy6XrzetHE7dI/y2TMJNqb
         bICAPaQEEu9UQ3mfn/A3bHC5HttioOtjzIeVplu7mu+kB675LtGIEoZ3uzd8la3DOfwD
         wxZH1ox6J+jcmzFb6mKnDgGUzdI09ejnwz6lS/ar90xdy1RMhEaNE63Be8KSz5TXM4gC
         9Dfph8BaLW86pJt/+x8ynOF/HzLB8T5tsHT6Bc1B1YtO40D9TZxJN24cSBmu18CCFJVK
         lGdHA1euL0rXSnbqlvLDloF60O/De2hcnurd2aXjO/3HSL8cROXNbFKEvail53f+m190
         AW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qh3Q8zeGGFs4NZvI256UuSMbulRCxHF8EyCSRlLMmBU=;
        b=loskKEYTUiEIExYEHC+oKOx5DmqvGBEUmiWoEJyfrGCex+AnRbadAhrgHJ+DTQ5eUp
         bnFNUSzj5zs5bsb0v4pmucjoaftOkmWkjToFAbLNIrniYSzIWA6vVCq/VFGIef3k1YUM
         72+hy/I7vgEOaMiXF/aoSgXrJy+pMJujjNHW9TOldG2q8Jw/y2B+iA4u7dfriFeAhZJA
         dfUmUwp9qMmyY3ZuCWEMpYKNpmcJSSzyjkc9CIggXcVijiHn7y/5U9JC66Lgg1ziHrKT
         8SSg5bcG4MSYPVHrvvr3tAdSmpN807LIkx7xD0HTUQigr58OsigsI4I5D49Rn4l9FcQu
         7IkA==
X-Gm-Message-State: AOAM5324j3QZoRXuzuigra45uQZVdGdGbgHPUqO4IA6srgTDED1ThoKd
        3dRqxWAK/Z8qP1juDu3GMTeN2Q==
X-Google-Smtp-Source: ABdhPJxrs3dT9lmh3cltzk1QMQDGMeU9iFHbuoW1PmB1ccZYkzvHZ9gd6RibypRT+77UNA3T9DGm7A==
X-Received: by 2002:aa7:d1ce:0:b0:42d:cf0e:3389 with SMTP id g14-20020aa7d1ce000000b0042dcf0e3389mr32019205edp.4.1654591956181;
        Tue, 07 Jun 2022 01:52:36 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id lk24-20020a170906cb1800b006fa84a0af2asm7458137ejb.16.2022.06.07.01.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 01:52:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/8] ARM: dts: exynos: add function to LED nodes in Tiny4412
Date:   Tue,  7 Jun 2022 10:52:25 +0200
Message-Id: <20220607085231.72246-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607085231.72246-1-krzysztof.kozlowski@linaro.org>
References: <20220607085231.72246-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add common LED property - the function - to LED nodes in Tiny4412.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4412-tiny4412.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-tiny4412.dts b/arch/arm/boot/dts/exynos4412-tiny4412.dts
index 017b26108bb0..04388c575efe 100644
--- a/arch/arm/boot/dts/exynos4412-tiny4412.dts
+++ b/arch/arm/boot/dts/exynos4412-tiny4412.dts
@@ -11,6 +11,7 @@
 /dts-v1/;
 #include "exynos4412.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "FriendlyARM TINY4412 board based on Exynos4412";
@@ -30,6 +31,7 @@ leds {
 
 		led1 {
 			label = "led1";
+			function = LED_FUNCTION_HEARTBEAT;
 			gpios = <&gpm4 0 GPIO_ACTIVE_LOW>;
 			default-state = "off";
 			linux,default-trigger = "heartbeat";
@@ -49,6 +51,7 @@ led3 {
 
 		led4 {
 			label = "led4";
+			function = LED_FUNCTION_DISK_ACTIVITY;
 			gpios = <&gpm4 3 GPIO_ACTIVE_LOW>;
 			default-state = "off";
 			linux,default-trigger = "mmc0";
-- 
2.34.1

