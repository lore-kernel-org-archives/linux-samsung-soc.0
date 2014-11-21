From: Kukjin Kim <kgene@kernel.org>
Subject: [GIT PULL 3/5] Samsung defconfig update for v3.19
Date: Fri, 21 Nov 2014 23:15:55 +0900
Message-ID: <546F491B.4020709@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.19.201]:39446 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755540AbaKUOQA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Nov 2014 09:16:00 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit 0df1f2487d2f0d04703f142813d53615d62a1da4:

  Linux 3.18-rc3 (2014-11-02 15:01:51 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-defconfig-v3.19

for you to fetch changes up to 26048def56ac2f901d4245d2935c797984e96d68:

  ARM: exynos_defconfig: Use 16 minors per MMC block device (2014-11-21
22:04:05 +0900)

----------------------------------------------------------------
Samsung defconfig update for v3.19

- Use 16 minors per MMC block device for exynos_defconfig
  : 16 minors per MMC block device are required for Rinato (Gear 2)

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: exynos_defconfig: Use 16 minors per MMC block device

 arch/arm/configs/exynos_defconfig | 1 +
 1 file changed, 1 insertion(+)
