Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA92C05027
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 12 Feb 2023 18:59:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbjBLS72 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 12 Feb 2023 13:59:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjBLS71 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 12 Feb 2023 13:59:27 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 687E211141
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Feb 2023 10:59:25 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id az4-20020a05600c600400b003dff767a1f1so7529271wmb.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Feb 2023 10:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GmOvnEkaqrRpifwEMdH8ouHFrGB+gA1HRCLLbZbkxcE=;
        b=A/A9bnKggSe4CtixJPIXg2+ocd3ky1Zf88YMRLyyctEVsVzTjAuGLCYwMqY+b1uXRF
         1b6lKDkCcNyCryVa4tNBGBZMbr5UT5fBc+O7Gpsb/yGgxOOcg7NwQanPKAfrF6EH97mB
         Y+Svm/g/09FFelQy+xYSR61uoGxlLE3WO4sRaSOGER9CqMFe5nKOl2PkVf4Z0lR53qGi
         xV26sAos0E8gn0AnkE0zFPhlZnmu8Ng+UWYeKNKOVtKNzjJfE7uiSH/RkV0MQHRA7kks
         WOVtB0PZyKUWJ5eAifKTNvF2DI6GCIC6O17Tv5daf3tVHfve7ziLPCMDxDEVzspZAcet
         Do3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GmOvnEkaqrRpifwEMdH8ouHFrGB+gA1HRCLLbZbkxcE=;
        b=J9mjad9/itpr+YWNWxIYGaMod3ufk0h1owzuiz51lpSPKl10Lk7QPjuK4BREP/JMqq
         jEdLD6lW7TYsaARQiahoDWQ5kMJWt1PteJWLxdUepfJzsH/wT3NyZJV8Nk/f9y93BjRs
         MAjBIWcmlcKIyTnJ1pOCHbO44+wqscj3KpT3gMIpFEAXn+2JRPW4DdAaZfUfni/VP43z
         FLWCOX3Bdz1jQZbe6/X1+bb3NQWHzJZ0oKjpIoxrmLhRRJpMx9vS4sVQKonN8UwK+uVs
         kvo61s+GnyEoiaHYI4BP4uX2xJb621SyWasQjMHZ9S0eUdxYyz9KExlpGNOJ0vALSWlw
         H80w==
X-Gm-Message-State: AO0yUKXPlbu9m8Gg4dvP5AhQWXFy/rd9Xxw+TZ0Ilq6FMbluon4F3mDT
        c+FrIr4kTyW4yKdxY3dd5NDMYA==
X-Google-Smtp-Source: AK7set+SpidB+O2lsrnojHpqhI3WV5OLqCeRA0fDizUjdBPfOefwNNQTUyaGj7CS1grOOenVKI5CEQ==
X-Received: by 2002:a05:600c:30ca:b0:3df:c284:7e78 with SMTP id h10-20020a05600c30ca00b003dfc2847e78mr19176238wmn.38.1676228363627;
        Sun, 12 Feb 2023 10:59:23 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id bg1-20020a05600c3c8100b003e118684d56sm12391350wmb.45.2023.02.12.10.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 10:59:23 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Tomasz Figa <t.figa@samsung.com>,
        Mateusz Krawczuk <m.krawczuk@partner.samsung.com>,
        Kukjin Kim <kgene.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ARM: dts: exynos: correct whitespace in Midas
Date:   Sun, 12 Feb 2023 19:58:17 +0100
Message-Id: <20230212185818.43503-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Correct indentation and whitespace in Exynos4412 Midas board.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4412-midas.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-midas.dtsi b/arch/arm/boot/dts/exynos4412-midas.dtsi
index 763bd3441c5b..3be48de5c130 100644
--- a/arch/arm/boot/dts/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/exynos4412-midas.dtsi
@@ -497,8 +497,7 @@ &fimc_is {
 	pinctrl-0 = <&fimc_is_uart>;
 	pinctrl-names = "default";
 	status = "okay";
-
-	};
+};
 
 &fimc_lite_0 {
 	status = "okay";
-- 
2.34.1

