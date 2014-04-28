From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 0/4] usb: ehci/ohci-exynos: Move to generic phy framework
Date: Mon, 28 Apr 2014 14:54:36 +0530
Message-ID: <1398677080-30555-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Based and tested on 'usb-next' branch of Greg's usb tree, with relevant
device tree patches[1]

Changes from v2:
 - Added two patches in the series for some cleanup.
   usb: ohci-exynos: Use struct device instead of platform_device
   usb: ehci-exynos: Use struct device instead of platform_device
 - Addressed review comments.
   -- Moved exynos_ohci_phyg_on()/off routines inside
      exynos_ohci_phy_enable()/disable.
   -- Added functions exynos_ehci_phy_enable() and exynos_ehci_phy_disable()
      and moved exynos_ehci_phyg_on()/off routines respectively in them.
   -- Added necessary checks.

Kamil Debski (1):
  usb: ehci-exynos: Change to use phy provided by the generic phy
    framework

Vivek Gautam (3):
  usb: ohci-exynos: Use struct device instead of platform_device
  usb: ehci-exynos: Use struct device instead of platform_device
  usb: ohci-exynos: Add facility to use phy provided by the generic phy
    framework

 .../devicetree/bindings/usb/exynos-usb.txt         |   37 +++++
 drivers/usb/host/ehci-exynos.c                     |  148 +++++++++++++++++---
 drivers/usb/host/ohci-exynos.c                     |  141 ++++++++++++++++---
 3 files changed, 280 insertions(+), 46 deletions(-)

-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
