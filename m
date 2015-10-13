From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [GIT PULL] ARM: defconfig: Exynos improvements for 4.4, 2nd pull
Date: Tue, 13 Oct 2015 09:38:42 +0900
Message-ID: <1444696722-25093-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:45842 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751902AbbJMAjC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Oct 2015 20:39:02 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Dear Kukjin,

This is another round of defconfig related changes for 4.4.

Description along with a tag.
You can find them also on the lists with my reviewed-by.

Best regards,
Krzysztof


The following changes since commit 7fa5ce4e6fcb4596761c17e124e7d1f8cf64fe96:

  ARM: exynos_defconfig: Disable simplefb support (2015-09-13 19:25:39 +0900)

are available in the git repository at:

  https://github.com/krzk/linux.git tags/samsung-defconfig-4.4-2

for you to fetch changes up to 89a0112100e74f50407d269570a02a82fd28ccb8:

  ARM: multi_v7_defconfig: Enable rtl8152 ethernet driver for Odroid-XU4 (2015-10-12 12:59:50 +0900)

----------------------------------------------------------------
Defconfig changes around Exynos based boards:
1. Change WiFi-Ex from built-in to module to fix issue with probing
   the driver before root filesystem is available (driver needs
   firmware).
2. Enable Realtek RTL81t3 ethernet adapter present on Odroid-XU4
   board.

----------------------------------------------------------------
Anand Moon (2):
      ARM: exynos_defconfig: Enable rtl8152 ethernet driver for Odroid-XU4
      ARM: multi_v7_defconfig: Enable rtl8152 ethernet driver for Odroid-XU4

Javier Martinez Canillas (1):
      ARM: exynos_defconfig: Enable WiFi-Ex as a module instead built-in

 arch/arm/configs/exynos_defconfig   | 5 +++--
 arch/arm/configs/multi_v7_defconfig | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)
