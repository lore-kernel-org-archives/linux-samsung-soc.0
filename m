Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C8CCC27C76
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Jan 2023 09:45:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235326AbjAYJpy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 25 Jan 2023 04:45:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233453AbjAYJpw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 04:45:52 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 364428A56
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 01:45:26 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso829261wmq.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 01:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ztfbDoxGkDtDmGmBYfiBuBdnAIcB0uPVrA/v1nCpTCQ=;
        b=FsdNwkstyvELDGvtDJLlGrYXxXaw+Yd/rnWhJQdaClPX/6nI30z3KrEYdR1blg0yas
         HnJqJNdicB2Y8z/DDK7cVk2GiT1P7gjMOafnUgCU0NdWgPooizBy+2uA1TaqDKFCkYQ4
         irODL2cF7vLmfyvfA9kfkYlL5hsV7FQVZXfrMZZXT6qtD+IiBn/Rpi/dmW/ITImzx5FV
         7X34wUvBf1FSmcmnHVYSOCK+yAE4jsrYCXGyXWeyVCaWpPs3BMk/qPl05Y12+5WnXY0h
         khowzHbFZk9pHgh4AwlV3zTopNMsDH6el5kMsATONevRApwi4JSZVR7MKxQ4GRf1+AXf
         zN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztfbDoxGkDtDmGmBYfiBuBdnAIcB0uPVrA/v1nCpTCQ=;
        b=DrUNvbTMz6iIIUiS840DrW0MHOaz2q4mspLnIhMZZAkYuUNcZqCtdhLeGXg6FB3t6r
         qTGwiwOfJUQyWij6SVxaEGTkAWWfTe7Ok6s5qmvzzMqzTGGTknpMk96nTQNq/m037c1D
         QBQMexRtTrF94ryTwhBGArkUP38w5WdYUVM1nBfB2XE3jmTgS9XUyxvp+zk2097eUwwN
         9TUJin17drVzXRcZQ/xHawcHuiGdSunD5bmTryMD6LF9SDtxSOv3v0E9/6gfl0KimHYk
         SC4LHQzbD7A9tt5TlZkT8rxQl20acpGGZL3DjnOZbJjIlXD0VARHWqEWhJZHPx2CUmjq
         3XFA==
X-Gm-Message-State: AFqh2kq/qSrd7FBZJf4KtRW7dXCfmEkSSw2Q880XuzpPvyItv9JZQs6M
        xBnj9ezHbPiFyGv7GLHPsQmQ1g==
X-Google-Smtp-Source: AMrXdXsh2igFfleXr30Bewy8M0jQBLxP7I9V02wCXUXTYQcHNQM6+J0AOl+0hWI7jdNJPkdu81Wrsg==
X-Received: by 2002:a05:600c:4e05:b0:3c6:e61e:ae71 with SMTP id b5-20020a05600c4e0500b003c6e61eae71mr32485060wmq.1.1674639922588;
        Wed, 25 Jan 2023 01:45:22 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id fl22-20020a05600c0b9600b003d1e3b1624dsm1419238wmb.2.2023.01.25.01.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 01:45:22 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     replicant@osuosl.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH 1/9] ARM: dts: exynos: correct HDMI phy compatible in Exynos4
Date:   Wed, 25 Jan 2023 10:45:05 +0100
Message-Id: <20230125094513.155063-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The HDMI phy compatible was missing vendor prefix.

Fixes: ed80d4cab772 ("ARM: dts: add hdmi related nodes for exynos4 SoCs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 55afe9972460..d1adaee2af58 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -605,7 +605,7 @@ i2c_8: i2c@138e0000 {
 			status = "disabled";
 
 			hdmi_i2c_phy: hdmiphy@38 {
-				compatible = "exynos4210-hdmiphy";
+				compatible = "samsung,exynos4210-hdmiphy";
 				reg = <0x38>;
 			};
 		};
-- 
2.34.1

