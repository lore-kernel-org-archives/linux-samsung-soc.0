From: Kukjin Kim <kgene@kernel.org>
Subject: [GIT PULL v2 4/5] Samsung cpufreq driver updates for v4.3
Date: Fri, 14 Aug 2015 03:52:49 +0900
Message-ID: <55CCE781.1090007@kernel.org>
References: <55CCE517.2070003@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:57528 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932121AbbHMSwz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Aug 2015 14:52:55 -0400
In-Reply-To: <55CCE517.2070003@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5d7d4f0754:

  Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-late-cpufreq-driver

for you to fetch changes up to 5e3863a74fb70d6a432504ba2fa16a998cd3736b:

  cpufreq: exynos: Remove unselectable rule for arm-exynos-cpufreq.o
(2015-08-14 02:36:33 +0900)

----------------------------------------------------------------
Samsung cpufreq driver updates for v4.3

- remove exynos4 SoCs and exynos5250 specific cpufreq driver support
  and unselectable rule for arm-exynos-cpufreq.o because of supporting
  generic cpufreq driver for the exynos SoCs

* Note this is depending on tags/samsung-clk-driver, tags/samsung-soc
  and tags/samsung-late-dt

----------------------------------------------------------------
Bartlomiej Zolnierkiewicz (2):
      cpufreq: exynos: remove exynos5250 specific cpufreq driver support
      cpufreq: exynos: remove Exynos4x12 specific cpufreq driver support

Jonas Rabenstein (1):
      cpufreq: exynos: Remove unselectable rule for arm-exynos-cpufreq.o

 drivers/cpufreq/Kconfig.arm          |  49 --------
 drivers/cpufreq/Makefile             |   4 -
 drivers/cpufreq/exynos-cpufreq.c     | 237
-----------------------------------
 drivers/cpufreq/exynos-cpufreq.h     |  89 -------------
 drivers/cpufreq/exynos4x12-cpufreq.c | 236
----------------------------------
 drivers/cpufreq/exynos5250-cpufreq.c | 210 -------------------------------
 6 files changed, 825 deletions(-)
 delete mode 100644 drivers/cpufreq/exynos-cpufreq.c
 delete mode 100644 drivers/cpufreq/exynos-cpufreq.h
 delete mode 100644 drivers/cpufreq/exynos4x12-cpufreq.c
 delete mode 100644 drivers/cpufreq/exynos5250-cpufreq.c
