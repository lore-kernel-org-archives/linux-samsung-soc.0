From: Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/4] Support Samsung S5P EHCI device and driver
Date: Fri, 08 Apr 2011 13:22:21 +0900
Message-ID: <4D9E8D7D.9070304@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, gregkh-l3A5Bk7waGM@public.gmane.org, =?UTF-8?B?67CV6rK9?= =?UTF-8?B?66+8?= <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello.

This patch series to add USB EHCI device and initial driver for Samsung
S5P SoCs and is based from Linux 2.6.39-rc2. I have tested on NURI board
using EXYNOS4.

Thanks.

Joonyoung Shim (4):
       ARM: S5P: Add usb ehci device
       ARM: EXYNOS4: Add usb host phy control
       ARM: EXYNOS4: Add usb ehci device to the NURI board
       USB: Add initial S5P EHCI driver

  arch/arm/mach-exynos4/Kconfig                     |    1 +
  arch/arm/mach-exynos4/Makefile                    |    2 +
  arch/arm/mach-exynos4/cpu.c                       |    7 +-
  arch/arm/mach-exynos4/include/mach/map.h          |    4 +
  arch/arm/mach-exynos4/include/mach/regs-pmu.h     |    3 +
  arch/arm/mach-exynos4/include/mach/regs-usb-phy.h |   64 +++++++
  arch/arm/mach-exynos4/mach-nuri.c                 |   16 ++
  arch/arm/mach-exynos4/usb-phy.c                   |  136 ++++++++++++++
  arch/arm/plat-s5p/Kconfig                         |    5 +
  arch/arm/plat-s5p/Makefile                        |    1 +
  arch/arm/plat-s5p/dev-ehci.c                      |   57 ++++++
  arch/arm/plat-s5p/include/plat/ehci.h             |   21 +++
  arch/arm/plat-s5p/include/plat/map-s5p.h          |    2 +-
  arch/arm/plat-s5p/include/plat/usb-phy.h          |   22 +++
  arch/arm/plat-samsung/include/plat/devs.h         |    2 +
  drivers/usb/Kconfig                               |    1 +
  drivers/usb/host/Kconfig                          |    6 +
  drivers/usb/host/ehci-hcd.c                       |    5 +
  drivers/usb/host/ehci-s5p.c                       |  201 
+++++++++++++++++++++
  19 files changed, 554 insertions(+), 2 deletions(-)
  create mode 100644 arch/arm/mach-exynos4/include/mach/regs-usb-phy.h
  create mode 100644 arch/arm/mach-exynos4/usb-phy.c
  create mode 100644 arch/arm/plat-s5p/dev-ehci.c
  create mode 100644 arch/arm/plat-s5p/include/plat/ehci.h
  create mode 100644 arch/arm/plat-s5p/include/plat/usb-phy.h
  create mode 100644 drivers/usb/host/ehci-s5p.c
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
