Return-Path: <SRS0=YeST=EB=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 740F0C2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 18:16:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31C6B22281
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 18:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603736165;
	bh=rO8NFLyP8aZlOi22WHCLomxDqjHsPhc6VKX0CQhUSts=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=XFvd8/GzVBmrnRsFk718QKt/9MQ+tPh2X8g5Ws2VwpDSaU5PlblXhmv07BrCdfIFj
	 5ZwjoCLp/zKyspBnJtLnIxcy/PaEmmvC9DG+hHCC8A+36iImsbhtpIvUCxFk3vCXyc
	 BRoInQrJ4fLeJ3eiZ7bi6VEMWiCD3Pu1t+riATrc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728181AbgJZSQD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Oct 2020 14:16:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:59554 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1789393AbgJZSQA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 14:16:00 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6C5B822281;
        Mon, 26 Oct 2020 18:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603736160;
        bh=rO8NFLyP8aZlOi22WHCLomxDqjHsPhc6VKX0CQhUSts=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AOzdd0EZFRWs1LwJ6vncT86dUbcwg1gVFmJzEdLTLdtLbsAT0PbAtT0ZeJE7AaW70
         uCk0FLAqM2uX3K6qbnSO/QYGwdfSIuOFeJc8lsIBuEu67IdLIOcZk/G9pau5l/TylB
         D9qHBEVMoavqDXVZFl1PCBuKOo4S9V9nuouzXCf8=
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
Subject: [PATCH 07/12] ARM: dts: exynos: adjust node names to DT spec in Odroid XU
Date:   Mon, 26 Oct 2020 19:15:23 +0100
Message-Id: <20201026181528.163143-8-krzk@kernel.org>
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
 arch/arm/boot/dts/exynos5410-odroidxu.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5410-odroidxu.dts b/arch/arm/boot/dts/exynos5410-odroidxu.dts
index 75b4150c26d7..4a9e5b289580 100644
--- a/arch/arm/boot/dts/exynos5410-odroidxu.dts
+++ b/arch/arm/boot/dts/exynos5410-odroidxu.dts
@@ -498,7 +498,7 @@ ldo35_reg: LDO35 {
 
 &i2c_1 {
 	status = "okay";
-	max98090: max98090@10 {
+	max98090: codec@10 {
 		compatible = "maxim,max98090";
 		reg = <0x10>;
 		interrupt-parent = <&gpj3>;
-- 
2.25.1

