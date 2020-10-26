Return-Path: <SRS0=YeST=EB=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F64C2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 18:16:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E2E7223B0
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 18:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603736172;
	bh=IVXlBUpxQ4agibYhuw0CHkeH7WSC7dcxpSQU3O92NTc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Z+WLeFljDMdV+SduIGFKT28ZoAy+EwT6ECYGNhPMMfw0iRLHVs2lhA6dNpIuyQpC0
	 VGkcI6vJdqRS/sBhAQnG1cH+w1D3mumvCvE70kA7UHkIXlCcgexS6jS/Mf6AGcuuY2
	 ja5D25xv6JVfWp0y9/xoE/0rFPggJVNUpSvPIz4k=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1789428AbgJZSQL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Oct 2020 14:16:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:59778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1789422AbgJZSQK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 14:16:10 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3DE3F222C8;
        Mon, 26 Oct 2020 18:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603736170;
        bh=IVXlBUpxQ4agibYhuw0CHkeH7WSC7dcxpSQU3O92NTc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hc5872OP7xWzgn92s3rrYLflV3BzP50075PZ0rTqsimMjtHZa4RMJ3n563SFFs3bW
         c+iaJ55qMvzIRtG6G9Dj6J63BN1ThsLxtRfHyNcGdEok2sxqQQeB+zuOKxIoLBila8
         MuK92IlSElbwL2RajxPYAQJxvN5bOA+41SFZOi04=
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
Subject: [PATCH 10/12] arm64: dts: exynos: adjust node names to DT spec in Exynos5433 TM2
Date:   Mon, 26 Oct 2020 19:15:26 +0100
Message-Id: <20201026181528.163143-11-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026181528.163143-1-krzk@kernel.org>
References: <20201026181528.163143-1-krzk@kernel.org>
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
index 829fea23d4ab..143f45eaa953 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -94,7 +94,7 @@ i2c_max98504: i2c-gpio-0 {
 		#size-cells = <0>;
 		status = "okay";
 
-		max98504: max98504@31 {
+		max98504: codec@31 {
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
+	wm5110: codec@0 {
 		compatible = "wlf,wm5110";
 		reg = <0x0>;
 		spi-max-frequency = <20000000>;
-- 
2.25.1

