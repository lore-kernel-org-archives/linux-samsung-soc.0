From: Kukjin Kim <kgene@kernel.org>
Subject: [GIT PULL 1/2] Samsung fixes-1 for v4.0
Date: Tue, 03 Mar 2015 03:56:16 +0900
Message-ID: <54F4B250.5080200@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:44893 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753037AbbCBS4X (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Mar 2015 13:56:23 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit c517d838eb7d07bbe9507871fab3931deccff539:

  Linux 4.0-rc1 (2015-02-22 18:21:14 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-fixes-1

for you to fetch changes up to 8a68de64e984cfc49ecc22ac18155a7fe6dbbfaf:

  ARM: EXYNOS: fix exynos randconfig build error (2015-03-03 03:37:57 +0900)

----------------------------------------------------------------
Samsung fixes for v4.0

- fix exynos randconfig build error with SMP=n
- fix wrong hwirq of RTC interrupt for exynos3250
- fix usage of LDREX and STREX after disabling cache coherency

----------------------------------------------------------------
Chanwoo Choi (1):
      ARM: EXYNOS: Fix wrong hwirq of RTC interrupt for Exynos3250 SoC

Krzysztof Kozlowski (1):
      ARM: EXYNOS: Don't use LDREX and STREX after disabling cache coherency

Russell King (1):
      ARM: EXYNOS: fix exynos randconfig build error

 arch/arm/mach-exynos/Kconfig   | 1 +
 arch/arm/mach-exynos/platsmp.c | 3 +--
 arch/arm/mach-exynos/suspend.c | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)
