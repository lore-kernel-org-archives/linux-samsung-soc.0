From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 2/7] Samsung hdmi for v3.8
Date: Wed, 21 Nov 2012 00:04:51 +0900
Message-ID: <50AB9C13.9090900@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:44044 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751261Ab2KTPE5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Nov 2012 10:04:57 -0500
Received: by mail-pa0-f46.google.com with SMTP id bh2so1317452pad.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Nov 2012 07:04:57 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Arnd, Olof,

This is for adding support for DT based exynos5250 hdmi and it adds 
device node for hdmi, mixer, hdmiphy and hdmiddc.

Please pull Samsung hdmi for v3.8 from:
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/hdmi-samsung

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 8f0d8163b50e01f398b14bcd4dc039ac5ab18d64:

   Linux 3.7-rc3 (2012-10-28 12:24:48 -0700)

are available in the git repository at:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/hdmi-samsung

Rahul Sharma (6):
       ARM: dts: add device tree support for exynos5 hdmi
       ARM: dts: add device tree support for exynos5 mixer
       ARM: dts: add device tree support for exynos5 hdmiphy
       ARM: dts: add device tree support for exynos5 hdmiddc
       ARM: EXYNOS: add clocks for exynos5 hdmi
       ARM: EXYNOS: removing exynos-drm device registration from non-dt 
platforms

  .../devicetree/bindings/drm/exynos/hdmi.txt        |   22 +++++++++++++++
  .../devicetree/bindings/drm/exynos/hdmiddc.txt     |   12 ++++++++
  .../devicetree/bindings/drm/exynos/hdmiphy.txt     |   12 ++++++++
  .../devicetree/bindings/drm/exynos/mixer.txt       |   15 ++++++++++
  arch/arm/boot/dts/exynos5250-smdk5250.dts          |   24 +++++++++++++++-
  arch/arm/boot/dts/exynos5250.dtsi                  |   20 +++++++++++++
  arch/arm/mach-exynos/Makefile                      |    1 -
  arch/arm/mach-exynos/clock-exynos5.c               |   14 ++++++++-
  arch/arm/mach-exynos/dev-drm.c                     |   29 
--------------------
  arch/arm/mach-exynos/mach-exynos5-dt.c             |    8 +++++
  arch/arm/mach-exynos/mach-nuri.c                   |    3 --
  arch/arm/mach-exynos/mach-origen.c                 |    3 --
  arch/arm/mach-exynos/mach-smdk4x12.c               |    3 --
  arch/arm/mach-exynos/mach-smdkv310.c               |    3 --
  arch/arm/mach-exynos/mach-universal_c210.c         |    3 --
  arch/arm/plat-samsung/include/plat/devs.h          |    2 -
  16 files changed, 124 insertions(+), 50 deletions(-)
  create mode 100644 Documentation/devicetree/bindings/drm/exynos/hdmi.txt
  create mode 100644 
Documentation/devicetree/bindings/drm/exynos/hdmiddc.txt
  create mode 100644 
Documentation/devicetree/bindings/drm/exynos/hdmiphy.txt
  create mode 100644 Documentation/devicetree/bindings/drm/exynos/mixer.txt
  delete mode 100644 arch/arm/mach-exynos/dev-drm.c
