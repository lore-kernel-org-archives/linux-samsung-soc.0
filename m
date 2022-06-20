Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B907FCCA481
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Jun 2022 17:57:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244818AbiFTR5u (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Jun 2022 13:57:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244927AbiFTR5i (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Jun 2022 13:57:38 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 561EA1EEF5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2022 10:57:37 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id v1so22558745ejg.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2022 10:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=joP03Af22hkwu3KalwDqH+PPIBm/L0VrpPvnIX53/fI=;
        b=Z0oHIoda5XMiOVpIgbbyotj7nmbNFjYZACyvVG6Ejs75akHtE73Uh8fBjv3zXp0cUj
         UwEjfAbJ8t5daAoFl89pMsavkJrxgN0YB+A5jnNh91tMRmu2yQ5iGY4jeBa3ZBQ/IwsF
         7w38jBAmVCxw2tqrID8ZXSb/UkVZoAPqP3Bf36gVk8UkbT2gWXS7eqw6QjO/fx9iTmPq
         yRZJHeumYXWB//rqrU3d0TaNgS7TiYKqDGJO2o2Vi40MQ3f6De3369k9Ua6xt1hPE4ej
         1w1Gg6cLy9ZbGxIm47944EHLvaYp7v6lvw5lc64MYILyubdPMwoPnBSh1eLXXOHA+Q0l
         vQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=joP03Af22hkwu3KalwDqH+PPIBm/L0VrpPvnIX53/fI=;
        b=FdD1ww60Q00iV+qB/lYXwfrertuyGxW+B/QPJQE0tMJatbt4btwE6xskh2Q70K6uKM
         h286uLQdx3ZvifHe/mAGhld/E/XCD6VgE9r1uJDXRrzVbkNNKZISgqeWFKK4UKjcGTzS
         cHmQXJviu2QYxh5EQ70FULhdGdvA14bue5O/hLeg8anc8GsHBN2i5muhqYWqVoRmCyjd
         uAjzQsYp8bWrNWNYDqvFd7DQr9EYfLrhq4oqtSgq5TSe7O9GwhvWaTSYm2gnWHPtIzLu
         K8H9EfsWLekaJTMCEHpisfPkC8QQlfAvzTU2TAp84g65Iq/T0yJwszZn0/YUKhi09R1p
         jy2A==
X-Gm-Message-State: AJIora+9TN2wNqzcp0FOmIla5Bytm3UZSQWFhTZQoua531lv2WjnuqMQ
        DbDhmh+rXVUnMbsXjGpzmhfI2w==
X-Google-Smtp-Source: AGRyM1vsNjhVI2WjrfbSg9NB2/tJgra0FfoakSUJrfCHX5V2KYjR8NJdeWepCHBSJhH+Yp1b+iEKfg==
X-Received: by 2002:a17:906:72d7:b0:711:f778:113b with SMTP id m23-20020a17090672d700b00711f778113bmr22537580ejl.625.1655747855904;
        Mon, 20 Jun 2022 10:57:35 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g13-20020aa7c84d000000b004357b717a96sm4309925edt.85.2022.06.20.10.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 10:57:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 5/8] ARM: dts: exynos: add function and color to LED nodes in Odroid X/X2
Date:   Mon, 20 Jun 2022 19:57:13 +0200
Message-Id: <20220620175716.132143-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175716.132143-1-krzysztof.kozlowski@linaro.org>
References: <20220620175716.132143-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add common LED properties - the function and color - to LED nodes in
Exynos4412 Odroid X/X2, so we can drop in some places deprecated label
property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4412-odroidx.dts | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
index 1f17cc30ed14..68d589e081bc 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
@@ -9,6 +9,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/leds/common.h>
 #include "exynos4412-odroid-common.dtsi"
 
 / {
@@ -27,13 +28,15 @@ memory@40000000 {
 	leds {
 		compatible = "gpio-leds";
 		led1 {
-			label = "led1:heart";
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

