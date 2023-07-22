Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79EE5EB64DC
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 22 Jul 2023 11:56:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbjGVL4z (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 22 Jul 2023 07:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230137AbjGVL4w (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 22 Jul 2023 07:56:52 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE1363C10
        for <linux-samsung-soc@vger.kernel.org>; Sat, 22 Jul 2023 04:56:30 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fb4146e8fcso17107065e9.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 22 Jul 2023 04:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690026988; x=1690631788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jx38YAgpp6hIi64Yp6dmi2Ukk67ZvJvPP+5Pl7scxe0=;
        b=STdBfm9+Ix8aU0/LpfmXkOsCFdEV/PThsfDm6CBgSDhfTfc5qHdp19fkQHB4HWhtR2
         ba+FWXnmkWvaLZOZ4wHE+0QuX0zJXgc1qenAzcMKY0W6xWgQVZ7qc88/KvZm8OurxdpV
         fcsb4oWcquMN4qFO3A0SuLkdUMBTRBURH/ftEEpWEV0lOu4TZX6uoL+jXAW/77D/xLMp
         EDKEhV10rMW9REFCr2Lwu0jrjfkue3dOLul3hTnGp1N01SGUYdb6brGXjZjrVRn9GtHE
         jWiMeUvblxq0GuW3ByI4oGluEtiqJIk246UI3hWJv6r7utyrcaxcOshWQQb/xVksdp0M
         j9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690026988; x=1690631788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jx38YAgpp6hIi64Yp6dmi2Ukk67ZvJvPP+5Pl7scxe0=;
        b=QsyhkpANIkFvvMmvogbw81470cl7TZJpVh/q5vDsE+eFf+f9164/78rozq55EomVuQ
         Z1MrF53eeAXVzTndSX/X+IyyokBBI7Bi2Hnpgnp8ZAAHYgBu5f6wBI+6HLkq62hqfcnI
         pvRWOyDwd2J1TTIyXhqOHV2k+K2fkri5tLw/tRoU2J0vrrBLvELm0YMA5moD/RDoi/h8
         gKHhm97n1G59sdHcJ7ebU3siCt9OrdT2Avzk08ilTFBF8bYk41qH3ceGawj1P0QL14Tc
         TCXUblFy+pl+HPEyCPWCqRKdZZjFwtLzDkjUBy7cy7rvLK4dKjnFDH3j2aUdzM0Y9so2
         hCpA==
X-Gm-Message-State: ABy/qLY8VfBU5hnINszZjGN7ajn/EnG3y0WBMFbiWxGOUpwkS39x7cix
        x0f3O3cd3Yqi8cv3tKHGq6jVAA==
X-Google-Smtp-Source: APBJJlH2wxdhqpfxwFfsZe3/7Q4M5ZjqvxDZQv3rEbLOcDQxMxiCn47vrxpTMvZwclDTRlGTATvpcg==
X-Received: by 2002:a05:600c:1d8e:b0:3fb:ebe2:6f5f with SMTP id p14-20020a05600c1d8e00b003fbebe26f5fmr9682739wms.13.1690026988311;
        Sat, 22 Jul 2023 04:56:28 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id f18-20020a7bc8d2000000b003fc01189b0dsm5242365wml.42.2023.07.22.04.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 04:56:26 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ARM: dts: samsung: exynos4x12: replace duplicate pmu node with phandle
Date:   Sat, 22 Jul 2023 13:56:17 +0200
Message-Id: <20230722115618.140002-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Devicetree for the FIMC IS camera included duplicated PMU node as its
child.  This is not a correct representation of the hardware.  Mapping
the PMU (Power Management Unit) IO memory should be via syscon-like
phandle (samsung,pmu-syscon, already used for other drivers), not by
duplicating "pmu" Devicetree node inside the FIMC IS.

The change is not compatible with older Linux kernel, which does not
parse samsung,pmu-syscon property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on:
https://lore.kernel.org/linux-devicetree/20230722115441.139628-1-krzysztof.kozlowski@linaro.org/T/#t
---
 arch/arm/boot/dts/samsung/exynos4x12.dtsi | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4x12.dtsi b/arch/arm/boot/dts/samsung/exynos4x12.dtsi
index 84c1db221c98..4524c1e6bb2f 100644
--- a/arch/arm/boot/dts/samsung/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4x12.dtsi
@@ -516,15 +516,12 @@ fimc_is: fimc-is@12000000 {
 		iommus = <&sysmmu_fimc_isp>, <&sysmmu_fimc_drc>,
 			 <&sysmmu_fimc_fd>, <&sysmmu_fimc_mcuctl>;
 		iommu-names = "isp", "drc", "fd", "mcuctl";
+		samsung,pmu-syscon = <&pmu_system_controller>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
 		status = "disabled";
 
-		pmu@10020000 {
-			reg = <0x10020000 0x3000>;
-		};
-
 		i2c1_isp: i2c-isp@12140000 {
 			compatible = "samsung,exynos4212-i2c-isp";
 			reg = <0x12140000 0x100>;
-- 
2.34.1

