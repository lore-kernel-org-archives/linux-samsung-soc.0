Return-Path: <SRS0=zeks=EC=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B1BBC55179
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 17:10:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B7492224A
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 17:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603818657;
	bh=AmXxe09D28pqg2V98IaLqTye6L9HFV0evEfNHHgHpN4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=ia8n+AGSBLsxIaDjllx9hsmDoL//elv75EVnrZH4bfm3NkhzcvTDGmUrcJN/wLOvf
	 0OuRX2SB7p+gbxH/JMuN3vUFl6qFtAU5cW9gSfR9AW3zukTyyk3HVLuhR5DIsFPYd+
	 ugqZ9b6TRdnhZXgvJZs60aRdcfwjIb9wXu7cz4og=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1816860AbgJ0RKL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 27 Oct 2020 13:10:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:38270 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1816856AbgJ0RKK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Oct 2020 13:10:10 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0886622202;
        Tue, 27 Oct 2020 17:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603818609;
        bh=AmXxe09D28pqg2V98IaLqTye6L9HFV0evEfNHHgHpN4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D0veQN+sXUtiX1jFAj6K+cij0MSQk5VEbb16Mi9rWLGEDejNY/uvntdUC7aOZGHbz
         c52TVJGk/dkdGppveutVa3vzAknt7r+Z5nJij/34pzsBSyKBAbyLT/QE6g5O1laXai
         shSD0vumRWr3pS+E9ytzr6ZIKuzsEJiVfUYM2aDE=
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
Subject: [PATCH v2 05/12] ARM: dts: exynos: remove redundant status=okay in Exynos4412 boards
Date:   Tue, 27 Oct 2020 18:09:40 +0100
Message-Id: <20201027170947.132725-6-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201027170947.132725-1-krzk@kernel.org>
References: <20201027170947.132725-1-krzk@kernel.org>
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
index 912c78e9ce8c..c14e37dc3a9b 100644
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
index 62a8918c0ea5..97db6e4a39a7 100644
--- a/arch/arm/boot/dts/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/exynos4412-midas.dtsi
@@ -169,7 +169,6 @@ i2c_max77693: i2c-gpio-1 {
 		i2c-gpio,delay-us = <2>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		status = "okay";
 
 		pmic@66 {
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

