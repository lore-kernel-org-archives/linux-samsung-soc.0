From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 0/2] ARM: Exynos5250: Enabling samsung usb phy
Date: Fri, 15 Mar 2013 13:26:09 +0530
Message-ID: <1363334171-21812-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Based on 'for-next' of linux-samsung tree with following patches
from Doug on top:
usb: Document clocks in samsung, exynos4210-ehci/ohci bindings
ARM: dts: add usb 2.0 clock references to exynos5250 device tree

Also depending upon following patch-series for Samsung-usb-phy driver:
[PATCH v7 0/2] Adding USB 3.0 DRD-phy support for exynos5250

Changes from v3:
Added 'clocks' and 'clock-names' entry also in device nodes, aligning
with common clock framework for Samsung's SoCs.

Vivek Gautam (2):
  ARM: Exynos5250: Enabling samsung-usb2phy driver
  ARM: Exynos5250: Enabling samsung-usb3phy driver

 arch/arm/boot/dts/exynos5250.dtsi |   29 +++++++++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

-- 
1.7.6.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
