From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v5 0/2] Adding USB 3.0 DRD-phy support for exynos5250
Date: Tue, 05 Feb 2013 18:14:14 +0530
Message-ID: <1360068256-19602-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, av.tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Based on 'usb-next'

Changes from v4:
 - Modifying function names and driver names to follow a common
   naming convention.
        "usb2phy" for samsung-usb2phy driver
        "usb3phy" for samsung-usb3phy driver
 - Changing file names "samsung-usb2.c" to "samsung-usb2phy.c" and,
   "samsung-usb3.c" to "samsung-usb3phy.c"
 - Removing dependencies for SAMSUNG_USB2PHY and SAMSUNG_USB3PHY.
 - Arranging SAMSUNG_USB2PHY and SAMSUNG_USB3PHY to select SAMSUNG_USBPHY,
   which is the usb-phy helper driver.

Vivek Gautam (2):
  usb: phy: samsung: Common out the generic stuff
  usb: phy: samsung: Add PHY support for USB 3.0 controller

 drivers/usb/phy/Kconfig           |   25 +-
 drivers/usb/phy/Makefile          |    2 +
 drivers/usb/phy/samsung-usb2phy.c |  511 ++++++++++++++++++++++++++
 drivers/usb/phy/samsung-usb3phy.c |  349 ++++++++++++++++++
 drivers/usb/phy/samsung-usbphy.c  |  717 +------------------------------------
 drivers/usb/phy/samsung-usbphy.h  |  328 +++++++++++++++++
 6 files changed, 1219 insertions(+), 713 deletions(-)
 create mode 100644 drivers/usb/phy/samsung-usb2phy.c
 create mode 100644 drivers/usb/phy/samsung-usb3phy.c
 create mode 100644 drivers/usb/phy/samsung-usbphy.h

-- 
1.7.6.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
