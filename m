Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA7AC64EC6
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Feb 2023 20:46:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232593AbjBCUqz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 3 Feb 2023 15:46:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232755AbjBCUqx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Feb 2023 15:46:53 -0500
Received: from out-104.mta1.migadu.com (out-104.mta1.migadu.com [95.215.58.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B78869D052
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Feb 2023 12:46:50 -0800 (PST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
        t=1675456830;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RUkDWn+Iwl+u4RZAdasEeGOVl9/XR1YbpJwm+77E16E=;
        b=jJlBz//aUa1u40cS7EMk3lb7MSryr1TAiJvnDRooGw2vp4OYWme4MQGzeUSI7qDFrwh4cl
        TaRPSmcoRwFc27qtpitioNoFiqamsJZZE66hzQKvsDA4y/Tq6hr93hW/u+qjlCewdtAsC5
        Oo7CuInO77Q0+3ovQnNwYGG4Qlhzr2A=
From:   Henrik Grimler <henrik@grimler.se>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        alim.akhtar@samsung.com, m.szyprowski@samsung.com,
        virag.david003@gmail.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Cc:     Henrik Grimler <henrik@grimler.se>
Subject: [PATCH 1/2] arm64: dts: exynos: drop mshc aliases
Date:   Fri,  3 Feb 2023 21:39:59 +0100
Message-Id: <20230203204000.14410-2-henrik@grimler.se>
In-Reply-To: <20230203204000.14410-1-henrik@grimler.se>
References: <20230203204000.14410-1-henrik@grimler.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

They are no longer needed after commit a13e8ef6008d ("mmc: dw_mmc:
exynos: use common_caps").

Signed-off-by: Henrik Grimler <henrik@grimler.se>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 2 --
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts       | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index f54f30633417..c895b70b3cec 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -40,8 +40,6 @@ aliases {
 		spi2 = &spi_2;
 		spi3 = &spi_3;
 		spi4 = &spi_4;
-		mshc0 = &mshc_0;
-		mshc2 = &mshc_2;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
index f3f4a6ab4b49..686f0923a4a7 100644
--- a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
@@ -18,8 +18,6 @@ / {
 
 	aliases {
 		serial0 = &serial_2;
-		mshc0 = &mmc_0;
-		mshc2 = &mmc_2;
 	};
 
 	chosen {
-- 
2.39.1

