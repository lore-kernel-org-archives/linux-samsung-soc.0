Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3482C3A5A7
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  4 Dec 2022 10:42:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbiLDKmu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 4 Dec 2022 05:42:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbiLDKmt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 4 Dec 2022 05:42:49 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 626C2DEC6
        for <linux-samsung-soc@vger.kernel.org>; Sun,  4 Dec 2022 02:42:47 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id z24so10387064ljn.4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 04 Dec 2022 02:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wIYmumdV6gF7dGwolIurE0WSvXTzLO3ZVkYOJH7esYo=;
        b=gaoyEdeCSpXIkrztrskMmFzKZd+uKAC02WjdIn4Xxuc9BR2vWmKAQWMNsGBCF3AB3v
         Qgszu/gsbChP24xLYUK7O2LSLbvxXYZuRbrf8tEUJ+NSFxW9ebpgjMV0dSllrstC8iBa
         u+dLBEc7E3IvTBRuO6Vm7u+kApHQO8ensK4VphpQBAwj7LkhLl1VKff+J1J2fuQLAWLK
         d96YTcWt4HPipDxIP9UFrFk+1lHweC/phnhqZ5O4TcE3NTg4qHg6HU65+3dBgUVQCxEF
         rBEWGm0HtlecCdu/apd2u+DaDYxvuG4SCIBH5qnZogziN0yRvVuJsS7W325TBDj1qcBY
         qISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wIYmumdV6gF7dGwolIurE0WSvXTzLO3ZVkYOJH7esYo=;
        b=X0Tbo8YQJzk5YeRcyshTG9CRw09junRy9+iGF/0j73WinOD/pPyK7aiJGT85aMXt7m
         sA54IFUZ1inHvg/ZJLQFfloRhRRQfkfR7r7FpoaUf+MBRiG3tM0bDZnHXnDRalJZN+Ja
         OxNZvqcc3if0Uhsit4IHxQZnQ4HeK8ZuWWs+BtnBm7zmxwjV9kDg+KYEHkfxny/a/uMf
         Ju3gKfiU1gBY49dNkf/Vm+MbhqEl8eX6HeKALDGVgAYy7e11pIrp+KAm8x15EtFhrY2h
         PzxNLtU2gpQtGXWkLBUyp6S2+MtsrYA/Uu2UvaCIGt2JCk72Xd50Iqg/f5h01w4CVjnZ
         znWg==
X-Gm-Message-State: ANoB5plmrjNUbEofQhFJDXBtpe4wEaMvLl5XY/av7lrh7G62zlBf1WW6
        3tfKqmsuvD9a569J5k5oEhgslw==
X-Google-Smtp-Source: AA0mqf5jbzbV2Z96L1gL7GUlH/q5OZ2ofi46akDEv9/ZqWeiTjVTCgL4WLyT21ULbLWJ/re3wyLCZQ==
X-Received: by 2002:a2e:a37c:0:b0:26e:93:980d with SMTP id i28-20020a2ea37c000000b0026e0093980dmr26233053ljn.488.1670150565638;
        Sun, 04 Dec 2022 02:42:45 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k4-20020ac257c4000000b004afac783b5esm1715433lfo.238.2022.12.04.02.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 02:42:45 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: exynos: use 8-bit for SPI IR LED duty-cycle in TM2
Date:   Sun,  4 Dec 2022 11:42:42 +0100
Message-Id: <20221204104242.117558-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The 'duty-cycle' of SPI IR LED property is u8:

  exynos/exynos5433-tm2e.dtb: irled@0: duty-cycle:0: [0, 0, 0, 60] is too long

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index bde6a6bb8dfc..5b002a85b792 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -1315,7 +1315,7 @@ irled@0 {
 		reg = <0x0>;
 		spi-max-frequency = <5000000>;
 		power-supply = <&irda_regulator>;
-		duty-cycle = <60>;
+		duty-cycle = /bits/ 8 <60>;
 		led-active-low;
 
 		controller-data {
-- 
2.34.1

