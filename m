Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3BDC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 31 Oct 2021 23:42:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0B8961051
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 31 Oct 2021 23:42:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbhJaXof (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 31 Oct 2021 19:44:35 -0400
Received: from aposti.net ([89.234.176.197]:36410 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229982AbhJaXoe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 31 Oct 2021 19:44:34 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 2/2] ARM: dts: exynos/i9100: Use interrupt for BCM4330 host wakeup
Date:   Sun, 31 Oct 2021 23:41:37 +0000
Message-Id: <20211031234137.87070-2-paul@crapouillou.net>
In-Reply-To: <20211031234137.87070-1-paul@crapouillou.net>
References: <20211031234137.87070-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Switch away from using the deprecated 'host-wakeup-gpios' property,
and use a 'host-wakeup' interrupt instead, as suggested by the binding
documentation.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/arm/boot/dts/exynos4210-i9100.dts | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4210-i9100.dts b/arch/arm/boot/dts/exynos4210-i9100.dts
index 5f5d9b135736..76b1017e05e8 100644
--- a/arch/arm/boot/dts/exynos4210-i9100.dts
+++ b/arch/arm/boot/dts/exynos4210-i9100.dts
@@ -829,7 +829,10 @@ bluetooth {
 		shutdown-gpios = <&gpl0 4 GPIO_ACTIVE_HIGH>;
 		reset-gpios = <&gpl1 0 GPIO_ACTIVE_LOW>;
 		device-wakeup-gpios = <&gpx3 1 GPIO_ACTIVE_HIGH>;
-		host-wakeup-gpios = <&gpx2 6 GPIO_ACTIVE_HIGH>;
+
+		interrupt-parent = <&gpx2>;
+		interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-names = "host-wakeup";
 	};
 };
 
-- 
2.33.0

