From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [GIT PULL] ARM: EXYNOS: Fix for 4.1, 3rd
Date: Sat, 30 May 2015 14:29:44 +0900
Message-ID: <1432963784-24046-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:33490 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753238AbbE3Fab (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 30 May 2015 01:30:31 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Dear Kukjin,

Fix from April which you said it is applied. Apparently it was not,
so here it is again.

Best regards,
Krzysztof


The following changes since commit 5c78bc1b466701c1b13d7b734f5b39cdd65babab:

  Merge branch 'samsung-defconfig-2nd' into for-next (2015-05-23 12:28:59 +0900)

are available in the git repository at:

  https://github.com/krzk/linux.git tags/samsung-fixes-4.1-3

for you to fetch changes up to 8164b91ee8f4bb009fb16ef7c54e94a55e83dd35:

  ARM: exynos: Fix wake-up interrupts for Exynos3250 (2015-05-30 13:29:34 +0900)

----------------------------------------------------------------
Fix for Exynos3250 wake-up interrupts after converting PMU
wakeup to stacked domains. This slipped through fingers some
time ago.

----------------------------------------------------------------
Marc Zyngier (1):
      ARM: exynos: Fix wake-up interrupts for Exynos3250

 arch/arm/mach-exynos/suspend.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
