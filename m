From: Kamil Debski <k.debski@samsung.com>
Subject: [PATCH v3 0/3] phy: Add new Exynos USB 2.0 PHY driver
Date: Tue, 05 Nov 2013 17:13:18 +0100
Message-ID: <1383668001-19141-1-git-send-email-k.debski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:49745 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754208Ab3KEQOR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Nov 2013 11:14:17 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm@vger.kernel.org
Cc: kyungmin.park@samsung.com, kishon@ti.com, t.figa@samsung.com, s.nawrocki@samsung.com, m.szyprowski@samsung.com, gautam.vivek@samsung.com, mat.krawczuk@gmail.com, yulgon.kim@samsung.com, p.paneri@samsung.com, av.tikhomirov@samsung.com, jg1.han@samsung.com, galak@codeaurora.org, Kamil Debski <k.debski@samsung.com>

Hi,

This is the third version of the patchset adding the new Exynos USB 2.0 PHY
driver, which uses the Generic PHY Framework.

It contains numerous fixes and cleanups, which are the results of the feedback
to the second version.

Best wishes,
Kamil Debski

----------------
Changes from v2:
- rebase all patches to the usb-next branch
- fixes in the documentation file
  - remove wrong entries in the phy node (ranges, and #address- & #size-cells)
  - add clocks and clock-names as required properites
  - rephrase a few sentences
- fixes in the ehci-exynos.c file
  - move phy_name variable next to phy in exynos_ehci_hcd
  - remove otg from exynos_ehci_hcd as it was no longer used
  - move devm_phy_get after the Exynos5440 skip_phy check
- fixes in the s3c-hsotg.c file
  - cosmetic fixes (remove empty line that was wrongfully added)
- fixes in the main driver
  - remove cpu_type in favour for a boolean flag matched with the compatible
    value
  - rename files, structures, variables and Kconfig entires - change from simple
    "uphy" to "usb2_phy"
  - fix multiline comments style
  - simplify #ifdefs in of_device_id
  - fix Kconfig description
  - change dev_info to dev_dbg where reasonable
  - cosmetic changes (remove wrongful blank lines)
  - remove unnecessary reference counting

----------------
Changes from v1:
- the changes include minor fixes of the hardware initialization of the PHY
  module
- some other minor fixes were introduced

----------------------
Original cover letter:

Hi,

This patch adds a new drive for USB PHYs for Samsung SoCs. The driver is
using the Generic PHY Framework created by Kishon Vijay Abrahan I. It can
be found here https://lkml.org/lkml/2013/8/21/29. This patch adds support
to Exynos4 family of SoCs. Support for Exynos3 and Exynos5 is planned to
be added in the near future.

I welcome your comments.

----------------------

[1] https://lkml.org/lkml/2013/8/21/29

*** BLURB HERE ***

Kamil Debski (3):
  phy: Add new Exynos USB PHY driver
  usb: ehci-s5p: Change to use phy provided by the generic phy
    framework
  usb: s3c-hsotg: Use the new Exynos USB phy driver with the generic
    phy framework

 .../devicetree/bindings/phy/samsung-usbphy.txt     |   52 ++++
 drivers/phy/Kconfig                                |   23 +-
 drivers/phy/Makefile                               |    4 +
 drivers/phy/phy-exynos-usb2.c                      |  234 ++++++++++++++
 drivers/phy/phy-exynos-usb2.h                      |   87 ++++++
 drivers/phy/phy-exynos4210-usb2.c                  |  272 ++++++++++++++++
 drivers/phy/phy-exynos4212-usb2.c                  |  324 ++++++++++++++++++++
 drivers/usb/gadget/s3c-hsotg.c                     |   12 +-
 drivers/usb/host/ehci-exynos.c                     |   34 +-
 9 files changed, 1013 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/samsung-usbphy.txt
 create mode 100644 drivers/phy/phy-exynos-usb2.c
 create mode 100644 drivers/phy/phy-exynos-usb2.h
 create mode 100644 drivers/phy/phy-exynos4210-usb2.c
 create mode 100644 drivers/phy/phy-exynos4212-usb2.c

-- 
1.7.9.5
