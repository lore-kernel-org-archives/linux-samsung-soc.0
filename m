Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D97FC64EC5
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Feb 2023 20:46:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232999AbjBCUqy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 3 Feb 2023 15:46:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232637AbjBCUqx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Feb 2023 15:46:53 -0500
X-Greylist: delayed 380 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 03 Feb 2023 12:46:51 PST
Received: from out-93.mta1.migadu.com (out-93.mta1.migadu.com [IPv6:2001:41d0:203:375::5d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B2BA9B733
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Feb 2023 12:46:50 -0800 (PST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
        t=1675456833;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YSlUJW3lwKZ24XDgb3CDfUSp6GyVVQxOKuvbgvvqGyM=;
        b=Fwu+1cVAxCF/49yKUyszFpuL0Tew+wkBhIDbw/5SeSm/wptJFBxXfwxyIGrYFVEURTgKFi
        luF7iGzOwrZPwdNL+/jQf+lv8w2DdjFrk6BYmBAy5qmYLDEvtbrfhQJDgo+AnJqIKgWkRR
        OxamB971I1gZpNgL0BZqYUdsv0LpPAA=
From:   Henrik Grimler <henrik@grimler.se>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        alim.akhtar@samsung.com, m.szyprowski@samsung.com,
        virag.david003@gmail.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Cc:     Henrik Grimler <henrik@grimler.se>
Subject: [PATCH 2/2] arm64: dts: exynos: add mmc aliases
Date:   Fri,  3 Feb 2023 21:40:00 +0100
Message-Id: <20230203204000.14410-3-henrik@grimler.se>
In-Reply-To: <20230203204000.14410-1-henrik@grimler.se>
References: <20230203204000.14410-1-henrik@grimler.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add aliases for eMMC, SD card and WiFi where applicable, so that
assigned mmcblk numbers are always the same.

Signed-off-by: Henrik Grimler <henrik@grimler.se>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 2 ++
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts       | 2 ++
 arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts  | 1 +
 3 files changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index c895b70b3cec..b7113ad4b3a9 100644
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
index 686f0923a4a7..d433131cc902 100644
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
2.39.1

