Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37CA5C25B4E
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Jan 2023 13:01:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbjATNBQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Jan 2023 08:01:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjATNBP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 08:01:15 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2949FBCE3B
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 05:01:14 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id fl11-20020a05600c0b8b00b003daf72fc844so5814875wmb.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 05:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TcM8XhDKOPbBsFGO0+W5tGL9iLdvv5/DvMQLA7ZA1gw=;
        b=IrxCUmhLzvaQmFPa0wmZropX0S4nPCOToD2CgGQ/h5wz9kdpXybcdLemwOlLsgdFmY
         33dumliNcnI+hpx7/aMUEAnKeilUU1/ipb1T68ufo1+8TMsYgs/ffDWB4UeBEo1TmkgX
         kBl9D6zmAt5vMPtK9Ow4Awf4kT3k1WY3i9CCzYma2+jmlCfvrJTa0rwfN2FJkYJ1xRJC
         DIW5/6NsmHVHQjsMauS/J3MP5BTKdkEsMlFpFVDCIfdib8/mJn1NnQxgLURMOKlQjGUL
         0of13CoeBYEFytIqLIUeQzm+/GLbj5d9Ifyx9QwWOdaWawv2sah1SoyUSW7SGQffj1g6
         zaHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TcM8XhDKOPbBsFGO0+W5tGL9iLdvv5/DvMQLA7ZA1gw=;
        b=JXQl92pwXGEGiSQFUm67pX9sUAv6VI0X2V+3wBn/XkRtOMp6JTQ5Etrv+FYMsxK2zc
         W1kpvVjwu/AGrvaxz4z7kLw9V8jHVgYmLrXkHPUZg0MayhbQG6rrJIPkIFYtbMTEacAv
         U9HlkurAlR+R7Ii/27VGAh6KWtjVJOxhLaDZArYdozyb/S6trst1btIocpd8hTugjVrg
         s5NhWQ8Jp5g7kyY3LCcDfCm4o+G0tKPHCmAAwhh7MPRQGHTKFxjla8oUtHjPyLkpmptk
         xDN8uVsPf+Iu3lSbC2MjlreyB0LBTwV9FQjsLNSzS5HdCO/QfZW969WKnxpOu3vpltoM
         DXeQ==
X-Gm-Message-State: AFqh2krrb0VcrWGBEZCkg+w91UTiQKT7H+XnPQAW6TvjjA/x46Cq0jQc
        ccTQzv3vEnaroQJ7TdcC9VXxig==
X-Google-Smtp-Source: AMrXdXvpbA/Ou+cnHvZNOOu0VIf5TFaLA2b9bSfYKs6ZNohSp2Px51Y30p44NWNMw0wcC4XbIeETBw==
X-Received: by 2002:a7b:cd11:0:b0:3d9:6c7d:c9ee with SMTP id f17-20020a7bcd11000000b003d96c7dc9eemr22435915wmj.25.1674219672635;
        Fri, 20 Jan 2023 05:01:12 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id w12-20020a05600c474c00b003db2b81660esm2275631wmo.21.2023.01.20.05.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 05:01:12 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: exynos: drop unsupported UFS properties in ExynosAutov9 SADK
Date:   Fri, 20 Jan 2023 14:01:08 +0100
Message-Id: <20230120130108.278851-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

There is no vcc-fixed-regulator property for UFS nodes:

  exynosautov9-sadk.dtb: ufs@17e00000: Unevaluated properties are not allowed ('vcc-fixed-regulator' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
index eec3192c0631..101f51bf565a 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
+++ b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
@@ -65,13 +65,11 @@ &ufs_1_phy {
 &ufs_0 {
 	status = "okay";
 	vcc-supply = <&ufs_0_fixed_vcc_reg>;
-	vcc-fixed-regulator;
 };
 
 &ufs_1 {
 	status = "okay";
 	vcc-supply = <&ufs_1_fixed_vcc_reg>;
-	vcc-fixed-regulator;
 };
 
 &usi_0 {
-- 
2.34.1

