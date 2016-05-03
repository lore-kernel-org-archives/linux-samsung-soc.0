From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFC PATCH 09/12] ARM: dts: exynos: Use phandle to get parent node in exynos5250-snow
Date: Tue,  3 May 2016 19:52:26 +0200
Message-ID: <1462297949-13824-10-git-send-email-krzk@kernel.org>
References: <1462297949-13824-1-git-send-email-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:48517 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933771AbcECRxd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 May 2016 13:53:33 -0400
In-Reply-To: <1462297949-13824-1-git-send-email-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>

The i2c-arbitrator node in exynos5250-snow-common used absolute path to
reference other node (the i2c parent). Use phandle instead, because the
depth of the other node may be changed (like moving it under 'soc'
node).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5250-snow-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250-snow-common.dtsi b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
index ddfe1f558c10..419d59da1751 100644
--- a/arch/arm/boot/dts/exynos5250-snow-common.dtsi
+++ b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
@@ -61,7 +61,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		i2c-parent = <&{/i2c@12CA0000}>;
+		i2c-parent = <&i2c_4>;
 
 		our-claim-gpio = <&gpf0 3 GPIO_ACTIVE_LOW>;
 		their-claim-gpios = <&gpe0 4 GPIO_ACTIVE_LOW>;
-- 
2.5.0
