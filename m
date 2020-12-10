Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDFC1C4167B
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Dec 2020 21:38:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B09F523EB4
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Dec 2020 21:38:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393988AbgLJVit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 10 Dec 2020 16:38:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:41084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404821AbgLJVaC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 16:30:02 -0500
From:   Krzysztof Kozlowski <krzk@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 4/9] ARM: dts: exynos: correct PMIC interrupt trigger level on Spring
Date:   Thu, 10 Dec 2020 22:28:58 +0100
Message-Id: <20201210212903.216728-4-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201210212903.216728-1-krzk@kernel.org>
References: <20201210212903.216728-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Samsung PMIC datasheets describe the interrupt line as active low
with a requirement of acknowledge from the CPU.  Without specifying the
interrupt type in Devicetree, kernel might apply some fixed
configuration, not necessarily working for this hardware.

Fixes: 53dd4138bb0a ("ARM: dts: Add exynos5250-spring device tree")
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5250-spring.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250-spring.dts b/arch/arm/boot/dts/exynos5250-spring.dts
index 9d2baea62d0d..fba1462b19df 100644
--- a/arch/arm/boot/dts/exynos5250-spring.dts
+++ b/arch/arm/boot/dts/exynos5250-spring.dts
@@ -109,7 +109,7 @@ pmic@66 {
 		compatible = "samsung,s5m8767-pmic";
 		reg = <0x66>;
 		interrupt-parent = <&gpx3>;
-		interrupts = <2 IRQ_TYPE_NONE>;
+		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&s5m8767_irq &s5m8767_dvs &s5m8767_ds>;
 		wakeup-source;
-- 
2.25.1

