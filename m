Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF0EDC4361B
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Dec 2020 21:20:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C7AB23340
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Dec 2020 21:20:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404769AbgLJVTu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 10 Dec 2020 16:19:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:35450 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404774AbgLJVTp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 16:19:45 -0500
From:   Krzysztof Kozlowski <krzk@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Bongsu Jeon <bongsu.jeon@samsung.com>
Subject: [PATCH] arm64: dts: exynos: correct S3FWRN5 NFC interrupt trigger level on TM2
Date:   Thu, 10 Dec 2020 22:18:58 +0100
Message-Id: <20201210211859.215047-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The S3FWRN5 datasheet describe the interrupt line as rising edge.  The
current configuration as level high, could cause spurious interrupts.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 03486a8ffc67..174ea507192d 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -793,7 +793,7 @@ s3fwrn5: nfc@27 {
 		compatible = "samsung,s3fwrn5-i2c";
 		reg = <0x27>;
 		interrupt-parent = <&gpa1>;
-		interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <3 IRQ_TYPE_EDGE_RISING>;
 		en-gpios = <&gpf1 4 GPIO_ACTIVE_HIGH>;
 		wake-gpios = <&gpj0 2 GPIO_ACTIVE_HIGH>;
 	};
-- 
2.25.1

