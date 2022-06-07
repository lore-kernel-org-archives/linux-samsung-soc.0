Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7621ECCA484
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jun 2022 08:54:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238755AbiFGIyH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jun 2022 04:54:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238857AbiFGIxu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 04:53:50 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0EC5E2773
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 01:53:48 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id v1so23090978ejg.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jun 2022 01:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fzBuAR9UDJdEVpcbgdt0O2mvjmHEINRyMFw6wNgyr3E=;
        b=rwvnvsSYurnHmYUfbllx7fkQ00GNGlNvOQ5Ot6n9wAr0hp0KWuv0/ulSBNHM7hUo/N
         /4kl50ORD3GQG9CGeDtpo0JgO5zv2NEgAdtrmlxLqfxt9zcAos4eS0wlpoUJmQhbNHDn
         Fd61UYRs9+fLPZpm8gU7HoJ180e/RLHoy9OPHDi9jT9pb2wyzBc5B49rtTuEaUh5EvnB
         ezM7lvECesihDFsy4SVly1k5+ivlTCI4k5c+7daA6tFpkcbjGZ6otperos5b5AYYF2xG
         PG1NvlUw8vZonktp2j421NNWY1TgUgCvnmzAJJ5iKX+zM36pw0qdREDaE24QA+Z97fnE
         tL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fzBuAR9UDJdEVpcbgdt0O2mvjmHEINRyMFw6wNgyr3E=;
        b=Vzvqsfcw4NT1JcFEOCLPY3wfTnOBM6PmnuGQN1qksd+ceinWazyKG6MJNMFWptSIRf
         Iyiy3ZzOiPq4Z2TjV5iU984IfGjM29+BO797ONSWWqBe7hd4Ykng1AzVIbAZf64GbXcT
         flppRchia0nJ/VkTlY7zmwnkP7BuxzBUnKOLoBdE7eIzCmbF+MxqJVZcymY4Jx6c4b5f
         2saJz5r3aAMbV+rUmfXj/40XkK0mqC5UW/BI5ni/ts2rZTfTSIZDxqFvvdAXwX1qO2sf
         phlv799stRmpmu5VLdbNVMnSy8ZRxAlWyddEJOCHQ2O9nSaKipkit1TIS6cRO6WLgdkq
         pCIg==
X-Gm-Message-State: AOAM532GZar92ymjqOasE1vlc0U3H1eAFKqsHMIDz0Ca3Eq/2zF+yuEb
        i90bi6D+aR8E91K6Yp5J2Ag/yA==
X-Google-Smtp-Source: ABdhPJyaP6QfGmtpXahcRU81dJSgLxzGwwrgMIskLfJYmHQQAB9erOZcoyj8ao4pruJEblf+n3qXew==
X-Received: by 2002:a17:907:1b24:b0:6ff:235c:2ffd with SMTP id mp36-20020a1709071b2400b006ff235c2ffdmr26737673ejc.116.1654592026906;
        Tue, 07 Jun 2022 01:53:46 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id k16-20020a1709061c1000b00705cdfec71esm7176703ejg.7.2022.06.07.01.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 01:53:46 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] ARM: dts: exynos: align aat1290 flash LED node with bindings in Galaxy S3
Date:   Tue,  7 Jun 2022 10:53:42 +0200
Message-Id: <20220607085343.72414-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607085343.72414-1-krzysztof.kozlowski@linaro.org>
References: <20220607085343.72414-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The bindings expect aat1290 flash LED child node to be named "led".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
index 03dffc690b79..72901772fcad 100644
--- a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
+++ b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
@@ -25,7 +25,7 @@ led-controller {
 		pinctrl-1 = <&camera_flash_host>;
 		pinctrl-2 = <&camera_flash_isp>;
 
-		flash-led {
+		led {
 			label = "flash";
 			led-max-microamp = <520833>;
 			flash-max-microamp = <1012500>;
-- 
2.34.1

