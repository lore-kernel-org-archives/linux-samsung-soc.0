Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C69C64EC7
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 25 Feb 2023 16:41:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjBYQk7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 25 Feb 2023 11:40:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbjBYQk6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 25 Feb 2023 11:40:58 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63E7F1205C
        for <linux-samsung-soc@vger.kernel.org>; Sat, 25 Feb 2023 08:40:56 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso929344wmb.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 25 Feb 2023 08:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8UdSbnxnovWYaD1qvI9kf5ZeJ330c4affjZYTPUmJTc=;
        b=iq7xMDV8TcMdkpZBVLPqqXgernHW9WbD2rEo/DPd6KjP3TNfrl4K/vc9u6dQZ+IwVB
         w5EvW8uy3m4TlE4vqXYUWK/AtBnqa0/SM1bgJbPtGx5sl0lVTbeO/gPnPjc4rVyKWbP1
         Xo/IZgp9yEZEJe9u7KA5wUIDRu+UVD/Ip1vpXh3tzAtab5ayagC5ea2qZDZqaYoVbWeM
         fWBC+NYpKsoPRj4CXeWORvr6fXL+6F/qCXOAs/lQRptMq+9hj4vfnNjpBUx6YUk5NLv1
         YGnCwASNlji/AoLyb1m7qypkHY+IOjIgTW0MRUh9IMuRt9dQkobYTjr/wqhMvYdvMZ0a
         vv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8UdSbnxnovWYaD1qvI9kf5ZeJ330c4affjZYTPUmJTc=;
        b=d8o1LmHA4HV5DnD9xWotinUZunuvfiAVpv1oXfw5te28KKV58KBkBHqr7FCf5siIRJ
         A/KF8XYTBd0rR3F6qD7HaTD6GoSFSSX/8El9Q67k1x3UblmMkG4txqpjwgmjhe0coilk
         s+smc4nmu+cEXoyUz41YoCHUPXhg4jSP/sf7ZA8qj0JD8kdhZ2/sx2ZUnX3NzmxhFlzb
         PHhKofvF4q8XWjAHhmb3lHSN4NjumzNdapz0yh6XS7e3z+z/zWPDhkQMOpb7IwS/SN67
         nnKOiIxD4dmZnTURCLdCjm1fx0K8jSP73XkUKhrTCGdXYFlX1v12K86yKA3k12BBFy6S
         7ZKg==
X-Gm-Message-State: AO0yUKW7wFW5vRayp+fkuq4rwH3JMh6E1MAbCn6TxIVFtGBWNccO3dhN
        Jvj/1glmE1p2A0GoY9AL1B4M0w==
X-Google-Smtp-Source: AK7set+ipNlrvKEWy9XUrjaibIEjpo8ugCIBL8JhksuS+K2OjMFS1weYUHqZOCvuWGoRqXMWFYotEQ==
X-Received: by 2002:a05:600c:331b:b0:3eb:2da4:f32d with SMTP id q27-20020a05600c331b00b003eb2da4f32dmr3679192wmp.26.1677343254919;
        Sat, 25 Feb 2023 08:40:54 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id s17-20020adff811000000b002c758fe9689sm2189163wrp.52.2023.02.25.08.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 08:40:54 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ARM: dts: exynos: align STMPE ADC node name with bindings in P4 Note
Date:   Sat, 25 Feb 2023 17:40:49 +0100
Message-Id: <20230225164050.42522-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The node name should be generic thus rename STMPE ADC child to "adc".
Bindings will expect such name as well.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4412-p4note.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4412-p4note.dtsi b/arch/arm/boot/dts/exynos4412-p4note.dtsi
index 3e05a49f29ff..84db696d543a 100644
--- a/arch/arm/boot/dts/exynos4412-p4note.dtsi
+++ b/arch/arm/boot/dts/exynos4412-p4note.dtsi
@@ -195,7 +195,7 @@ adc@41 {
 			st,ref-sel = <0>;
 			st,sample-time = <3>;
 
-			stmpe_adc {
+			adc {
 				compatible = "st,stmpe-adc";
 				#io-channel-cells = <1>;
 				st,norequest-mask = <0x2f>;
-- 
2.34.1

