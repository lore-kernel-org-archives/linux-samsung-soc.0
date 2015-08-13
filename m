From: Kukjin Kim <kgene@kernel.org>
Subject: [GIT PULL v2 1/5] Samsung clk driver updates for v4.3
Date: Fri, 14 Aug 2015 03:48:37 +0900
Message-ID: <55CCE685.40501@kernel.org>
References: <55CCE517.2070003@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:57265 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751517AbbHMSsm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Aug 2015 14:48:42 -0400
In-Reply-To: <55CCE517.2070003@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5d7d4f0754:

  Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-clk-driver

for you to fetch changes up to cd6aceef028afc3fa216e3e7bc94cc31632cad43:

  clk: exynos4x12: add cpu clock configuration data and instantiate cpu
clock (2015-08-14 02:00:43 +0900)

----------------------------------------------------------------
Samsung clk driver updates for v4.3

- add cpu clock configuration data and instantiate cpu clock
  for exynos3250, 4210, 4412 and 5250 SoCs to support Samsung
  specific cpu-clock type

* Note this branch has been provided to clk tree as a topic branch

----------------------------------------------------------------
Bartlomiej Zolnierkiewicz (1):
      clk: exynos4x12: add cpu clock configuration data and instantiate
cpu clock

Chanwoo Choi (1):
      clk: exynos3250: Add cpu clock configuration data and instaniate
cpu clock

Thomas Abraham (1):
      clk: exynos5250: add cpu clock configuration data and instantiate
cpu clock

 drivers/clk/samsung/clk-exynos3250.c   | 32 ++++++++++++++++++++--
 drivers/clk/samsung/clk-exynos4.c      | 50
++++++++++++++++++++++++++++++++++
 drivers/clk/samsung/clk-exynos5250.c   | 31 +++++++++++++++++++++
 include/dt-bindings/clock/exynos3250.h |  1 +
 include/dt-bindings/clock/exynos5250.h |  1 +
 5 files changed, 113 insertions(+), 2 deletions(-)
