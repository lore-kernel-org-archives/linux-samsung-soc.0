Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 049FEC636CC
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Feb 2023 21:00:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbjBGVAo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Feb 2023 16:00:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229878AbjBGVAj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Feb 2023 16:00:39 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A78F13DF5
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Feb 2023 13:00:32 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id o36so11948025wms.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Feb 2023 13:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYbbEIH9Rlm/Ki1I90g8VqYzod78gEhCObYyTC8X/wU=;
        b=ezzVb+JWPbuS7p65A1FWBKs4yMzcSXfYVURpTBD4b742nEFZ9TpFtiELcnx62/0hBe
         OyBKHGRDyAS8YKnzK9z6O1+zvRjtKTXivrNabYqMMIHfdjZ+JObgwPOi7s6oLpawQpOr
         A4cpb2of2xr1WWHl8HTRVGs56tt5wYFOBL1qmSGJ3qxILGnWrWTwWz83CGWG+Fe59rWm
         dnN2Visr2j1Cqv+l3f9U1ZGQQQSKpA0vhfbxUUZ5Fcq+WjMFh9DB/Dv7xx8HzTeIYnem
         EB8RKP1l09zFz9bQFFV5LOU5/W/KsUBSLzWPgE9TFoWzBHt8kRk6VXmDVIMsHrwm7Tuy
         l8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uYbbEIH9Rlm/Ki1I90g8VqYzod78gEhCObYyTC8X/wU=;
        b=jE3FKK4cD414WraWh5vVn/oH8/2BDzMBzHPWEQzT9Ipw6F0dEPK5Uc5araBwD75XSs
         8aJlxc8chs9EATPrLmrzsJa2VmSHE1J26HLqPPyrMA+JjWkvRTwrEwdFrbBHeyvi4tpg
         oib41cZU8obInBiYiaKfJ1BltKzgsLLlqVWcnTbLMXA1kj89FRXii9sBhfZvo+bxGRfM
         UwKXga+F51mXk5qvaWc1i84HgozfAZCviIjGyE12p5KTV0TNxVC8fQKBBEHmTpRQ+N8V
         yFEOgn3uQLO2jw4zzg4QYTJOaUo/rgHYvYZOomg/gLJmLyojXcrg+gTNus2GPLYwF4jc
         qNzw==
X-Gm-Message-State: AO0yUKUxu2bowQ4agorfQTkXlbjeQxfwVI19qvff3GrKt1NkoX4hxqOc
        WmrO969cLDgkwZnYRxX7pM8Wog==
X-Google-Smtp-Source: AK7set/vufVbIPG/l2DZW1afRd0cS/O0W1oh/XbL63hASlY5UEt2CRZoWnA7rKEcpj85gpibLzr2tw==
X-Received: by 2002:a05:600c:35d0:b0:3d5:365b:773e with SMTP id r16-20020a05600c35d000b003d5365b773emr4535057wmq.39.1675803630748;
        Tue, 07 Feb 2023 13:00:30 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f9-20020a05600c44c900b003dc4fd6e624sm8041631wmo.19.2023.02.07.13.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 13:00:30 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 5/7] ARM: dts: exynos: drop default status from I2C10 on Arndale
Date:   Tue,  7 Feb 2023 22:00:18 +0100
Message-Id: <20230207210020.677007-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207210020.677007-1-krzysztof.kozlowski@linaro.org>
References: <20230207210020.677007-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

status=okay is by default for new nodes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos5250-arndale.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 71c0e87d3a1d..e995cfee03f3 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -623,7 +623,6 @@ &soc {
 	i2c_ddc: i2c-10 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&i2c2_gpio_bus>;
-		status = "okay";
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpa0 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpa0 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
-- 
2.34.1

