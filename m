Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9878DC54E94
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Jan 2023 10:40:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236949AbjAZKkE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 Jan 2023 05:40:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236897AbjAZKkB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 05:40:01 -0500
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 753CF5C0C4;
        Thu, 26 Jan 2023 02:39:59 -0800 (PST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
        t=1674729597;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dGGbMK+Aa92T10Lg4IqZHWu06h+GE9mEep+IJk+dkKA=;
        b=k4X/C0qU0iTicPPJJh8eiwk4D0yAM4mjUy8dmC1XF2UYKa0G7I+MHtclUP2cuKNOXhp+7Z
        TJsURaqGBKQrpLH8Pgj187TpxQzCUnOgvsvZLjSznmSTeY5X6Z0LEe1DBqEzhxZ280Plbz
        agQoS9YmIeyLoXrI3rByxBZL0ZU5syA=
From:   Henrik Grimler <henrik@grimler.se>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        alim.akhtar@samsung.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Cc:     Henrik Grimler <henrik@grimler.se>
Subject: [PATCH 2/6] ARM: dts: exynos: add mmc aliases for Exynos4210
Date:   Thu, 26 Jan 2023 11:38:24 +0100
Message-Id: <20230126103828.481441-3-henrik@grimler.se>
In-Reply-To: <20230126103828.481441-1-henrik@grimler.se>
References: <20230126103828.481441-1-henrik@grimler.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

So that mmcblk numbering is fixed for the eMMC and sdcard, no matter
if a storage device is attached or not.

Signed-off-by: Henrik Grimler <henrik@grimler.se>
---
 arch/arm/boot/dts/exynos4210.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index 267eff6c97d6..403c28c120f9 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -23,6 +23,10 @@ / {
 	compatible = "samsung,exynos4210", "samsung,exynos4";
 
 	aliases {
+		mmc0 = &sdhci_0;
+		mmc1 = &sdhci_1;
+		mmc2 = &sdhci_2;
+		mmc3 = &sdhci_3;
 		pinctrl0 = &pinctrl_0;
 		pinctrl1 = &pinctrl_1;
 		pinctrl2 = &pinctrl_2;
-- 
2.39.1

