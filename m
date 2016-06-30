From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [GIT PULL 2/4] ARM: exynos: Drivers for v4.8, part 2
Date: Thu, 30 Jun 2016 09:51:13 +0200
Message-ID: <1467273075-13747-3-git-send-email-k.kozlowski@samsung.com>
References: <1467273075-13747-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:22014 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752147AbcF3Hvk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jun 2016 03:51:40 -0400
In-reply-to: <1467273075-13747-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, krzk@kernel.org, k.kozlowski@samsung.com

Hi,

On top of previous pull.

Best regards,
Krzysztof


The following changes since commit 9479f7cc91879c6ba75e70da41c4c9fe7842b342:

  soc: samsung: pm_domains: Enable COMPILE_TEST for build coverage (2016-05-30 09:12:57 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-4.8-2

for you to fetch changes up to 187364b6fcabb9f4bfefcb62fab4fcda019b5810:

  cpufreq: s5pv210: use relaxed IO accesors (2016-06-22 14:00:21 +0200)

----------------------------------------------------------------
Samsung drivers/soc update for v4.8, part 2:
1. Endian-friendly fixes.
2. Make SROMC driver explicitly non-module.

----------------------------------------------------------------
Ben Dooks (2):
      memory: samsung: endian fixes for IO
      cpufreq: s5pv210: use relaxed IO accesors

Paul Gortmaker (1):
      memory: samsung: exynos-srom: make it explicitly non-modular

 drivers/cpufreq/s5pv210-cpufreq.c    | 68 ++++++++++++++++++------------------
 drivers/memory/samsung/exynos-srom.c | 39 +++++++--------------
 2 files changed, 46 insertions(+), 61 deletions(-)
