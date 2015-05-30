From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [GIT PULL] ARM: EXYNOS: Improvements for 4.2, 3rd
Date: Sat, 30 May 2015 14:30:39 +0900
Message-ID: <1432963839-19051-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:36555 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757177AbbE3Fat (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 30 May 2015 01:30:49 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Dear Kukjin,

Old patch from Marek related to powering down of Exynos boards.

Best regards,
Krzysztof


The following changes since commit 8164b91ee8f4bb009fb16ef7c54e94a55e83dd35:

  ARM: exynos: Fix wake-up interrupts for Exynos3250 (2015-05-30 13:29:34 +0900)

are available in the git repository at:

  https://github.com/krzk/linux.git tags/samsung-for-4.2-3

for you to fetch changes up to 126bdccac56b97449a603133a2d389d280630d9a:

  exynos: pmu: use PS_HOLD based poweroff for all supported SoCs (2015-05-30 13:30:17 +0900)

----------------------------------------------------------------
Old fix for proper power down of Exynos boards.

----------------------------------------------------------------
Marek Szyprowski (1):
      exynos: pmu: use PS_HOLD based poweroff for all supported SoCs

 arch/arm/mach-exynos/pmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
