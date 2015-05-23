From: Kukjin Kim <kgene@kernel.org>
Subject: [GIT PULL] Samsung 3rd fixes for v4.1
Date: Sat, 23 May 2015 12:08:42 +0900
Message-ID: <555FEF3A.303@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:40175 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756436AbbEWDI5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 May 2015 23:08:57 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

The following changes since commit 030bbdbf4c833bc69f502eae58498bc5572db736:

  Linux 4.1-rc3 (2015-05-10 15:12:29 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-fixes-3

for you to fetch changes up to 242ddf04297f2c4768bd8eb7593ab911910c5f76:

  ARM: dts: set display clock correctly for exynos4412-trats2
(2015-05-23 11:46:55 +0900)

----------------------------------------------------------------
Samsung fix for v4.1

- Set display clock correctly for exynos4412-trats2
  : fix the following error

    exynos-drm: No connectors reported connected with modes
    [drm] Cannot find any crtc or sizes - going 1024x768

----------------------------------------------------------------
Inki Dae (1):
      ARM: dts: set display clock correctly for exynos4412-trats2

 arch/arm/boot/dts/exynos4412-trats2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
