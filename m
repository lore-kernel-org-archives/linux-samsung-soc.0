Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931A9479890;
	Fri, 18 Sep 2026 21:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.119.170.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789767472; cv=none; b=JY+NdMAEB+ZQyZtlXwrQzbussPVdWcfkpUxcr0pBGazuIpgeHknpkR1a79qcU2lXVLGz4CYQyA4TQ/JP+dq2Ef3cF3Xqbjzi0xLXfBJ7HpzkSlJib9qLknGvCQ9nTDplPam5FTG8bPgV50sMxdDtJ0qQQxIeNek5IXy3/0sLHdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789767472; c=relaxed/simple;
	bh=GCoKTXUa2TwqPEb3JbcqHa0fdFjnPNd75LgVBDUqqmc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ed/tMRsK2wcTIiA0UuJpQrdnYG9wO92B9hC0WDhmVf34mnQvoUb6zVIGtc9SpaxvTO6mCYDOHd2wpBbDjf5eOBkb4nxN7ivb3Z1ErgYGEPpCoH46IJKDhfQxLhxmYIpOBUE7LwpattAQg+rSvnIfVN8LyyrFaTxDm3QU264i7CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; arc=none smtp.client-ip=185.119.170.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
From: Paul Cercueil <paul@crapouillou.net>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3] ARM: dts: samsung: exynos4210-*: Fix Bluetooth nodes
Date: Fri, 18 Sep 2026 23:29:23 +0200
Message-ID: <20260918212923.148505-1-paul@crapouillou.net>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The BCM4330 Bluetooth chip is capable of doing 4 Mbps over UART. The
Exynos 4210 however, can only do a maximum of 3 Mbps. Add this
information to the Bluetooth nodes using the 'max-speed' property.

This fixes extremely choppy audio when connected to external Bluetooth
speakers.

The BCM4330 is connected using CTS/RTS too, so add the 'uart-has-rtscts'
property. The driver does not seem to check for it but that still should
be there.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

    Apologies if you receive this email for the second time. I messed up
    on the previous one and forgot to Cc the lists. Since nothing
    changed, this is still v3.

    Cheers,
    -Paul

    Changes:
    
    V1 was: "ARM: dts: samsung: exynos4210-i9100: Fix Bluetooth node"
    
    -v2: Drop max-speed property. It's only supposed to be used in some
         cases, which don't apply here. As this was the "fix" for getting
         Bluetooth to work on my device, which will be applied to the
         driver instead, the Fixes: tag was removed.

    -v3: Re-introduce max-speed property :)
         Turns out the use case does indeed apply here.
	 Also update the other Exynos4210 based boards.

 arch/arm/boot/dts/samsung/exynos4210-i9100.dts          | 4 ++++
 arch/arm/boot/dts/samsung/exynos4210-trats.dts          | 5 +++++
 arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts | 5 +++++
 3 files changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
index 7da64500246c..ff369eac344f 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
@@ -868,9 +868,13 @@ &serial_0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&bt_en>, <&bt_res>, <&uart0_data>, <&uart0_fctl>;
 
+	uart-has-rtscts;
+
 	bluetooth {
 		compatible = "brcm,bcm4330-bt";
 
+		max-speed = <3000000>;
+
 		shutdown-gpios = <&gpl0 4 GPIO_ACTIVE_HIGH>;
 		reset-gpios = <&gpl1 0 GPIO_ACTIVE_LOW>;
 		device-wakeup-gpios = <&gpx3 1 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/samsung/exynos4210-trats.dts b/arch/arm/boot/dts/samsung/exynos4210-trats.dts
index eb286e25835e..c517f6d1d7c2 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-trats.dts
@@ -537,8 +537,13 @@ &serial_0 {
 	pinctrl-0 = <&uart0_data &uart0_fctl>;
 	pinctrl-names = "default";
 
+	uart-has-rtscts;
+
 	bluetooth {
 		compatible = "brcm,bcm4330-bt";
+
+		max-speed = <3000000>;
+
 		pinctrl-0 = <&bt_shutdown &bt_device_wakeup &bt_host_wakeup>;
 		pinctrl-names = "default";
 		shutdown-gpios = <&gpl1 0 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts b/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts
index 71df3843d8ba..9b345e16c44f 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts
@@ -630,8 +630,13 @@ &serial_0 {
 	pinctrl-0 = <&uart0_data &uart0_fctl>;
 	pinctrl-names = "default";
 
+	uart-has-rtscts;
+
 	bluetooth {
 		compatible = "brcm,bcm4330-bt";
+
+		max-speed = <3000000>;
+
 		pinctrl-0 = <&bt_shutdown &bt_device_wakeup &bt_host_wakeup>;
 		pinctrl-names = "default";
 		shutdown-gpios = <&gpe1 4 GPIO_ACTIVE_HIGH>;
-- 
2.53.0

