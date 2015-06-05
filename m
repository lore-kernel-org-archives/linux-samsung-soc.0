From: Kukjin Kim <kgene@kernel.org>
Subject: [GIT PULL 1/5] Samsung defconfig updates for v4.2
Date: Sat, 06 Jun 2015 03:04:14 +0900
Message-ID: <5571E49E.3050707@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:58502 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751584AbbFESE2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Jun 2015 14:04:28 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Arnd, Olof, Kevin

Here is exynos_defconfig updates for v4.2.
Please pull.

Thanks,
Kukjin

The following changes since commit 030bbdbf4c833bc69f502eae58498bc5572db736:

  Linux 4.1-rc3 (2015-05-10 15:12:29 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-defconfig-2

for you to fetch changes up to f882d3cfe87800000e5fa91160db401bb7a38d28:

  ARM: exynos_defconfig: Enable CONFIG_SENSORS_INA2XX for Odroid-XU3
(2015-06-03 09:31:29 +0900)

----------------------------------------------------------------
exynos_defconfig updates for v4.2

- enable DRM_EXYNOS_DSI and DRM_PANEL_S6E8AA0
  for full X11 display on Trats2 board
- enable SENSORS_PWM_FAN
  to control fan power on Odroid-XU3 board
- enable SENSORS_INA2XX
  for power monitor sensor on Odriod-XU3 board
- do savedefconfig
  to remove useless configs and check its dependencies

----------------------------------------------------------------
Anand Moon (2):
      ARM: exynos_defconfig: Enable CONFIG_SENSORS_PWM_FAN for Odroid-XU3
      ARM: exynos_defconfig: Enable CONFIG_SENSORS_INA2XX for Odroid-XU3

Krzysztof Kozlowski (1):
      ARM: exynos_defconfig: Enable display on Trats2 board

Kukjin Kim (1):
      ARM: exynos_defconfig: savedefconfig

 arch/arm/configs/exynos_defconfig | 50
+++++++++++++--------------------------
 1 file changed, 16 insertions(+), 34 deletions(-)
