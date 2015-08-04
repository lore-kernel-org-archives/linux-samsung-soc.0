From: Kukjin Kim <kgene@kernel.org>
Subject: [GIT PULL 1/5] Samsung non-critical-fixes for v4.3
Date: Tue, 04 Aug 2015 16:28:21 +0900
Message-ID: <55C06995.2030600@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:36651 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755087AbbHDH2e (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Aug 2015 03:28:34 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Hi Arnd, Olof, Kevin,

Here is Samsung non-critical-fixes for v4.3.
Please pull.

Thanks,
Kukjin

The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5d7d4f0754:

  Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-non-critical-1

for you to fetch changes up to 2cc6b813579415c4f627b08a043079bdc5b87a33:

  ARM: EXYNOS: Use IOMEM_ERR_PTR when function returns iomem (2015-07-21
13:19:06 +0900)

----------------------------------------------------------------
Samsung non-critical fixes for v4.3

- fix sparse warning for returning iomem
- fix clock-frequency of display timing0 for exynos3250-rinato

----------------------------------------------------------------
Hyungwon Hwang (1):
      ARM: dts: fix clock-frequency of display timing0 for exynos3250-rinato

Krzysztof Kozlowski (1):
      ARM: EXYNOS: Use IOMEM_ERR_PTR when function returns iomem

 arch/arm/boot/dts/exynos3250-rinato.dts | 2 +-
 arch/arm/mach-exynos/platsmp.c          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
