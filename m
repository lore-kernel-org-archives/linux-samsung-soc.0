From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [GIT PULL] ARM: EXYNOS: More defconfig for 4.2
Date: Sat, 30 May 2015 14:21:29 +0900
Message-ID: <1432963289-32664-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:34470 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750836AbbE3FVz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 30 May 2015 01:21:55 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Anand Moon <linux.amoon@gmail.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Dear Kukjin,

Minor defconfig changes from Anand Moon for Odroid XU3 board.
You can find them also on the lists with my reviewed-by.

Best regards,
Krzysztof


The following changes since commit 030bbdbf4c833bc69f502eae58498bc5572db736:

  Linux 4.1-rc3 (2015-05-10 15:12:29 -0700)

are available in the git repository at:

  https://github.com/krzk/linux.git tags/samsung-defconfig-for-4.2

for you to fetch changes up to 314be0834460dfde70b614f1a2e5d041684ce796:

  ARM: exynos_defconfig: Enable LEDs for Odroid-XU3 (2015-05-30 13:19:49 +0900)

----------------------------------------------------------------
Enable in exynos_defconfig options for Odroid XU3:
1. sensors (fan, ina231),
2. LED.

----------------------------------------------------------------
Anand Moon (3):
      ARM: exynos_defconfig: Enable CONFIG_SENSORS_PWM_FAN for Odroid-XU3 pmw-fan
      ARM: exynos_defconfig: Enable CONFIG_SENSORS_INA2XX for Odroid-XU3
      ARM: exynos_defconfig: Enable LEDs for Odroid-XU3

 arch/arm/configs/exynos_defconfig | 5 +++++
 1 file changed, 5 insertions(+)
