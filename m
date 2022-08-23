Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F90DC32793
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 23 Aug 2022 07:30:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240980AbiHWHaP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 23 Aug 2022 03:30:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240747AbiHWHaO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 23 Aug 2022 03:30:14 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B018161D42
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Aug 2022 00:30:12 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id x25so12687634ljm.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Aug 2022 00:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=31EpOHbl+nrYiysahic+51blRSoZd90XSQRkgmuZH8Q=;
        b=L3txLJbzNASJ23txY0RNdj71aCCiDk/ZgPs0vd6IuBr9Jv6qjFsL+DguB2evwx37e7
         qo4/+MYuYGWPNLgSL57Rm2eeWZ0HZ679AAcpgNEiFasaUq9yWOO1vzzYHiv66AA+BpOR
         q3iJj0TRj0U6/9X3QnNeitZxTTQebAAcJncBbhkUsEraYO3eM+aSY59qlihVBwx5nzOk
         94AX7APlauoQ9znqABTxQg9Mzq4dUkgFtJPUmGf9CWyI/yxlEgcUxsz7IB/MJMoz6HFj
         /mKsPjjmnBKxWQr7rHvftyc/piBxizSgIumInoNChwp9dy3mD42mvjbK8o5G6lpeATl2
         UL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=31EpOHbl+nrYiysahic+51blRSoZd90XSQRkgmuZH8Q=;
        b=GKz1FiwutFKSXC1OmCedTYtWMcm/FttCW1eXflZRSjCKmw8krKg91wYUA6XC1Dc/KV
         PEaiS8SfdSU4/HyMt9cKmsQAK5JS3ZMFRo4cRiI3UzV4GE4V2yr2McwEA1NGtfSdcLyV
         8jP00Yy9LYuL/q3nzulPoWWe/lEex9Xsmt/nMuOEj1pId5bdJXaWFQ02RBAO5U/IT2vS
         OtUR8xd/nPkSlzwBIWElaMW4gyvIpdSUIyJwNNGgQ+E0iQI40CHi1t9L4h2U/M9alpyw
         O++E3t0NbPRaD1c8oxb7X0AYiaCCwei0oVkYE+x2OrvQSmuYppphciFQO9ANfYoQ4FFJ
         97mg==
X-Gm-Message-State: ACgBeo3nA7SssWF582kU/YnHrLyd88i+EEgQ2By7za+ownV2ClLWG5Hw
        1LE8e2XvMil/7piem+E/wIWMfg==
X-Google-Smtp-Source: AA6agR7UsstB+zMX2Ji4pK97oKYfHBo72sTQaY6/pQpWOeEaDcMW0YiVsuF5zXcBH40oxBMg2GQp0A==
X-Received: by 2002:a2e:a593:0:b0:25f:e6ac:c28e with SMTP id m19-20020a2ea593000000b0025fe6acc28emr7003949ljp.485.1661239811099;
        Tue, 23 Aug 2022 00:30:11 -0700 (PDT)
Received: from krzk-bin.. (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id u19-20020a05651220d300b0048a7ef09b22sm2361230lfr.274.2022.08.23.00.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 00:30:10 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: exynos: Add SysMMU nodes for Exynos850
Date:   Tue, 23 Aug 2022 10:30:06 +0300
Message-Id: <20220823073006.358764-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Sam Protsenko <semen.protsenko@linaro.org>

Add all SysMMU nodes to Exynos850 SoC device tree.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Link: https://lore.kernel.org/r/20220809113323.29965-10-semen.protsenko@linaro.org
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 45 +++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 8e78b50416d8..c61441f3a89a 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -503,6 +503,51 @@ i2c_6: i2c@13890000 {
 			status = "disabled";
 		};
 
+		sysmmu_mfcmscl: sysmmu@12c50000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x12c50000 0x9000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "sysmmu";
+			clocks = <&cmu_mfcmscl CLK_GOUT_MFCMSCL_SYSMMU_CLK>;
+			#iommu-cells = <0>;
+		};
+
+		sysmmu_dpu: sysmmu@130c0000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x130c0000 0x9000>;
+			interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "sysmmu";
+			clocks = <&cmu_dpu CLK_GOUT_DPU_SMMU_CLK>;
+			#iommu-cells = <0>;
+		};
+
+		sysmmu_is0: sysmmu@14550000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x14550000 0x9000>;
+			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "sysmmu";
+			clocks = <&cmu_is CLK_GOUT_IS_SYSMMU_IS0_CLK>;
+			#iommu-cells = <0>;
+		};
+
+		sysmmu_is1: sysmmu@14570000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x14570000 0x9000>;
+			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "sysmmu";
+			clocks = <&cmu_is CLK_GOUT_IS_SYSMMU_IS1_CLK>;
+			#iommu-cells = <0>;
+		};
+
+		sysmmu_aud: sysmmu@14850000 {
+			compatible = "samsung,exynos-sysmmu";
+			reg = <0x14850000 0x9000>;
+			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "sysmmu";
+			clocks = <&cmu_aud CLK_GOUT_AUD_SYSMMU_CLK>;
+			#iommu-cells = <0>;
+		};
+
 		sysreg_peri: syscon@10020000 {
 			compatible = "samsung,exynos850-sysreg", "syscon";
 			reg = <0x10020000 0x10000>;
-- 
2.34.1

