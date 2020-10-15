Return-Path: <SRS0=zMHd=DW=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DBE0C433DF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 15 Oct 2020 18:21:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2A8622254
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 15 Oct 2020 18:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602786067;
	bh=prRaB+7AjN2gAvby90L5eUH8Zn9V0+Co19lYHlVxx28=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=dXP+clNl+6IZmhJM/E5jSdiRsO8ygP+phoZJVa00BPOToMpL4w4Rvl4ZgpS/fGMn5
	 zYiA0dxUam/nI/Qxy5RMDqPasUw8oA6YP6+DnfpYVlzK4h5tEBMdiNW+E1PWM8DWmd
	 /NOegAlgZwgtwzAFSGNy9bdYoa349BLqcmPuDXXQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389665AbgJOSVC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 15 Oct 2020 14:21:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:56436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389518AbgJOSVC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 15 Oct 2020 14:21:02 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A8B6D20760;
        Thu, 15 Oct 2020 18:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602786061;
        bh=prRaB+7AjN2gAvby90L5eUH8Zn9V0+Co19lYHlVxx28=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Kue+SG57pfPc/OBkT/rVRMbHkr+cUOB06vrSTF24w96qPqj54Ea3ycLHu57n2R2G7
         r3j0Sx/emywfPzw8pQp7tO6HzVcpaIlRM2znLTZE9C+pk6dgdBJ74Tt2GJExWs6/81
         wJXa73guKUBuk6MhCdNk3Ad9JMpw5H9iEJ8hhBpE=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Gabriel Ribba Esteva <gabriel.ribbae@gmail.com>,
        stable@vger.kernel.org
Subject: [PATCH 3/4] ARM: dts: exynos: fix USB 3.0 pins supply being turned off on Odroid XU
Date:   Thu, 15 Oct 2020 20:20:43 +0200
Message-Id: <20201015182044.480562-3-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201015182044.480562-1-krzk@kernel.org>
References: <20201015182044.480562-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Odroid XU LDO12 and LDO15 supplies the power to USB 3.0 blocks but
the GPK GPIO pins are supplied by LDO7 (VDDQ_LCD).  LDO7 also supplies
GPJ GPIO pins.

The Exynos pinctrl driver does not take any supplies, so to have entire
GPIO block always available, make the regulator always on.

Fixes: 88644b4c750b ("ARM: dts: exynos: Configure PWM, usb3503, PMIC and thermal on Odroid XU board")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5410-odroidxu.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5410-odroidxu.dts b/arch/arm/boot/dts/exynos5410-odroidxu.dts
index 353eb6ef3a04..6cc4d4653f84 100644
--- a/arch/arm/boot/dts/exynos5410-odroidxu.dts
+++ b/arch/arm/boot/dts/exynos5410-odroidxu.dts
@@ -327,6 +327,8 @@ ldo7_reg: LDO7 {
 				regulator-name = "vddq_lcd";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
+				/* Supplies also GPK and GPJ */
+				regulator-always-on;
 			};
 
 			ldo8_reg: LDO8 {
-- 
2.25.1

