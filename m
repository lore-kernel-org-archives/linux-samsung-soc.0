Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C950C25B4E
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Jan 2023 15:54:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbjATPyt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Jan 2023 10:54:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231625AbjATPyg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 10:54:36 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE603E0521
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 07:54:26 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id e19-20020a05600c439300b003db1cac0c1fso4651069wmn.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 07:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pD7HTNzkQ6LlDfhApbijvX7r0JmIULj//GNFGkuZGWE=;
        b=ese5zR5fn7AOMz6ufd5qVaHQEC9BEH085H7uL6rLR9joav3dXlHHkJvMLVmpBGZuxB
         1wxfvVjIYtI1aYSePOUUMfmXJsPGOEzDuOrd2aqXfSsaP5ulFkv6Cxqel7Mi+L4YKE/R
         Mnni8m+XKkqu9PUwgacltmGLqFunq6wuDCkOyl7A5MikfnDd6bNlmI1ZxT1XKJElvms6
         hB0TE2mLIGSkvAqcNkCZyPuWddnk02vqKpQcx8pXjOzr5S05HeakSsxRUcgU97gtWM7d
         6sICQ8n/YB5OqhRmayqMedII11UwNX88RXp2gZqy3L2nuiPX/vm50aaEQstOtuH2o1br
         Q2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pD7HTNzkQ6LlDfhApbijvX7r0JmIULj//GNFGkuZGWE=;
        b=iGsEq16bWamaB00+jHov+TvBoerXq3QTMUnjqgEFzKBI6P3At71VTz3RObqwJcZKLV
         JKIxi5hLHnhZASsuvQ/39AAU9QhX8bhnzmRmUmx1nkMn6QBHIXdC651T6aUn7aU3ILyj
         9enH0lD73RFaIm0hfjjJIqWQp0oO+54YgUzpjAVheeGrJzAtvXpvDBgS1W+N+nrrAbXK
         ZVsGbdbUu3eSrbFRQHbUbyHLxKNleXqgbIT6/zNX0QNvES2qzH3Na+F+5I8+IkRsp+lO
         pqTPl4lJRU2DvqQ8Nwc4tVdkK4zTYlqjRt4hIiiUQZGYRgnRimemo6ANww6K8yCjeS19
         XfOA==
X-Gm-Message-State: AFqh2kpOn6xnOCSjbtlN4I/710g5D/IHgb55D1QJan7k3y5WNXSsSSLC
        7e8tlubXLktWPwrWxjsT51rsA3Careo9I4A9
X-Google-Smtp-Source: AMrXdXsewSK5rA0mx6EFgbMMl6cktjjOGBqLLR4cp2j9UAgBOPtTfW0CjuOuMQsECq281U4OFV8U4w==
X-Received: by 2002:a05:600c:4248:b0:3d9:7667:c0e4 with SMTP id r8-20020a05600c424800b003d97667c0e4mr14571878wmm.31.1674230066341;
        Fri, 20 Jan 2023 07:54:26 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n42-20020a05600c3baa00b003d96efd09b7sm3349596wms.19.2023.01.20.07.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 07:54:26 -0800 (PST)
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
Subject: [PATCH 09/11] ARM: dts: exynos: correct SATA clocks in Exynos5250
Date:   Fri, 20 Jan 2023 16:54:02 +0100
Message-Id: <20230120155404.323386-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120155404.323386-1-krzysztof.kozlowski@linaro.org>
References: <20230120155404.323386-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The DT schema expects clock name matching certain patterns:

  exynos5250-smdk5250.dtb: sata@122f0000: clock-names:1: 'oneOf' conditional failed, one must be fixed:
    'sclk_sata' is not one of ['pclk', 'aclk', 'hclk', 'sata']
    'pmalive' was expected
    'rxoob' was expected
    'ref' was expected

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos5250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index f82f82fc803f..9225f3552837 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -390,7 +390,7 @@ sata: sata@122f0000 {
 			reg = <0x122F0000 0x1ff>;
 			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_SATA>, <&clock CLK_SCLK_SATA>;
-			clock-names = "sata", "sclk_sata";
+			clock-names = "sata", "pclk";
 			phys = <&sata_phy>;
 			phy-names = "sata-phy";
 			ports-implemented = <0x1>;
-- 
2.34.1

