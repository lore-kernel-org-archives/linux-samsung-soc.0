Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3675FC43219
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 16 Nov 2022 09:30:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232082AbiKPJaR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 16 Nov 2022 04:30:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231794AbiKPJaP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Nov 2022 04:30:15 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEEEB12761
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Nov 2022 01:30:13 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id g7so28607042lfv.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Nov 2022 01:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p3e80kgnaxg4MXziHxJJsTgEBFyzGcylgIj1o/AgplM=;
        b=CGlYruraG4OiCZHNYNSlvKAT/Q8/ez0SB+Ky/Au694M3zNr7RgytxAa8tP+AEXNy39
         e2LSg1tabY2x0k84Ag/lwt7M+B86zhIA1d+FmdnHHyaw5Urx5YU+VohX+wObEEbFI2Nz
         spGxVLaeyX+TcRVVXZy84R7rf+Cx7KNoxyk8AN4Mf6p0L3kQ4qQEL/XwYhjXaUWq5zPX
         eO/AEn1HMy7Jxl4tdjqCB6gKFuRYufOOTSxAPpKhyy2eDPfbremyIYfC8s7oOwZ2iJTF
         4gtfAqRJ0NkjgtlnOpuSkUxCu03IfJMClgqgnHFe+0zLgD8bwDM0MKyMwCv5983/EDe7
         UzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p3e80kgnaxg4MXziHxJJsTgEBFyzGcylgIj1o/AgplM=;
        b=pQQLHhZTEKpK5x5pvsZ45T5bB1M1nzaH6XVN9ypD7wYLOdX5WdUP8hVB7yxtRTv3pK
         2Q8hUoxMM8sX5gnZvQu7QG2osUV1G2nWqGtKiPOamrj6hfB9+GoA8wfT2fhaE2NdNCCv
         X/91rrQvAtTMyh8PKm+tQFZ8cyeYnprk1pa1D9nTiompYQaIKbtCeYvm1/c1g7LeW9ec
         VJ/x3Di+2h33ct+Qp1RPrgUyquWzwUg0jw9Qbty0zkpSas1aV2mSWaa+nqfyIwTz1Yyq
         rEwM4hgzeufKA0ycnwAfVWeuONIerMxdK5b2EcFhh1vW3oJN2NM1QW6OzVfnC9qqPL/I
         PQYQ==
X-Gm-Message-State: ANoB5pl/tGPiPJVqqfxcJJwd3gNFbodRlaE/baLGjC016UkA7IRCSmfy
        EZ6U1bn4stcKCKMhavsj/ZUPHQ==
X-Google-Smtp-Source: AA0mqf6iHX/VzyUoSVJzK6NdVQwfR8ipXYy1UjpF4TQDlP45yV4k9FYmvZ7FZ5i/aF1fueyvD1nvbA==
X-Received: by 2002:a05:6512:261f:b0:4b4:dd9:1880 with SMTP id bt31-20020a056512261f00b004b40dd91880mr6425311lfb.289.1668591012202;
        Wed, 16 Nov 2022 01:30:12 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s18-20020a197712000000b004b18830af7asm2517325lfc.54.2022.11.16.01.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 01:30:11 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Aakarsh Jain <aakarsh.jain@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Subject: [GIT PULL 1/2 - PATCH] ARM: dts: exynos: Add new SoC specific compatible string for Exynos3250 SoC
Date:   Wed, 16 Nov 2022 10:30:09 +0100
Message-Id: <20221116093010.18515-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Aakarsh Jain <aakarsh.jain@samsung.com>

Exynos3250 and Exynos5420 are using same compatible string for MFC codec
device but they have different clock hierarchy and complexity.  Add new
compatible string followed by mfc-v7 fallback for Exynos3250 SoC.

Reviewed-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Suggested-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
Link: https://lore.kernel.org/r/20221114115024.69591-4-aakarsh.jain@samsung.com
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos3250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 326b9e0ed8d3..a2d6ee7fff08 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -485,7 +485,7 @@ gpu: gpu@13000000 {
 		};
 
 		mfc: codec@13400000 {
-			compatible = "samsung,mfc-v7";
+			compatible = "samsung,exynos3250-mfc", "samsung,mfc-v7";
 			reg = <0x13400000 0x10000>;
 			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
 			clock-names = "mfc", "sclk_mfc";
-- 
2.34.1

