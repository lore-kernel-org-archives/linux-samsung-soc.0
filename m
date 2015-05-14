From: Kukjin Kim <kgene@kernel.org>
Subject: [GIT PULL] Samsung 2nd fixes for v4.1
Date: Thu, 14 May 2015 12:10:37 +0900
Message-ID: <5554122D.6090601@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:54209 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934636AbbENDKo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 May 2015 23:10:44 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi,

Here is Samsung 2nd fixes for v4.1 and mostly it is for S2R(Suspend to
RAM). Please pull and if any problems, kindly let me know. Thanks!

Note that it is based on v4.1-rc3 because keep-power-in-suspend related
changes have been applied in v4.1-rc3.

- Kukjin


The following changes since commit 030bbdbf4c833bc69f502eae58498bc5572db736:

  Linux 4.1-rc3 (2015-05-10 15:12:29 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-fixes-2

for you to fetch changes up to c1f0ecff492ea7c804fe543267f673eaac12259c:

  ARM: EXYNOS: Use of_machine_is_compatible instead of soc_is_exynos4
(2015-05-14 11:43:59 +0900)

----------------------------------------------------------------
Samsung 2nd fixes for v4.1

- fix second S2R on exynos4412 based Trats2, Odroid U3 boards which
  happened after enabling L2$ and caused by commit 13cfa6c4f7fa ("ARM:
  EXYNOS: Fix CPU idle clock down after CPU off")
  And replace the soc_is_exynosxxx() macro with of_compatible_xxx

- fix dereference of ERR_PTR of of_genpd_get_from_provider()

- fix suspend problem on old DT machines to skip the initialization
  suspend and caused by commit 8b283c025443 ("ARM: exynos4/5: convert
  pmu wakeup to stacked domains")

- add keep-power-in-suspend for Peach Boards to support S2R and has
  been missed in previous pull-request for fixes

----------------------------------------------------------------
Javier Martinez Canillas (1):
      ARM: dts: Add keep-power-in-suspend to WiFi SDIO node for Peach Boards

Julien Grall (1):
      ARM: EXYNOS: Don't try to initialize suspend on old DT

Krzysztof Kozlowski (3):
      ARM: EXYNOS: Fix dereference of ERR_PTR returned by
of_genpd_get_from_provider
      ARM: EXYNOS: Fix failed second suspend on Exynos4
      ARM: EXYNOS: Use of_machine_is_compatible instead of soc_is_exynos4

 arch/arm/boot/dts/exynos5420-peach-pit.dts |  1 +
 arch/arm/boot/dts/exynos5800-peach-pi.dts  |  1 +
 arch/arm/mach-exynos/common.h              |  2 ++
 arch/arm/mach-exynos/exynos.c              | 27 +++++++++++++++++++++
 arch/arm/mach-exynos/platsmp.c             | 39
++----------------------------
 arch/arm/mach-exynos/pm_domains.c          |  4 +--
 arch/arm/mach-exynos/suspend.c             |  7 +++++-
 7 files changed, 41 insertions(+), 40 deletions(-)
