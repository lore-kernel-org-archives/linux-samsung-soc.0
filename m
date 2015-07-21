From: Kukjin Kim <kgene@kernel.org>
Subject: [GIT PULL] Samsung 1st fixes for v4.2
Date: Tue, 21 Jul 2015 12:40:04 +0900
Message-ID: <55ADBF14.30304@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:48361 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752590AbbGUDkS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Jul 2015 23:40:18 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Hi,

Please pull samsung fixes for v4.2.

Thanks,
Kukjin

The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5d7d4f0754:

  Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-fixes-1

for you to fetch changes up to 300bde79f3d86b1af6fcde7b7b2439ecffccbff4:

  ARM: dts: add CPU OPP and regulator supply property for exynos4210
(2015-07-21 12:32:29 +0900)

----------------------------------------------------------------
Samsung fixes for v4.2

>From Krzysztof Kozlowski:
1. Fix exynos3250 MIPI DSI display and MIPI CSIS-2 camera sensorx
   after adding support for PMU regmap in exynos-video-mipi driver
   (issue introduced in v4.0).
2. Bring back cpufreq for exynos4210 after incomplete switch to
   cpufreq-dt driver in 4.2 merge window. The necessary DT changes
   for exynos4210 cpufreq was not applied to the same tree as rest
   of patchset because of multiple conflicts between clk and arm-soc
   trees. Unfortunately without the change the exynos4210 boards
   loose cpufreq feature.

----------------------------------------------------------------
Beata Michalska (1):
      ARM: dts: Update video-phy node with syscon phandle for exynos3250

Thomas Abraham (1):
      ARM: dts: add CPU OPP and regulator supply property for exynos4210

 arch/arm/boot/dts/exynos3250.dtsi               |  2 +-
 arch/arm/boot/dts/exynos4210-origen.dts         |  4 ++++
 arch/arm/boot/dts/exynos4210-trats.dts          |  4 ++++
 arch/arm/boot/dts/exynos4210-universal_c210.dts |  4 ++++
 arch/arm/boot/dts/exynos4210.dtsi               | 12 ++++++++++++
 5 files changed, 25 insertions(+), 1 deletion(-)
