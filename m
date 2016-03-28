From: Adel Belhouane <bugs.a.b@free.fr>
Subject: [PATCH 0/1] ARM: dts: exynos: Add timer node for exynos5420
Date: Mon, 28 Mar 2016 16:08:08 +0200
Message-ID: <cover.1459167385.git.bugs.a.b@free.fr>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp4-g21.free.fr ([212.27.42.4]:21617 "EHLO smtp4-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752173AbcC1OIT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Mar 2016 10:08:19 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Adel Belhouane <bugs.a.b@free.fr>

On ODROID XU3, after having all the Exynos5422 cores detected as
started in HYP mode with a patch[1], KVM still won't work because it
needs the Generic Timer Architecture. It's defined in other exynos5
models (5250, 5440) DTs,  but not the 542x/5800, so I just added it.

Actually this timer was defined in ODROID Hardkernel's repository [2],
so I took its clock-frequency value too (which isn't provided by
firmware/U-Boot).

KVM now works on ODROID XU3 with kernel v4.5 plus these changes.

regards,
Adel Belhouane.

[1] from Brian Kim:
https://gist.github.com/bkrepo/6f4eea33be133ad306e3

[2]
https://github.com/hardkernel/linux/blob/odroidxu3-3.10.y/arch/arm/boot/dts/exynos5422-odroidxu3.dts

Adel Belhouane (1):
  ARM: dts: exynos: Add timer node for exynos5420

 arch/arm/boot/dts/exynos5420.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
2.1.4
