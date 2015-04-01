From: Kukjin Kim <kgene@kernel.org>
Subject: [GIT PULL 2/5] Samsung defconfig udpates for v4.1
Date: Thu, 02 Apr 2015 03:16:22 +0900
Message-ID: <551C35F6.1090602@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:45367 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753090AbbDASQ2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Apr 2015 14:16:28 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

The following changes since commit c517d838eb7d07bbe9507871fab3931deccff539:

  Linux 4.0-rc1 (2015-02-22 18:21:14 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-defconfig

for you to fetch changes up to bb84296ae52da844c9cab81e0197152a69f2f841:

  ARM: exynos_defconfig: Enable HDMI support (2015-03-27 02:00:09 +0900)

----------------------------------------------------------------
Samsung defconfig updates for v4.1

- update exynos-defconfig
  : enable HDMI, CPUidle, ChromeOS EC chardev driver
    and thermal emulation, Marvell WiFi-Ex, CPUfreq,
    and support for NFS rootfs
  : remove EXYNOS_THERMAL_CORE define
    and disable IOMMU support until support it

----------------------------------------------------------------
Javier Martinez Canillas (5):
      ARM: exynos_defconfig: Disable IOMMU support
      ARM: exynos_defconfig: Enable Marvell WiFi-Ex support
      ARM: exynos_defconfig: Enable ChromeOS EC chardev driver
      ARM: exynos_defconfig: Enable options to mount a rootfs via NFS
      ARM: exynos_defconfig: Enable HDMI support

Krzysztof Kozlowski (1):
      ARM: exynos_defconfig: Enable CPU idle

Lukasz Majewski (3):
      ARM: exynos_defconfig: Remove CONFIG_EXYNOS_THERMAL_CORE define
      ARM: exynos_defconfig: Enable thermal emulation for Exynos TMU
      ARM: exynos_defconfig: Enable support for cpufreq on Exynos SoCs

 arch/arm/configs/exynos_defconfig | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)
