Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6082DC64ED6
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Feb 2023 16:17:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234234AbjBUQRA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Feb 2023 11:17:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233951AbjBUQQ7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Feb 2023 11:16:59 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED3202BEC8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Feb 2023 08:16:57 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id s26so19291122edw.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Feb 2023 08:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Qgw0AmK1U/4XFxqdFWiQIcUFoLtC2XE6pEAKu9xLso=;
        b=LJSdGxHeUbOJh5U+DsxiFxsrIX3cVHr+d1RJVcSe0QOWIDaV93zgRapt7edtgUr5fW
         oRy2G7cDsC09eRWCi5qi71T+63CORBkYYYWp5CrJeCEMEdp7ZRkSd+SnUC6h1ryRMrOv
         eDfby1Azg52z0oEier9px/RFumgPzfQiVOOPDYrC26fYiAclHB6hkJLKfxMSCuieEDEt
         CNe9YgFWhQbm6IXv9cMLLckIIZ4Pqq0zDCyeYvMZ88bIapyHKdDC/ALnvWi3SRBLFjOK
         0Ju+OaWCS90KOOyB2Zer0fqA7C6sj+l72t9LBSi6wJJtZE5FTrwLFTRSDWmjSAHfElTq
         Gumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Qgw0AmK1U/4XFxqdFWiQIcUFoLtC2XE6pEAKu9xLso=;
        b=PEvw7zDjjPAzauKn49jgnrZ38Rt2MiAF16IH4wF6RQkms11rLYMylbMK/oUYzV43fM
         YKX9qZoyorwDr2gMh8z1ZmY00hHoc4GG/ACeskPXCW/rqKBxMH7n731xKmARnG1DeRe+
         HLpnmUOrGeRhqHloT4mFQ1VemxcJfJ8X4h6/vcj1lEIArRpAQjTE2ieV20pVE7hE6UZH
         X+vVhz35zN8/cmFyKh6u0WkEY7Xh5W5ayNLBkZFL9C/naDMDtvuoIoMlrl0W0m+qjn2U
         /72gzfxKjGD8mrKNQTUvQesH2q9OoFs25VDEkmG61mKRgQkJzRrZz4OqAQGAOxnTBZSm
         rrZw==
X-Gm-Message-State: AO0yUKWwy9ehisw5b4mZwq9SmkXaoL2124w5wvaafpAp5m77hCJEmwLA
        y6GxOruka0Hio2t8v3s3V7MZMA==
X-Google-Smtp-Source: AK7set+SrGXKa800i2OrNT3P4t5/TYlN3PTGX1m1S5tM2ViaZoYAl/YYdcJwK5AnGRzLxmUpcqDPrg==
X-Received: by 2002:a17:906:11ce:b0:88a:a27c:c282 with SMTP id o14-20020a17090611ce00b0088aa27cc282mr12626034eja.47.1676996216447;
        Tue, 21 Feb 2023 08:16:56 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h21-20020a50cdd5000000b004af5968cb3bsm643322edj.17.2023.02.21.08.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 08:16:56 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: exynos: fix MCT compatible in Universal C210
Date:   Tue, 21 Feb 2023 17:16:53 +0100
Message-Id: <20230221161653.56574-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

When desired, nodes should be disabled instead of changing their
compatible to a fake one:

  exynos4210-universal_c210.dtb: /soc/timer@10050000: failed to match any schema with compatible: ['none']

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4210-universal_c210.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index 20840bd0d062..1acaa6dced99 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -513,7 +513,7 @@ &i2c_8 {
 };
 
 &mct {
-	compatible = "none";
+	status = "disabled";
 };
 
 &mdma1 {
-- 
2.34.1

