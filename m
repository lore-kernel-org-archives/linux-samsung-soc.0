From: Kukjin Kim <kgene@kernel.org>
Subject: [GIT PULL 2nd 3/4] Samsung driver 2nd updates for v4.3
Date: Thu, 13 Aug 2015 09:12:59 +0900
Message-ID: <55CBE10B.2030103@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:56890 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751693AbbHMANG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Aug 2015 20:13:06 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Mike Turquette <mturquette@linaro.org>

Hi,

I've created the signed tag based on previous tags/samsung-driver so you
can see several merge in there. To support cpufreq-dt driver requires
clk/cpufreq/exynos changes together and clk/cpufreq maintainers are
aware of this changes. And we can remove exynos cpufreq driver at last.

Note this drivers update is including previous dependencies and if
you're OK, please pull.

Thanks,
Kukjin


The following changes since commit 6b1621c4a15b9110cda7cc2e2eb3e8e1a0c2bcfc:

  ARM: EXYNOS: Add exynos3250 compatible to use generic cpufreq driver
(2015-08-04 15:59:33 +0900)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-driver-2

for you to fetch changes up to 50ef057c78ba7141b502f85ca1035e9c45612f4e:

  Merge branch 'v4.3-topic/cpufreq-samsung-2' into
v4.3-next/clk-cpufreq-samsung-2 (2015-08-12 07:44:59 +0900)

----------------------------------------------------------------

Samsung 2nd driver updates for v4.3

- add generic cpufreq driver for exynos4212 and 4412

- remove exynos4 SoCs specific cpufreq driver will not
  be used more and acked by cpufreq maintainer Viresh

Note this is based on tags/samsung-driver + tags/samsung-dt-3
to support cpufreq-dt driver for Exynos SoCs 3250, 4210, 4412
and 5250 finally

----------------------------------------------------------------
Bartlomiej Zolnierkiewicz (4):
      clk: exynos4x12: add cpu clock configuration data and instantiate
cpu clock
      ARM: dts: add CPU OPP and regulator supply property for exynos4x12
      ARM: EXYNOS: switch to using generic cpufreq driver for exynos4x12
      cpufreq: exynos: remove Exynos4x12 specific cpufreq driver support

Kukjin Kim (3):
      Merge branch 'v4.3-topic/clk-samsung-2' into v4.3-next/dt-samsung-3
      Merge branch 'v4.3-next/dt-samsung-3' into
v4.3-next/clk-cpufreq-samsung-2
      Merge branch 'v4.3-topic/cpufreq-samsung-2' into
v4.3-next/clk-cpufreq-samsung-2

 arch/arm/boot/dts/exynos4212.dtsi               |  81 ++++++++
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi |   4 +
 arch/arm/boot/dts/exynos4412-origen.dts         |   4 +
 arch/arm/boot/dts/exynos4412-trats2.dts         |   4 +
 arch/arm/boot/dts/exynos4412.dtsi               |  83 +++++++++
 arch/arm/mach-exynos/Kconfig                    |   2 +
 arch/arm/mach-exynos/exynos.c                   |   2 +
 drivers/clk/samsung/clk-exynos4.c               |  50 +++++
 drivers/cpufreq/Kconfig.arm                     |  38 ----
 drivers/cpufreq/Makefile                        |   2 -
 drivers/cpufreq/exynos-cpufreq.c                | 234
-----------------------
 drivers/cpufreq/exynos-cpufreq.h                |  72 --------
 drivers/cpufreq/exynos4x12-cpufreq.c            | 236
------------------------
 13 files changed, 230 insertions(+), 582 deletions(-)
 delete mode 100644 drivers/cpufreq/exynos-cpufreq.c
 delete mode 100644 drivers/cpufreq/exynos-cpufreq.h
 delete mode 100644 drivers/cpufreq/exynos4x12-cpufreq.c
