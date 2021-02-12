Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FCBC433DB
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 12 Feb 2021 16:40:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B8F5D64E42
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 12 Feb 2021 16:40:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbhBLQkI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 12 Feb 2021 11:40:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:38068 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229989AbhBLQiT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 12 Feb 2021 11:38:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B1C9064E42;
        Fri, 12 Feb 2021 16:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613147854;
        bh=7q1Vc3ssciykH0aqot0h+gFx3rf7LE1Jyy2clH+JiQk=;
        h=From:To:Cc:Subject:Date:From;
        b=ivbi4LWZXUWDYisvWHvzin2fotyrP0B9MPa8RpXl5YMMpLRzJRGvNGLip83PGjXkC
         AiJGDYT7lZKuIvtENi4eRwA0fpP1zi51ZOshLEzWhTpCjct9LAytXG+umTWrigogvm
         EDgW1jvsqwqQFf04GL6EF2Bs0Bvm2LWxOTJR9+MyQ/s0JgQbTF25iirUAFCa5F8+8Z
         IfehM7zfcXCCp4v8zynuIGi4/Yn+T067PbfwBNIT33nfIzTiim2VAW+pMOC8sZid56
         uy62A25bueB+9U2qPjEXnz1r5MKFGnc+QuqUz0KHTMDMtiTv8TZGZCr7fKnzsXRsc6
         AcpKk3kwINUaQ==
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] arm64: dts: exynos: re-order Slim SSS clocks to match dtschema
Date:   Fri, 12 Feb 2021 17:37:29 +0100
Message-Id: <20210212163729.69882-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The dtschema expects pclk (APB clock) followed by aclk (AXI/AHB clock):

  arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml:
    slim-sss@11140000: clock-names:0: 'pclk' was expected
  arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml:
    slim-sss@11140000: clock-names:1: 'aclk' was expected

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 6433f9ee35e1..18a912eee360 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -564,9 +564,9 @@ slim_sss: slim-sss@11140000 {
 			compatible = "samsung,exynos5433-slim-sss";
 			reg = <0x11140000 0x1000>;
 			interrupts = <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>;
-			clock-names = "aclk", "pclk";
-			clocks = <&cmu_imem CLK_ACLK_SLIMSSS>,
-				 <&cmu_imem CLK_PCLK_SLIMSSS>;
+			clock-names = "pclk", "aclk";
+			clocks = <&cmu_imem CLK_PCLK_SLIMSSS>,
+				 <&cmu_imem CLK_ACLK_SLIMSSS>;
 		};
 
 		pd_gscl: power-domain@105c4000 {
-- 
2.25.1

