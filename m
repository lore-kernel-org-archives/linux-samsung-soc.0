Return-Path: <SRS0=5zmB=AK=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65920C433E1
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 29 Jun 2020 19:34:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4041A206F1
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 29 Jun 2020 19:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593459260;
	bh=Qg01wBxePLOsA49sRw8sCHtBiCZMuG8bJXoshpWkoeQ=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=nTviISXsOV7vw5bxfh8oba/xR0JpJ7rFpDXurJCoJH1alUcvM1xcoLRGkBcnRrHEj
	 mifd/xA3+/YNzoqEwq+rTmr58Gh8jkIfz9btzKR9plF9Pz1N5mF6YH/J78jjfp6NSU
	 a18wCxWj76UaBGmHh7o9atCPU2BIV706dI+8Kvqo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbgF2TeO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 29 Jun 2020 15:34:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:42790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733191AbgF2Tdr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 29 Jun 2020 15:33:47 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DAD0620702;
        Mon, 29 Jun 2020 19:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593459227;
        bh=Qg01wBxePLOsA49sRw8sCHtBiCZMuG8bJXoshpWkoeQ=;
        h=From:To:Cc:Subject:Date:From;
        b=qDvFpcrHO2Wdrze8rG0x3E2k2AaIKn7UF6xZ0Sw4Pzh+wWRe4iobuBvnq5X/JRKqa
         +sxYnMOogg7RXJO5cGTO7MmW+eT7D4C2uFHF5sxTswBUROj3MkraoV8bgyMpM4subd
         Dke/mIxIs886657LdCx84Wubtq5cUhPPD1Mm2PWo=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH 1/3] ARM: dts: exynos: Fix missing empty reg/ranges property regulators on Trats
Date:   Mon, 29 Jun 2020 21:33:36 +0200
Message-Id: <20200629193338.29540-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Remove the simple-bus compatible from a regulators node because its
children do not have any unit addresses.  This fixes DTC warning:

    Warning (simple_bus_reg): /regulators/regulator-0: missing or empty reg/ranges property

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos4210-trats.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index 3d791db6095c..cec413ee4490 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -31,8 +31,6 @@
 	};
 
 	regulators {
-		compatible = "simple-bus";
-
 		vemmc_reg: regulator-0 {
 			compatible = "regulator-fixed";
 			regulator-name = "VMEM_VDD_2.8V";
-- 
2.17.1

