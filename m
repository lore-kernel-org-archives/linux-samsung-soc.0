From: Yadwinder Singh Brar <yadi.brar@samsung.com>
Subject: [RFC 0/4] Add basic support for ASV
Date: Wed, 11 Sep 2013 16:44:04 +0530
Message-ID: <1378898048-25205-1-git-send-email-yadi.brar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:26170 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752211Ab3IKLOu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Sep 2013 07:14:50 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Viresh Kumar <viresh.kumar@linaro.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>

This series is to add basic common infrastructure for ASV.
 Basically ASV is a technique used on samsung SoCs, which provides the
recommended supply voltage for dvfs of arm, mif etc. For a given operating
frequency, the voltage is recommended based on SoC's ASV group.
ASV group gets fussed on SoCs during process of mass production.

This series includes:
 - basic common infrastructue for ASV. It provides common APIs for user drivers
like cpufreq & devfreq and and an interface for SoC specific drivers to
register ASV members(instances)
 - a common platform driver to register ASV members for exynos SoCs
 - an example providing minimal support (only for ARM ASV) for exynos5250 chips

Its just basic skelton which I wanted to get it reviewed or discussed in
early stage, before going ahead on further development based on it.
 Presently example is based on static ASV table provided in SoC specific file,
which I expects to go into DT. But exactly how and where needs to be discussed,
may be in next revisions once we get through the basic skelton.
 Also the location of driver in kernel may also seem odd to someone and
many more things :).

Looking for your valuable reviews and suggestions.

Thanks

Yadwinder Singh Brar (4):
  power: asv: Add common ASV support for samsung SoCs
  power: asv: Add a common asv driver for exynos SoCs.
  power: asv: Add support for exynos5250
  arm: exynos5: Register static platform device for ASV.

 arch/arm/mach-exynos/mach-exynos5-dt.c   |    3 +
 drivers/power/Kconfig                    |    1 +
 drivers/power/Makefile                   |    1 +
 drivers/power/asv/Kconfig                |   24 ++++
 drivers/power/asv/Makefile               |    2 +
 drivers/power/asv/exynos-asv.c           |   81 ++++++++++++++
 drivers/power/asv/exynos-asv.h           |   22 ++++
 drivers/power/asv/exynos5250-asv.c       |  141 ++++++++++++++++++++++++
 drivers/power/asv/samsung-asv.c          |  175 ++++++++++++++++++++++++++++++
 include/linux/power/samsung-asv-driver.h |   61 +++++++++++
 include/linux/power/samsung-asv.h        |   37 +++++++
 11 files changed, 548 insertions(+), 0 deletions(-)
 create mode 100644 drivers/power/asv/Kconfig
 create mode 100644 drivers/power/asv/Makefile
 create mode 100644 drivers/power/asv/exynos-asv.c
 create mode 100644 drivers/power/asv/exynos-asv.h
 create mode 100644 drivers/power/asv/exynos5250-asv.c
 create mode 100644 drivers/power/asv/samsung-asv.c
 create mode 100644 include/linux/power/samsung-asv-driver.h
 create mode 100644 include/linux/power/samsung-asv.h
