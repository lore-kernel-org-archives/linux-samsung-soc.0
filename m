Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AAC1C43334
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jun 2022 08:52:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238613AbiFGIwq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jun 2022 04:52:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238627AbiFGIwm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 04:52:42 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5885186C4
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 01:52:39 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id s12so26556692ejx.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jun 2022 01:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LPJGKNKeJFfy/vaG/83MK594pviZ0xNYm6KJJEF/kg8=;
        b=TF3pTC4quUYeEWttSaAur6xWyKWNd1qEE6R6QukKNmbnmAuDJW31ppQ4/70KVCDY6j
         HFjmyP5LVwXJqg2HJaSMaSLe2GwvJgwByxz+Rg+qySnK/dlcBNLRY4WKfDAjrMnDD3Zd
         OS5FM924j9OM+dJjZ1QDm0/VXMBLusb3BMppNj56G10Z1zbOW7WGsvMnbTDapAlcsLmx
         QpNcREzEM90hZEbQlmVRNpPemUBtHtyFLi+fDinx/iGn5qJf7s7iE0NL9/rFVDNDYocs
         3Bm3uMA0ZGB55DDVuz+yVPDtbk/+l6Un8ex2CTtI3wiNaD4Z8AhgjBBmGlR0taUy8nsJ
         rSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LPJGKNKeJFfy/vaG/83MK594pviZ0xNYm6KJJEF/kg8=;
        b=bugG+lHn+LK3UAa0FdMEyQJUc7ljhNtfP+1ZDGwXpvcKAD+3axs+IWRIQIw6z2ey2C
         uQmRmxPDBkjy3O7kpR6YzHYcTnfYj5Jkl9uBJ7htW4PLfIKNWp6QHTGp4mxJH0QHJQq8
         4ptr1BIknFb/nalx2/QemyQ72xTWZqs5hGW+dgCwuAlmrqyY123OsgweXmzZ2evBGzBP
         DB3jgFoFYKJhEGYqqBIKN4PnpnWK11Wl2ux+TpGPt38mpQ3x8hM8+C1fQFuWDJdQRhnt
         d9eUdsEp6xlo82MmiZu5WM4ISAVwQLQzkFisZzoAf31uuI4eVBYPGv4Ag72ROJ76isUX
         D5aQ==
X-Gm-Message-State: AOAM533K0aXo7AQMU6pi56SxTcY8iEBZHoyE98qoBDfRycI4EAdQYmJb
        rIUYEEkYVY96O3O/1jkLYWHy8A==
X-Google-Smtp-Source: ABdhPJyVOBSRoU0LVS0pVyfZQN//0AB6dG343gOoMnBfG3TbWa6RNerdkcjMOndTfQ/PHWmRUPp4Nw==
X-Received: by 2002:a17:906:9b8d:b0:6ff:16a1:19c0 with SMTP id dd13-20020a1709069b8d00b006ff16a119c0mr25083768ejc.122.1654591958284;
        Tue, 07 Jun 2022 01:52:38 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id lk24-20020a170906cb1800b006fa84a0af2asm7458137ejb.16.2022.06.07.01.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 01:52:37 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/8] ARM: dts: exynos: add function and color to LED node in Odroid U3
Date:   Tue,  7 Jun 2022 10:52:27 +0200
Message-Id: <20220607085231.72246-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607085231.72246-1-krzysztof.kozlowski@linaro.org>
References: <20220607085231.72246-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add common LED properties - the function and color - to LED node in
Exynos4412 Odroid U3.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4412-odroidu3.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroidu3.dts b/arch/arm/boot/dts/exynos4412-odroidu3.dts
index 36c369c42b77..79364e7a8da1 100644
--- a/arch/arm/boot/dts/exynos4412-odroidu3.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidu3.dts
@@ -9,6 +9,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/leds/common.h>
 #include "exynos4412-odroid-common.dtsi"
 #include "exynos4412-prime.dtsi"
 
@@ -38,6 +39,8 @@ leds {
 		compatible = "gpio-leds";
 		led1 {
 			label = "led1:heart";
+			function = LED_FUNCTION_HEARTBEAT;
+			color = <LED_COLOR_ID_BLUE>;
 			gpios = <&gpc1 0 GPIO_ACTIVE_LOW>;
 			default-state = "on";
 			linux,default-trigger = "heartbeat";
-- 
2.34.1

