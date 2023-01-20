Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C288C27C7C
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Jan 2023 15:54:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbjATPye (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Jan 2023 10:54:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231288AbjATPyY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 10:54:24 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A38CFD0DB6
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 07:54:18 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id k16so4435948wms.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 07:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42flCObWXnn2hTaHJ03FQEWinig83+JMrT+b9+wnZgs=;
        b=nkULKLA7qlnm3LliMJPgiXKLseK7cZKTn2kg9LY+wTesMV0eQNp9cO6Jftgf/+xLmx
         9XuCIvIK7rg46xVRdgS+QZynFU+Rorn8fqCvFOas/z7aWDw72pRRjhtzfiYO/SyZz9lz
         xe8NsaTWJc3IQrzZ+7TWgGfLMy5YNT6+hwPZJmTSrcN8j7ivsBeYoIVAqeMi9P79cHuS
         /jcsddgYLJezETi9dL8LgTjkfy5mtOizN9rGjxfWD/DLxpeMAObNk4nNTSYKhFmhYt/f
         Q2QJ9/5zK2MSnh+/qEGSObiDdWOvz+JoWChyDKH5g6O2jfDkJgf5Dpm2/nunCXi4uDGs
         Yg4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=42flCObWXnn2hTaHJ03FQEWinig83+JMrT+b9+wnZgs=;
        b=JcgfLEUDxMa6fO1OP1ZgRQaD3T93xcu05MvS7YVOazIFBANbMaUxBJ4rY+3m06woJY
         os66ZlB5A6UYPmLGhQfDb2HTmSS7KOmxLcFlYpgaBbYyJCNtk4ayN5zTzHj/7M0vGq+P
         5kdTWVmLoRHPsUtLO/evNymAZQn9zuusACiQFDlyWDWDi5rrDCfiAM1ZY52ncDyYDy9j
         uBzLLxOZyuVV5EnOoZF5KQREvN4KsRx4Kg/bJtWaT9uvkBslbIp+BzvrMwtf0tAf7s7B
         Xl6+rFjBxwWTTBzNJEuqtR2zyr8ebn0leuJc77n15BDp/bG++bnbgDq3FZV0lViHOc5V
         BbKw==
X-Gm-Message-State: AFqh2koPUHYjr/T/AnkAOGAZK5PhaDuHndfxsc5DJseTdjUgVu7oag0x
        cRnOSc07DcDxvQeW71lCK1Ek1A==
X-Google-Smtp-Source: AMrXdXt05rWUO8qkJ+RqavOOdL67ZtTNDO3SbhQbgKLpDdC4U5uBcKj9aLeg3EivENnWKsPUb7nrKg==
X-Received: by 2002:a05:600c:540d:b0:3d9:fb59:c16b with SMTP id he13-20020a05600c540d00b003d9fb59c16bmr11041069wmb.36.1674230057098;
        Fri, 20 Jan 2023 07:54:17 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n42-20020a05600c3baa00b003d96efd09b7sm3349596wms.19.2023.01.20.07.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 07:54:16 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     replicant@osuosl.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 03/11] ARM: dts: exynos: correct cd-gpios property in Exynos4412 Itop Elite
Date:   Fri, 20 Jan 2023 16:53:56 +0100
Message-Id: <20230120155404.323386-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120155404.323386-1-krzysztof.kozlowski@linaro.org>
References: <20230120155404.323386-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The property is cd-gpios:

  exynos4412-itop-elite.dtb: mmc@12530000: Unevaluated properties are not allowed ('cd-gpio' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4412-itop-elite.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4412-itop-elite.dts b/arch/arm/boot/dts/exynos4412-itop-elite.dts
index 202ab0fee3b7..b596e997e451 100644
--- a/arch/arm/boot/dts/exynos4412-itop-elite.dts
+++ b/arch/arm/boot/dts/exynos4412-itop-elite.dts
@@ -214,7 +214,7 @@ &sdhci_2 {
 	bus-width = <4>;
 	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus4>;
 	pinctrl-names = "default";
-	cd-gpio = <&gpx0 7 GPIO_ACTIVE_LOW>;
+	cd-gpios = <&gpx0 7 GPIO_ACTIVE_LOW>;
 	cap-sd-highspeed;
 	vmmc-supply = <&ldo23_reg>;
 	vqmmc-supply = <&ldo17_reg>;
-- 
2.34.1

