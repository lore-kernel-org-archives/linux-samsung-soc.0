From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH v4 0/4] Enable ehci, ohci and dwc3 devices on exynos5250
Date: Tue, 15 Jan 2013 19:08:28 +0530
Message-ID: <1358257112-19595-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, kgene.kim@samsung.com, grant.likely@secretlab.ca, dianders@chromium.org, jg1.han@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Changes from v3:
 - Clubbed together arch enable patches for ehci/ohci and dwc3:
   [PATCH v3 0/2] Enable ehci and ohci devices for exynos5250, and
   [PATCH v3] ARM: Exynos5250: Enabling dwc3-exynos driver
 - Dropped OF_DEV_AUXDATA entry in mach-exysno5-dt since we don't
   need it.
 - Splitted the patch "ARM: Exynos5250: Enabling dwc3-exynos drive"
   into clock patch and device enabling patch.
 - Rebased on top of 'for-next' of linux-samsung tree.

Vivek Gautam (4):
  ARM: Exynos5250: Enabling ehci-s5p driver
  ARM: Exynos5250: Enabling ohci-exynos driver
  ARM: Exynos5250: Add clock information for dwc3-exynos
  ARM: Exynos5250: Enabling dwc3-exynos driver

 .../devicetree/bindings/usb/exynos-usb.txt         |   54 ++++++++++++++++++++
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |    4 ++
 arch/arm/boot/dts/exynos5250.dtsi                  |   18 +++++++
 arch/arm/mach-exynos/Kconfig                       |    1 +
 arch/arm/mach-exynos/clock-exynos5.c               |   24 +++++++++
 5 files changed, 101 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/exynos-usb.txt

-- 
1.7.6.5
