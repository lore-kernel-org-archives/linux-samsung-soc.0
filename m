From: Vikas Sajjan <vikas.sajjan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH V3 0/4] dts: Add usb2phy to Exynos 5250/5420
Date: Mon, 19 May 2014 16:49:12 +0530
Message-ID: <1400498356-26803-1-git-send-email-vikas.sajjan@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Vikas Sajjan <vikas.sajjan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Based on 'for-next' branch of Kgene's linux-samsung tree.
These patches are as per discussions on the driver side patches
which have already been acked. [1]

Changes from v2:
	- Addressed kukjin's comments to update DT binding documentation for sysreg.
	- removed the version for each patch. Made all patches version as same.

Changes from v1:
 - Rebase on 'for-next' branch.
 - Removed 'phy-names' property as per discuusion in the driver patches. [1]

V1 of this series was the next version for earlier patch-series:
[PATCH v7 0/2] dts: Add usb2phy to Exynos 5250 [2]

Changes from v7 series:
 - Added patches to enable usb 2.0 support on exynos5420;
   which include dt nodes for usb2phy as well as ehci and ohci
   controllers.

Changes from v6:
 - Splitted the patch into two:
    adding syscon nodes to Exynos5250 and Exynos5420 in first;
    and phy entry change in the second.
 - Changed the name of phandle for usb2phy from 'usb2_phy_new'
   to 'usb2_phy_gen' indicating generic phy.
 - Using clock macros in dt entries.

[1] http://www.spinics.net/lists/linux-usb/msg106908.html
    http://www.spinics.net/lists/linux-usb/msg106837.html
[2] http://www.spinics.net/lists/linux-usb/msg106427.html

Kamil Debski (1):
  ARM: dts: Add usb2phy to Exynos 5250

Vivek Gautam (3):
  ARM: dts: Add sysreg sytem controller node to exynos5250 and
    exynos5420
  ARM: dts: Add usb2phy support on exynos5420
  ARM: dts: Add usb 2.0 support on exynos5420

 .../devicetree/bindings/arm/samsung/sysreg.txt     |   11 ++++-
 arch/arm/boot/dts/exynos5250.dtsi                  |   27 ++++++++++++
 arch/arm/boot/dts/exynos5420.dtsi                  |   45 ++++++++++++++++++++
 3 files changed, 81 insertions(+), 2 deletions(-)

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
