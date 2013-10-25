From: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/5] phy: Add new Exynos USB PHY driver
Date: Fri, 25 Oct 2013 16:15:24 +0200
Message-ID: <1382710529-12082-1-git-send-email-k.debski@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mat.krawczuk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

This is the second version of the patch adding support for USB PHY module
of the Exynos series of SoCs by Samsung. The driver is utilising the newly
added Generic PHY Framework by Kishon Vijay Abraham I [1].

In addition to the PHY driver this patchset contains:
- work in progress support for Exynos 5250
  (based on the drivers/usb/phy/phy-samsung-usb2.c driver)
- support for S5PV210 added by Mateusz Krawczuk during his summer internship at
  Samsung
- change to the ehci-s5p driver which modifies the driver to use the General
  PHY Framework
- change to the s3c-hsotg driver which modifies the driver to use the General
  PHY Framework

Best wishes,
Kamil Debski
----------------
Changes from v1:
- the changes include minor fixes of the hardware initialization of the PHY
  module
- some other minor fixes were introduced

----------------------
Original cover letter:

Hi,

This patch adds a new drive for USB PHYs for Samsung SoCs. The driver is using
the Generic PHY Framework created by Kishon Vijay Abrahan I. It can be found
here https://lkml.org/lkml/2013/8/21/29. This patch adds support to Exynos4
family of SoCs. Support for Exynos3 and Exynos5 is planned to be added in the
near future.

I welcome your comments.

----------------------

[1] https://lkml.org/lkml/2013/8/21/29

Kamil Debski (4):
  phy: Add new Exynos USB PHY driver
  phy: Add WIP Exynos 5250 support to the Exynos USB PHY driver
  usb: ehci-s5p: Change to use phy provided by the generic phy
    framework
  usb: s3c-hsotg: Use the new Exynos USB phy driver with the generic
    phy framework

Mateusz Krawczuk (1):
  phy: Add support for S5PV210 to the Exynos USB PHY driver

 .../devicetree/bindings/phy/samsung-usbphy.txt     |   51 +++
 drivers/phy/Kconfig                                |   35 ++
 drivers/phy/Makefile                               |    4 +
 drivers/phy/phy-exynos-usb.c                       |  265 +++++++++++++
 drivers/phy/phy-exynos-usb.h                       |   96 +++++
 drivers/phy/phy-exynos4210-usb.c                   |  295 ++++++++++++++
 drivers/phy/phy-exynos4212-usb.c                   |  343 ++++++++++++++++
 drivers/phy/phy-exynos5250-usb.c                   |  411 ++++++++++++++++++++
 drivers/phy/phy-s5pv210-usb.c                      |  236 +++++++++++
 drivers/usb/gadget/s3c-hsotg.c                     |   13 +-
 drivers/usb/host/ehci-s5p.c                        |   21 +-
 11 files changed, 1755 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/samsung-usbphy.txt
 create mode 100644 drivers/phy/phy-exynos-usb.c
 create mode 100644 drivers/phy/phy-exynos-usb.h
 create mode 100644 drivers/phy/phy-exynos4210-usb.c
 create mode 100644 drivers/phy/phy-exynos4212-usb.c
 create mode 100644 drivers/phy/phy-exynos5250-usb.c
 create mode 100644 drivers/phy/phy-s5pv210-usb.c

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
