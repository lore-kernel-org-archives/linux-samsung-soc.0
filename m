Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DE9CC7619A
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Mar 2023 21:28:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231246AbjCOV2r (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Mar 2023 17:28:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231180AbjCOV2p (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Mar 2023 17:28:45 -0400
Received: from out-17.mta0.migadu.com (out-17.mta0.migadu.com [IPv6:2001:41d0:1004:224b::11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14DF019C60
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Mar 2023 14:28:37 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
        t=1678915715;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vAKBsvws71kJTHTxaksOf1+WTTkfvDgnY5I/sW6xXf0=;
        b=RRpZJfxnUBdMfHaEsrfKDDKh87jLgL6H26X87WRndkHucVOt3LI20ooqentwY1tPj6KdI2
        5ZxnF7gW2K39pmSB3uxRU6i3JmhonP6jVgoTF7G6lAyQoo4Mi6yO+rPWCGNsNAxTbbO8k1
        hvWBUgIxqXHuB20x6AiqwY4iY1bFnts=
From:   Henrik Grimler <henrik@grimler.se>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        alim.akhtar@samsung.com, m.szyprowski@samsung.com,
        virag.david003@gmail.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Cc:     Henrik Grimler <henrik@grimler.se>
Subject: [PATCH v2 2/2] arm64: dts: exynos: add mmc aliases
Date:   Wed, 15 Mar 2023 22:28:14 +0100
Message-Id: <20230315212814.15908-3-henrik@grimler.se>
In-Reply-To: <20230315212814.15908-1-henrik@grimler.se>
References: <20230315212814.15908-1-henrik@grimler.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add aliases for eMMC and SD card where applicable, so that
assigned mmc indeces are always the same.

Signed-off-by: Henrik Grimler <henrik@grimler.se>
---

Changes since v1:
* None

 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 2 ++
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts       | 2 ++
 arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts  | 1 +
 3 files changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 868f7b98a637..e4ed788413fe 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -21,6 +21,8 @@ aliases {
 		gsc0 = &gsc_0;
 		gsc1 = &gsc_1;
 		gsc2 = &gsc_2;
+		mmc0 = &mshc_0;
+		mmc2 = &mshc_2;
 		pinctrl0 = &pinctrl_alive;
 		pinctrl1 = &pinctrl_aud;
 		pinctrl2 = &pinctrl_cpif;
diff --git a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
index 35d949099166..1f2eddcebdd9 100644
--- a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
@@ -17,6 +17,8 @@ / {
 	compatible = "samsung,exynos7-espresso", "samsung,exynos7";
 
 	aliases {
+		mmc0 = &mmc_0;
+		mmc2 = &mmc_2;
 		serial0 = &serial_2;
 	};
 
diff --git a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts b/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
index 5db9a81ac7bb..47a389d9ff7d 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
@@ -18,6 +18,7 @@ / {
 	chassis-type = "handset";
 
 	aliases {
+		mmc0 = &mmc_0;
 		serial0 = &serial_0;
 		serial1 = &serial_1;
 		serial2 = &serial_2;
-- 
2.30.2

