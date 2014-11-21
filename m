From: Kukjin Kim <kgene@kernel.org>
Subject: [GIT PULL 2/2] Samsung defconfig update for v3.18
Date: Fri, 21 Nov 2014 22:23:47 +0900
Message-ID: <546F3CE3.5010502@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.19.201]:35958 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757965AbaKUNXx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Nov 2014 08:23:53 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit 0df1f2487d2f0d04703f142813d53615d62a1da4:

  Linux 3.18-rc3 (2014-11-02 15:01:51 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-defconfig-v3.18

for you to fetch changes up to 0788148935c3a0fae3cca6af72943b9628bf8a54:

  ARM: exynos_defconfig: Enable max77802 rtc and clock drivers
(2014-11-21 21:46:21 +0900)

----------------------------------------------------------------
Samsung defconfig update for v3.18

- enable max77802 rtc and clock drivers for exynos_defconfig
  : enable the kernel config options to have the drivers for
    max77802 including rtc and 2-ch 32kHz clock outputs

----------------------------------------------------------------
Javier Martinez Canillas (1):
      ARM: exynos_defconfig: Enable max77802 rtc and clock drivers

 arch/arm/configs/exynos_defconfig | 2 ++
 1 file changed, 2 insertions(+)
