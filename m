From: Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 0/3] phy: Add exynos-simple-phy driver
Date: Thu, 15 May 2014 00:47:20 +0530
Message-ID: <1400095043-685-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t.stanislaws-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

From: Rahul Sharma <Rahul.Sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Hi All,

This series has been originally proposed by Tomasz Stanislawski. With
his permission, I have addressed the following review comments in V3.

Changelog:
v3:
	* Implement lazy-init of PHYs.
	* Use MACROs instead of numbers to represent phys.
	* Use regmap interface to access PMU registers.

It is based on "Next" branch in Kishon Vijay Abraham's tree at
https://git.kernel.org/cgit/linux/kernel/git/kishon/linux-phy.git/

/* Original Message from Tomasz Stanislawski <t.stanislaws-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> */

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

 .../devicetree/bindings/phy/samsung-phy.txt        |   56 ++++++
 drivers/gpu/drm/exynos/exynos_hdmi.c               |   11 +-
 drivers/media/platform/s5p-tv/hdmi_drv.c           |   11 +-
 drivers/phy/Kconfig                                |    5 +
 drivers/phy/Makefile                               |    1 +
 drivers/phy/exynos-simple-phy.c                    |  189 ++++++++++++++++++++
 include/dt-bindings/phy/exynos-simple-phy.h        |   27 +++
 7 files changed, 290 insertions(+), 10 deletions(-)
 create mode 100644 drivers/phy/exynos-simple-phy.c
 create mode 100644 include/dt-bindings/phy/exynos-simple-phy.h

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
