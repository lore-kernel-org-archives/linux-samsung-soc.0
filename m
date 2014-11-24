From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH RESEND 0/7] Enable HDMI support on Exynos platforms
Date: Mon, 24 Nov 2014 08:30:49 +0100
Message-ID: <1416814256-24288-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:46826 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752532AbaKXHbm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Nov 2014 02:31:42 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NFJ00L2191CHL80@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 24 Nov 2014 07:34:24 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>

Hi Kukjin,

In this resend I have added missing Signed-Offs, thanks for pointing it out.

This set of patches enables HDMI support for two Exynos based platforms:
UniversalC210 and Odroid.
Beside DTS changes patchset adds parent domain support for Exynos PM domains
and small but critical change in mixer clock. For details see individual patches.

The patchset is based on v3.18-rc4.

Regards
Andrzej


Andrzej Hajda (2):
  clk: samsung: exynos4: set parent of sclk_hdmiphy to hdmi
  ARM: dts: exynos5250: add display power domain

Marek Szyprowski (4):
  ARM: Exynos: add support for sub-power domains
  ARM: dts: exynos4: add hdmi related nodes
  ARM: dts: exynos4: add dependency between TV and LCD0 power domains
  ARM: dts: exynos4412-odroid: enable hdmi support

Tomasz Stanislawski (1):
  ARM: dts: exynos4210-universal_c210: enable hdmi support

 .../bindings/arm/exynos/power_domain.txt           |  2 +
 arch/arm/boot/dts/exynos4.dtsi                     | 41 ++++++++++++++++
 arch/arm/boot/dts/exynos4210-universal_c210.dts    | 57 ++++++++++++++++++++++
 arch/arm/boot/dts/exynos4210.dtsi                  |  8 +++
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi    | 44 +++++++++++++++++
 arch/arm/boot/dts/exynos4x12.dtsi                  | 11 +++++
 arch/arm/boot/dts/exynos5250.dtsi                  |  9 ++++
 arch/arm/mach-exynos/pm_domains.c                  |  9 +++-
 drivers/clk/samsung/clk-exynos4.c                  |  2 +-
 9 files changed, 181 insertions(+), 2 deletions(-)

-- 
1.9.1
