From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL/PATCH for v4.13] ARM: dts: exynos: add needs-hpd for Odroid-XU3/4
Date: Wed, 23 Aug 2017 18:24:50 +0200
Message-ID: <20170823162450.4981-1-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:40506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932107AbdHWQZW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 23 Aug 2017 12:25:22 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-samsung-soc@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Hans Verkuil <hans.verkuil@cisco.com>, Krzysztof Kozlowski <krzk@kernel.org>

From: Hans Verkuil <hverkuil@xs4all.nl>

CEC support was added for Exynos5 in 4.13, but for the Odroids we need to set
'needs-hpd' as well since CEC is disabled when there is no HDMI hotplug signal,
just as for the exynos4 Odroid-U3.

This is due to the level-shifter that is disabled when there is no HPD, thus
blocking the CEC signal as well. Same close-but-no-cigar board design as the
Odroid-U3.

Tested with my Odroid XU4.

Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
Hi Arnd, Olof,

One fix for this cycle (v4.13) for feature (HDMI CEC) added in v4.13. Patch
is necessary for this feature to work on Odroid XU3/XU4 family.

Best regards,
Krzysztof
---
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index f92f95741207..a183b56283f8 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -266,6 +266,7 @@
 
 &hdmicec {
 	status = "okay";
+	needs-hpd;
 };
 
 &hsi2c_4 {
-- 
2.11.0
