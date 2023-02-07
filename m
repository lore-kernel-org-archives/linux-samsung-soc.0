Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B2ECC636D3
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Feb 2023 21:00:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbjBGVAn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Feb 2023 16:00:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbjBGVAj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Feb 2023 16:00:39 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C7521420A
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Feb 2023 13:00:33 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so20201wms.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Feb 2023 13:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AkwVmUNJQtwRLCOOikmq8VWZPTXwpddtFVgHSUM56E4=;
        b=xhQUhOE/gQb1fXjV/aKJmyQqflojgPjb8U7nWLDK0kRS6DjGfaw/Pyz03RhXBWQzrn
         nxIkUnLiov7mL2a6xlvJv9la8XSyQSQdD6UP0zr27zF7D06RwtJ71wiTCIXRpfA2ZI3J
         Sa+Y0tOYgSHk6F7SsSkcGeDPfVU6ntr/ebJYqNDpNzjBo/AVOF8bZyLGol0AptJ8Y3nj
         Ses89L+r592wqNYmHn/r9zdfeFJjxZt2O8QYN4VZ5782/mEWa2VpIjBHHkGZISVV+rfc
         TrRTHStRxKglqqH9M2vVApM85hDQRht7KIpI8NiD9NXzhHlBuCSqvp9I6sDW7XmNHayp
         jFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AkwVmUNJQtwRLCOOikmq8VWZPTXwpddtFVgHSUM56E4=;
        b=TbcvQzDr9hCysL18EdROxa6VVIP+QakrI6Ecsk23TjCCoIRfDTSEu9imINax0BdPup
         IarRbctatr7klKZiiPSVws1KQd3W+fj7eXs9KIbkVujmLebKVLgegGScvddI2wvm4/a1
         Seu1xSx9zCz/NsNbaNxL8n7Ufcf61YQDX1OiYSQtYK+KFWdHBlOyP0vPT0aZFWZiOLVF
         IJQ1W30NYe9iq70JPKS2nx37i/EHIc+FNlVOxt1OwvgRhcN6MmfGgNP9l/E8kBKs0WxD
         uRU4t6YBKmOWp4PDqBUdUNL3VZqStM20Z0SWtTW7hkwJlN4jxnHnBJqU12Vm5x8Xk85i
         wCfw==
X-Gm-Message-State: AO0yUKUZg5SjcipBTA7RMEW9+qk/mkx1S+SGZR0uTEfkg2aUynCYzxkN
        9K92tK/F0Hd/xqdpQMxO/k7q/Q==
X-Google-Smtp-Source: AK7set/+HySEl6FkzubMrCOPSVrTSTC+4hmn0rgn9gkddELIUi1sLBXEuny+7Bu/oI4dGAqgvgqRQg==
X-Received: by 2002:a05:600c:13d4:b0:3df:e1e9:200e with SMTP id e20-20020a05600c13d400b003dfe1e9200emr4350632wmg.39.1675803632184;
        Tue, 07 Feb 2023 13:00:32 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f9-20020a05600c44c900b003dc4fd6e624sm8041631wmo.19.2023.02.07.13.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 13:00:31 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 6/7] ARM: dts: exynos: drop redundant address/size cells from I2C10 on Arndale
Date:   Tue,  7 Feb 2023 22:00:19 +0100
Message-Id: <20230207210020.677007-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207210020.677007-1-krzysztof.kozlowski@linaro.org>
References: <20230207210020.677007-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

I2C10 does not have any children because it is used in HDMI DDC, so drop
redundant address/size-cells.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos5250-arndale.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index e995cfee03f3..305289ed06d8 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -627,8 +627,6 @@ i2c_ddc: i2c-10 {
 		sda-gpios = <&gpa0 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&gpa0 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		i2c-gpio,delay-us = <2>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 	};
 };
 
-- 
2.34.1

