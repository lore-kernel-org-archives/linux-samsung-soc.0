Return-Path: <SRS0=YeST=EB=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B4AC2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 18:15:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF7AD222D9
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 18:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603736155;
	bh=iUPRGRkHq11NMCqah6CRdqU19E38sZNL1slp2rVciGM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=GfuA6pRv9EImAmhBv5xfBSsxNLYZxYeZPxkZbhpREC1EfWZPZfNiagTAvCS4LhEuf
	 9HxTRzTph3Tkmu63SlQPzz5oMsaWSjmYFxZ+kiMRjgwrQdp4T0C/5AbJJ94uWcQRsw
	 e/pq41gcdNaKQIvaeo1GmUNBTZVJLxeuNVGNEss4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1789377AbgJZSPz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Oct 2020 14:15:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:59402 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1789372AbgJZSPy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 14:15:54 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6DE622224E;
        Mon, 26 Oct 2020 18:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603736154;
        bh=iUPRGRkHq11NMCqah6CRdqU19E38sZNL1slp2rVciGM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sTbcjYEHNHsScqSQMVqENU2HBi0L/f17iZUVk0gQu2tJpNQ1+7jqsFjgI3XwAgeDp
         Hu1tLDug5r6+Mw6KArGGVZgUQQWxHiQGI2yNqXfc6A9wzxymMFMG7QRjw6C/GjbSRJ
         Ngh4O1II26WMCLO45+7ftdsBe056G/s63kT83oTY=
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
Subject: [PATCH 05/12] ARM: dts: exynos: remove redundant status=okay in Exynos4412 boards
Date:   Mon, 26 Oct 2020 19:15:21 +0100
Message-Id: <20201026181528.163143-6-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026181528.163143-1-krzk@kernel.org>
References: <20201026181528.163143-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

New nodes are enabled by default, so status=okay is not needed for them.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Not actually tested on the HW, just checked the output DTB.
---
 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi | 1 -
 arch/arm/boot/dts/exynos4412-midas.dtsi     | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
index db91678f5648..64274b803aef 100644
--- a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
+++ b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
@@ -58,7 +58,6 @@ i2c_ak8975: i2c-gpio-0 {
 		i2c-gpio,delay-us = <2>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		status = "okay";
 
 		magnetometer@c {
 			compatible = "asahi-kasei,ak8975";
diff --git a/arch/arm/boot/dts/exynos4412-midas.dtsi b/arch/arm/boot/dts/exynos4412-midas.dtsi
index 52a4f6e6c7f2..72f8d8040f77 100644
--- a/arch/arm/boot/dts/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/exynos4412-midas.dtsi
@@ -169,7 +169,6 @@ i2c_max77693: i2c-gpio-1 {
 		i2c-gpio,delay-us = <2>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		status = "okay";
 
 		max77693@66 {
 			compatible = "maxim,max77693";
@@ -218,7 +217,6 @@ i2c_max77693_fuel: i2c-gpio-3 {
 		i2c-gpio,delay-us = <2>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		status = "okay";
 
 		fuel-gauge@36 {
 			compatible = "maxim,max17047";
@@ -262,7 +260,6 @@ i2c-mhl {
 
 		pinctrl-0 = <&i2c_mhl_bus>;
 		pinctrl-names = "default";
-		status = "okay";
 
 		sii9234: hdmi-bridge@39 {
 			compatible = "sil,sii9234";
-- 
2.25.1

