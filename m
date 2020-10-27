Return-Path: <SRS0=zeks=EC=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E96C55179
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 17:10:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 829492224A
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 17:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603818633;
	bh=SnjcMyIpcykjHGSAujcrYKojlY3nNVADfjMtkuny3UE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=NgJbNkSvZRD+PWJ78ANbQsBPTFABgxSxwlOIqiOiCGbscdKijxxRlJVc7c+WDr7Qa
	 762GnGNKAGuE5mgQ6ipXdaibii7yigCfevA1ZU/UHZnQlNlsgNq+1LERwRNxRTm8Jz
	 kTk+H7sntlTvdcFDjo1EUql+6N2ISbU5dMMgo/xg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1816921AbgJ0RKc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 27 Oct 2020 13:10:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:38614 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1816899AbgJ0RK1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Oct 2020 13:10:27 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D2D0221D7B;
        Tue, 27 Oct 2020 17:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603818626;
        bh=SnjcMyIpcykjHGSAujcrYKojlY3nNVADfjMtkuny3UE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Yr6U6tjzq3+EsgFadTumw22rQnfXc/LSAwvC0QafIV9a4R/+5L8bXIky5znCkl+3y
         WwVCOmTBbfNJOZmVdUfuWkbXT6ps85RvlODcHPdToTqyWFmJV6ei0GYxuoYvOG2ost
         jFCm6I7NWFnWyo2brp7VKTRiohfW/59tYkn7Fclc=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v2 10/12] arm64: dts: exynos: adjust node names to DT spec in Exynos5433 TM2
Date:   Tue, 27 Oct 2020 18:09:45 +0100
Message-Id: <20201027170947.132725-11-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201027170947.132725-1-krzk@kernel.org>
References: <20201027170947.132725-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Devicetree specification expects device node names to have a generic
name, representing the class of a device.  Also the convention for node
names is to use hyphens, not underscores.

No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 829fea23d4ab..01ab886fd3e9 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -94,7 +94,7 @@ i2c_max98504: i2c-gpio-0 {
 		#size-cells = <0>;
 		status = "okay";
 
-		max98504: max98504@31 {
+		max98504: amplifier@31 {
 			compatible = "maxim,max98504";
 			reg = <0x31>;
 			maxim,rx-path = <1>;
@@ -386,7 +386,7 @@ &hsi2c_0 {
 	status = "okay";
 	clock-frequency = <2500000>;
 
-	s2mps13-pmic@66 {
+	pmic@66 {
 		compatible = "samsung,s2mps13-pmic";
 		interrupt-parent = <&gpa0>;
 		interrupts = <7 IRQ_TYPE_NONE>;
@@ -817,7 +817,7 @@ &hsi2c_7 {
 	status = "okay";
 	clock-frequency = <1000000>;
 
-	sii8620@39 {
+	bridge@39 {
 		reg = <0x39>;
 		compatible = "sil,sii8620";
 		cvcc10-supply = <&ldo36_reg>;
@@ -852,7 +852,7 @@ mhl_to_musb_con: endpoint {
 &hsi2c_8 {
 	status = "okay";
 
-	max77843@66 {
+	pmic@66 {
 		compatible = "maxim,max77843";
 		interrupt-parent = <&gpa1>;
 		interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
@@ -1231,7 +1231,7 @@ &spi_1 {
 	cs-gpios = <&gpd6 3 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 
-	wm5110: wm5110-codec@0 {
+	wm5110: audio-codec@0 {
 		compatible = "wlf,wm5110";
 		reg = <0x0>;
 		spi-max-frequency = <20000000>;
-- 
2.25.1

