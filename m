Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2216DCCA479
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Jun 2022 17:58:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244938AbiFTR5x (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Jun 2022 13:57:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244904AbiFTR5g (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Jun 2022 13:57:36 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 693BE1EAEC
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2022 10:57:35 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id u12so22591220eja.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2022 10:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ljHTEoR107PgHatWaZod2fz6OsIql4Y3bAgJB37HM5A=;
        b=Ve1TcQKRVNw+XJgSJlBnZVsBg8XnYI/j8Pc09bEfp0Ha1Kf3e5HJ0+XhY+inafaz7O
         uSrJaoh0bUQcrWqbAoBcJQIoG1TyvBN+G/WLxsNfxbz0hKosZvw9MuQhxPLypttrC7d8
         GdXxCMiiSPV88C+Ch6OvkJNQ7Mkwz58sKs3kJ5HuG5jPe9wkMjRn1mZ6LYzycTSdKXY2
         RtdQhgPxrq2G7W7qFqjkHaz7QZs2teNm2AGoZ1WW1w0ZuUZcLYiPccs5XYCWWAMmojcc
         zIc0fR7cb+N4fbaDWCr4CwvTwS/9ji/G8brmdZmbgeBZetwCp+od6SZLvE7YYzh8DEPo
         OhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ljHTEoR107PgHatWaZod2fz6OsIql4Y3bAgJB37HM5A=;
        b=68i4p4lQryh0cDj+j1ZOnsh4/EjRHAqml/PuqgZsNFs78URUoaAF9xjWIL65QSD+cc
         u3JHQipnJThyekR6gqHsft14WuN0uPMO/XXDOzuzVuOyxD1oW+FyKtDAPskKyqXV5qlc
         CVchem+LE8un2EaxlbKoOzgcCD/dwnx7ZB+33kV/yIThcbeuqTYTVTdwxZvhdmlThVYT
         Y11ZIkiXnD0UXv6RQyrftDqBqAM5r7yBXaJ128XY/ZRc2gg8cM7g9T/XSmIPOolKCiFL
         y+7ys6tYo9vCKeYer5z3LpTQMpx3pnFAwHWWW84lcnViNXGwj2HGSy0sDQsOGPxU5mCq
         nupA==
X-Gm-Message-State: AJIora8nKj6Uq/u+4NRM7v92pi4EnKzfqlvlcz83XZik1l0XVDRXKSfb
        Pc25x68kZolEDt4kdRW+p1qAuFcvcyWRZA==
X-Google-Smtp-Source: AGRyM1srrm5ftj+YpP1mUFs4eMASY4MCKSJPROYOEwhRfUamNcW26vKrtW7QFzyqehExE1KUPVz5nA==
X-Received: by 2002:a17:906:74c2:b0:722:a7e9:6f82 with SMTP id z2-20020a17090674c200b00722a7e96f82mr7844254ejl.3.1655747855025;
        Mon, 20 Jun 2022 10:57:35 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g13-20020aa7c84d000000b004357b717a96sm4309925edt.85.2022.06.20.10.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 10:57:34 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 4/8] ARM: dts: exynos: add function and color to LED node in Odroid U3
Date:   Mon, 20 Jun 2022 19:57:12 +0200
Message-Id: <20220620175716.132143-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175716.132143-1-krzysztof.kozlowski@linaro.org>
References: <20220620175716.132143-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add common LED properties - the function and color - to LED node in
Exynos4412 Odroid U3, so we can drop deprecated label property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4412-odroidu3.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4412-odroidu3.dts b/arch/arm/boot/dts/exynos4412-odroidu3.dts
index 36c369c42b77..a5ad88b897ff 100644
--- a/arch/arm/boot/dts/exynos4412-odroidu3.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidu3.dts
@@ -9,6 +9,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/leds/common.h>
 #include "exynos4412-odroid-common.dtsi"
 #include "exynos4412-prime.dtsi"
 
@@ -37,7 +38,8 @@ vbus_otg_reg: regulator-1 {
 	leds {
 		compatible = "gpio-leds";
 		led1 {
-			label = "led1:heart";
+			function = LED_FUNCTION_HEARTBEAT;
+			color = <LED_COLOR_ID_BLUE>;
 			gpios = <&gpc1 0 GPIO_ACTIVE_LOW>;
 			default-state = "on";
 			linux,default-trigger = "heartbeat";
-- 
2.34.1

