From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 5/5] Samsung pinctrl-exynos5250 for v3.10
Date: Thu, 07 Mar 2013 11:23:58 +0900
Message-ID: <016a01ce1ada$d34dd850$79e988f0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:58807 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754404Ab3CGCYA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Mar 2013 21:24:00 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MJ900HUVQLWMAG0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Mar 2013 11:23:59 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MJ90027VQNYLBA0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Mar 2013 11:23:59 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linus.walleij@linaro.org

Arnd, Olof,

Here is support pinctrl-exynos5250 and that already got ack from Linus Walliej.

If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 6dbe51c251a327e012439c4772097a13df43c5b8:

  Linux 3.9-rc1 (2013-03-03 15:11:05 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next/pinctrl-exynos

for you to fetch changes up to 97916777d6904e24b86eac77da58ef7cb09d539d:

  ARM: EXYNOS: skip wakeup interrupt registration for exynos5250 if pinctrl is
enabled (2013-03-05 20:59:12 +0900)

----------------------------------------------------------------
Thomas Abraham (3):
      pinctrl: exynos: add exynos5250 SoC specific data
      gpio: samsung: skip gpiolib registration if pinctrl support is enabled for
exynos5250
      ARM: EXYNOS: skip wakeup interrupt registration for exynos5250 if pinctrl
is enabled

 arch/arm/mach-exynos/common.c     |    1 +
 drivers/gpio/gpio-samsung.c       |    1 +
 drivers/pinctrl/pinctrl-exynos.c  |  108 +++++++++++++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-samsung.c |    2 +
 drivers/pinctrl/pinctrl-samsung.h |    1 +
 5 files changed, 113 insertions(+)
