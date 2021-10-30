Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9448EC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 30 Oct 2021 12:14:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 60B3661038
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 30 Oct 2021 12:14:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231875AbhJ3MQu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 30 Oct 2021 08:16:50 -0400
Received: from aposti.net ([89.234.176.197]:59702 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231830AbhJ3MQu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 30 Oct 2021 08:16:50 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] ARM: dts: exynos/i9100: Fix Bluetooth node
Date:   Sat, 30 Oct 2021 13:14:10 +0100
Message-Id: <20211030121410.65834-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The reset GPIO was marked active-high, which is against what's specified
in the documentation. Mark the reset GPIO as active-low. With this
change, Bluetooth can now be used on the i9100.

Also switch away from using the deprecated 'host-wakeup-gpios' property,
and use a 'host-wakeup' interrupt instead.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/arm/boot/dts/exynos4210-i9100.dts | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-i9100.dts b/arch/arm/boot/dts/exynos4210-i9100.dts
index 55922176807e..76b1017e05e8 100644
--- a/arch/arm/boot/dts/exynos4210-i9100.dts
+++ b/arch/arm/boot/dts/exynos4210-i9100.dts
@@ -827,9 +827,12 @@ bluetooth {
 		compatible = "brcm,bcm4330-bt";
 
 		shutdown-gpios = <&gpl0 4 GPIO_ACTIVE_HIGH>;
-		reset-gpios = <&gpl1 0 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpl1 0 GPIO_ACTIVE_LOW>;
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

