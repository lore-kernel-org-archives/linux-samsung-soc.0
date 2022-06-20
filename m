Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBFDCCA481
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Jun 2022 17:57:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244784AbiFTR5s (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Jun 2022 13:57:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244878AbiFTR5f (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Jun 2022 13:57:35 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA67E1C13D
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2022 10:57:33 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id z7so16136114edm.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2022 10:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qh3Q8zeGGFs4NZvI256UuSMbulRCxHF8EyCSRlLMmBU=;
        b=szldluCIb7eO+z4vMD72DPZBSweEeA6n7fhtm62zDEFhzXpodqR2jpTRwTqBhPpvjg
         /rVjPBhgW+Gr3RU4SH/EnwjXHe1xHa2Ad+uT8dimAPf/ccmnOo1Kj0/Pl7w2TmKRdkXq
         BdHEpeFqZk6n6AuYPSu1sRxHsOtZFb/7fi3zRe46U173ZCJ4LYoPoyBH501LwyZhid8x
         pYj6l+tO/VTYoo3dpfFZ3Mtjxgkj1oPiEnLdmjpRCZLMSXLu0Um/QQg6ngX5LlFu0oeC
         uYEWvOM0BKQmrQKcYJTgddq9tBy18fZqSMJSJx7t7R31pV2HuIeZ1WyipPZdiK427bJY
         Ql2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qh3Q8zeGGFs4NZvI256UuSMbulRCxHF8EyCSRlLMmBU=;
        b=rk8DtHRt2un30cj4r6aGyKtXCAKF2LVSee1k+YukzN2WzUFws2mHTTOAScTh4hWqxW
         oxDRbW+6/ZuUNI0QY8s8GSUFMUcwHkZg34LuEbeTadUtt556wlQ7UQPvLKrqyoE4zm4U
         jGY8JSWu9+xGZVN4k0jKqlIaWO4BCJQJktNAUtTb830syGrHfOFZlBqtqWLZM0kvvnuq
         9I+6jOlyoaDAHSq1Gt3XJmnw+EdytY3CqKEzNWuxZqK7N4PFWXtSa4uyxJkZmcX3lXR8
         1+Q6nQfV4ew1qkrJ30ah4RJVbOw6H7ZKxKqVgfcVygCkaPO3O+O5YXuNoQh/kXpx6i0R
         8fGw==
X-Gm-Message-State: AJIora+hagGHtnIZsFLawvn+Gijv2MiXcxzTkIrIHXgVOZQvjV9OToOx
        yIpPOz1nFJ7ROXOzPQttz038Pg==
X-Google-Smtp-Source: AGRyM1u/Bpyx8H6tU/mYJFjeUTywLl2PwjY+vpq32fMJ6PybHG44Dau2szPif/u3KkhxKJrYp4hLng==
X-Received: by 2002:aa7:cb05:0:b0:431:95b9:6d31 with SMTP id s5-20020aa7cb05000000b0043195b96d31mr30502633edt.56.1655747852600;
        Mon, 20 Jun 2022 10:57:32 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g13-20020aa7c84d000000b004357b717a96sm4309925edt.85.2022.06.20.10.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 10:57:32 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/8] ARM: dts: exynos: add function to LED nodes in Tiny4412
Date:   Mon, 20 Jun 2022 19:57:10 +0200
Message-Id: <20220620175716.132143-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175716.132143-1-krzysztof.kozlowski@linaro.org>
References: <20220620175716.132143-1-krzysztof.kozlowski@linaro.org>
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

