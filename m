From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v4 0/3] phy: Add exynos-simple-phy driver
Date: Thu, 15 May 2014 18:40:51 +0530
Message-ID: <1400159454-31107-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:51791 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751403AbaEONMc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 May 2014 09:12:32 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: a.hajda@samsung.com, t.stanislaws@samsung.com, thierry.reding@gmail.com, devicetree@vger.kernel.org, kgene.kim@samsung.com, kishon@ti.com, kyungmin.park@samsung.com, robh+dt@kernel.org, grant.likely@linaro.org, sylvester.nawrocki@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>


Changelog:
v4:
	* Rename files to follow "phy-exynos-simple" names.
	* Rename Macros to this convention PHY_EXYNOS_SIMPLE_XXXX.
	* Added list of phy specifier values to documentation file.
	* Removed of_match_ptr from driver probe.
	* Moved unrelated MACROs to driver file from header file.

v3:
	* Implement lazy-init of PHYs.
	* Use MACROs instead of numbers to represent phys.
	* Use regmap interface to access PMU registers.

It is based on "Next" branch in Kishon Vijay Abraham's tree at
https://git.kernel.org/cgit/linux/kernel/git/kishon/linux-phy.git/

/* Original Message from Tomasz Stanislawski <t.stanislaws@samsung.com> */

The Samsung SoCs from Exynos family are enhanced with a bunch of devices that
provide functionality of a physical layer for interfaces like USB, HDMI, SATA,
etc. They are controlled by a simple interface, often a single bit that enables
and/or resets the physical layer.

An IP driver should to control such a controller in an abstract manner.
Therefore, such 'enablers' were implemented as clocks in older versions of
Linux kernel.  With the dawn of PHY subsystems, PHYs become a natural way of
exporting the 'enabler' functionality to drivers.  However, there is an
unexpected consequence. Some of those 1-bit PHYs were implemented as separate
drivers.  This means that one has to create a struct device, struct phy, its
phy provider and 100-150 lines of driver code to basically set one bit.

The DP phy driver is a good example:
https://lkml.org/lkml/2013/7/18/53

And simple-phy RFC (shares only driver code but not other resources):
https://lkml.org/lkml/2013/10/21/313

To avoid waste of resources I propose to create all such 1-bit phys from Exynos
SoC using a single device, driver and phy provider.

This patchset contains a proposed solution.

All comment are welcome.

Hopefully in future the functionality introduced by this patch may be merged
into a larger Power Management Unit (PMU) gluer driver.  On Samsusng SoC , the
PMU part contains a number of register barely linked to power management (like
clock gating, clock dividers, CPU resetting, etc.).  It may be tempting to
create a hybrid driver that export clocks/phys/etc that are controlled by PMU
unit.

Alternative solutions might be:
* exporting a regmap to the IP driver and allow the driver to control the PHY layer
  like in the patch:
  http://thread.gmane.org/gmane.linux.kernel.samsung-soc/28617/focus=28648

* create a dedicated power domain for hdmiphy

Regards,
Tomasz Stanislawski

v2:
	* rename to exynos-simple-phy
	* fix usage of devm_ioremap()
	* add documentation for DT bindings
	* add patches to client drivers

v1: initial version

Tomasz Stanislawski (3):
  phy: Add exynos-simple-phy driver
  drm: exynos: hdmi: use hdmiphy as PHY
  s5p-tv: hdmi: use hdmiphy as PHY

 .../devicetree/bindings/phy/samsung-phy.txt        |   57 ++++++
 drivers/gpu/drm/exynos/exynos_hdmi.c               |   11 +-
 drivers/media/platform/s5p-tv/hdmi_drv.c           |   11 +-
 drivers/phy/Kconfig                                |    5 +
 drivers/phy/Makefile                               |    1 +
 drivers/phy/phy-exynos-simple.c                    |  189 ++++++++++++++++++++
 include/dt-bindings/phy/phy-exynos-simple.h        |   22 +++
 7 files changed, 286 insertions(+), 10 deletions(-)
 create mode 100644 drivers/phy/phy-exynos-simple.c
 create mode 100644 include/dt-bindings/phy/phy-exynos-simple.h

-- 
1.7.9.5
