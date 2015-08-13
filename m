From: Kukjin Kim <kgene@kernel.org>
Subject: [GIT PULL v2 3/5] Samsung SoC updates for v4.3
Date: Fri, 14 Aug 2015 03:51:40 +0900
Message-ID: <55CCE73C.3080404@kernel.org>
References: <55CCE517.2070003@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:57431 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752474AbbHMSvo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Aug 2015 14:51:44 -0400
In-Reply-To: <55CCE517.2070003@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5d7d4f0754:

  Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-soc

for you to fetch changes up to bdd2648e50508cbb2eb6d1c303e4d2d6d7505400:

  ARM: EXYNOS: switch to using generic cpufreq driver for exynos4x12
(2015-08-14 03:07:10 +0900)

----------------------------------------------------------------
Samsung SoC updates for v4.3

- add compatible string to exynos_cpufreq_matchs to switch for
  supporting generic cpufreq driver for exynos3250, 4210, 4212
  and 5250 SoCs in mach-exynos/

----------------------------------------------------------------
Bartlomiej Zolnierkiewicz (1):
      ARM: EXYNOS: switch to using generic cpufreq driver for exynos4x12

Chanwoo Choi (1):
      ARM: EXYNOS: Add exynos3250 compatible to use generic cpufreq driver

Thomas Abraham (1):
      ARM: EXYNOS: switch to using generic cpufreq driver for exynos5250

 arch/arm/mach-exynos/Kconfig  | 2 ++
 arch/arm/mach-exynos/exynos.c | 4 ++++
 2 files changed, 6 insertions(+)
