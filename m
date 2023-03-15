Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0292C76195
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Mar 2023 21:28:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231802AbjCOV2q (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Mar 2023 17:28:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231623AbjCOV2o (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Mar 2023 17:28:44 -0400
Received: from out-52.mta0.migadu.com (out-52.mta0.migadu.com [IPv6:2001:41d0:1004:224b::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28A5415571
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Mar 2023 14:28:35 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
        t=1678915713;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4b1Gllv9chcAwQ2HUL3kdh3qznUDR7J46Su9EXl4o+Y=;
        b=D4FgNlfQMZbSMxGfyA3tFui6gqGrL/bNhUG49m5WoR3ZeVM7VVkHZbYwO0DAkrL6YzoVtf
        9Yi3CJjPyh8TKQCEtIdA9x2XHZQNaaUObWGO9gfo+sAbcsikBjPM1O3LYbJOao6bCCZ/Z5
        mwXggzbYS1CqgTKCLJUftL1+gmocILE=
From:   Henrik Grimler <henrik@grimler.se>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        alim.akhtar@samsung.com, m.szyprowski@samsung.com,
        virag.david003@gmail.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Cc:     Henrik Grimler <henrik@grimler.se>
Subject: [PATCH v2 1/2] arm64: dts: exynos: drop mshc aliases
Date:   Wed, 15 Mar 2023 22:28:13 +0100
Message-Id: <20230315212814.15908-2-henrik@grimler.se>
In-Reply-To: <20230315212814.15908-1-henrik@grimler.se>
References: <20230315212814.15908-1-henrik@grimler.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Previously, the mshc0 alias has been necessary so that
MMC_CAP_1_8V_DDR | MMC_CAP_8_BIT_DATA are set for mshc_0/mmc_0.
However, these capabilities should be described in the device tree so
that we do not have to rely on the alias.

The property mmc-ddr-1_8v replaces MMC_CAP_1_8V_DDR, while bus_width =
<8>, which is already set for all the mshc0/mmc0 nodes, replaces
MMC_CAP_8_BIT_DATA.

Also drop other mshc aliases as they are not needed.

Signed-off-by: Henrik Grimler <henrik@grimler.se>
---

Changes since v1:
* Add mmc-ddr-1_8v property so that capabilities stays the same
  when mshc0 alias is removed

 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 3 +--
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts       | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index f54f30633417..868f7b98a637 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -40,8 +40,6 @@ aliases {
 		spi2 = &spi_2;
 		spi3 = &spi_3;
 		spi4 = &spi_4;
-		mshc0 = &mshc_0;
-		mshc2 = &mshc_2;
 	};
 
 	chosen {
@@ -952,6 +950,7 @@ &i2s1 {
 
 &mshc_0 {
 	status = "okay";
+	mmc-ddr-1_8v;
 	mmc-hs200-1_8v;
 	mmc-hs400-1_8v;
 	cap-mmc-highspeed;
diff --git a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
index f3f4a6ab4b49..35d949099166 100644
--- a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
@@ -18,8 +18,6 @@ / {
 
 	aliases {
 		serial0 = &serial_2;
-		mshc0 = &mmc_0;
-		mshc2 = &mmc_2;
 	};
 
 	chosen {
@@ -362,6 +360,7 @@ pmic_irq: pmic-irq-pins {
 &mmc_0 {
 	status = "okay";
 	cap-mmc-highspeed;
+	mmc-ddr-1_8v;
 	mmc-hs200-1_8v;
 	non-removable;
 	card-detect-delay = <200>;
-- 
2.30.2

