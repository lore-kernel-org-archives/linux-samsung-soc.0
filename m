From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [GIT PULL] ARM: EXYNOS: Fix for 4.1, 4th
Date: Mon, 01 Jun 2015 09:56:57 +0900
Message-ID: <1433120217-26814-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:57741 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758801AbbFAA5W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 31 May 2015 20:57:22 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Dear Arnd and Olof,

This is fix from April which should be applied before [0].
Apparently it was missed. I am sending it to you guys because
Kukjin seems to be busy.

Best regards,
Krzysztof

[0] http://www.spinics.net/lists/linux-samsung-soc/msg44937.html


The following changes since commit 030bbdbf4c833bc69f502eae58498bc5572db736:

  Linux 4.1-rc3 (2015-05-10 15:12:29 -0700)

are available in the git repository at:

  https://github.com/krzk/linux.git tags/samsung-fixes-4.1-4

for you to fetch changes up to fe931229c61c04e0a7906c4ebef9623a4538a5ab:

  ARM: exynos: Fix wake-up interrupts for Exynos3250 (2015-06-01 09:08:34 +0900)

----------------------------------------------------------------
Fix for Exynos3250 RTC wake-up interrupts after converting PMU
wakeup to stacked domains. This allows waking up the device from
suspend to RAM using S3C RTC driver (the RTC on SoC).

The patch should be applied some time ago, unfortunately
it seems it slipped through fingers.

----------------------------------------------------------------
Marc Zyngier (1):
      ARM: exynos: Fix wake-up interrupts for Exynos3250

 arch/arm/mach-exynos/suspend.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
