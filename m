Return-Path: <SRS0=+yz4=AN=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F7BC433E2
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  2 Jul 2020 15:52:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B35D520771
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  2 Jul 2020 15:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593705122;
	bh=91UaccKPU1QtxK6h8d6h4zwOXWXAoZFB2QOAYJp3WVk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=JQDd3g1qGILafThSflE5r/flx/fOZfnwN2CNoYmZuxyvC1UMbkmwbE944qTVv1iHU
	 jOvCT8LoOlKJw4n3vs32wOjJDE1R2GLEHq7MBtDefM2cDhielo5qRT+iu03gsi+9zM
	 rSjRWu5QXB9KPYeDNiNMFYGbs19ahwRQIOiacIBs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbgGBPwC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 2 Jul 2020 11:52:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:33452 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726120AbgGBPwB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Jul 2020 11:52:01 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D22B4208D5;
        Thu,  2 Jul 2020 15:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593705121;
        bh=91UaccKPU1QtxK6h8d6h4zwOXWXAoZFB2QOAYJp3WVk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=x9whcobIRAebC9Rg1qiIYgcGqVhXTAiDIu8pZUTW5Ppv8p3Y2IamQ7qqCNePuKfOx
         YhZBTxUSka0KNwZ9tnvp6msjNCKkbF96tRVcqtOOeaTXZiBQmalBBLbwbwwXTLO0dr
         kWgXtPF4rBzE/58W7CkXY+UK1hwZ5cnNIDAPiqlY=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v2 2/8] arm64: dts: exynos: Describe PWM interrupts on Exynos7
Date:   Thu,  2 Jul 2020 17:51:43 +0200
Message-Id: <20200702155149.12854-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200702155149.12854-1-krzk@kernel.org>
References: <20200702155149.12854-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add interrupts property to PWM node on Exynos7 to describe the hardware
fully.  No functional change as the interrupts are not used by drivers.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Correct the interrupts, change message.

Not tested
---
 arch/arm64/boot/dts/exynos/exynos7.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index f590891efe25..709742b98c9c 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -581,6 +581,11 @@
 		pwm: pwm@136c0000 {
 			compatible = "samsung,exynos4210-pwm";
 			reg = <0x136c0000 0x100>;
+			interrupts = <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH>;
 			samsung,pwm-outputs = <0>, <1>, <2>, <3>;
 			#pwm-cells = <3>;
 			clocks = <&clock_peric0 PCLK_PWM>;
-- 
2.17.1

