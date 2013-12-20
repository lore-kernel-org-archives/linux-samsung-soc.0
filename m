From: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v5 0/9] phy: Add new Exynos USB 2.0 PHY driver
Date: Fri, 20 Dec 2013 14:24:06 +0100
Message-ID: <1387545857-9472-1-git-send-email-k.debski@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mat.krawczuk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, av.tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tjakobi-o02PS0xoJP9W0yFyLvAVXMxlOr/tl8fh@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

This is the fifth version of the patchset. It adds a new Exynos USB 2.0 PHY
driver. The driver uses the Generic PHY Framework.

I would like to thank everyone who contributed with comments and took the time
to read through the patches in the previous versions of this patchset.
We had a lengthy discussion with Kishon about how the driver should look like.
This patchset contains the updated version of my original idea, where support
for Exynos 4210 and 4212 is done in separate files. Kishon's idea is to join
these two into a single file. I have prepared two alternative version which I
will send soon after this patchset.

Just like the fourth version this patch depends on:
[PATCH V11 1/3] ARM: dts: Add pmu sysreg node to exynos5250 and exynos5420 dtsi
files [1].

Best wishes,
Kamil Debski

[1] - http://www.spinics.net/lists/linux-samsung-soc/msg24528.html

----------------
Changes from v4:
1) phy: core: Add an exported of_phy_get function
- the new exported function of_phy_get was changed to take the phy's name as a
  parameter instead of the index
2) phy: core: Add devm_of_phy_get to phy-core
- fixes made in the comments to devm_of_phy_get
3) phy: Add new Exynos USB PHY driver
- move the documentation from a new to an existing file - samsung-phy.txt
- fix typos and uppercase hex addresses
- add more explanations to Kconfig (checkpatch still complains, but I find it
  hard to think what else could I add)
- add selects MFD_SYSCON as the driver needs it (Thank you, Tobias!)
- cleanup included headers in both *.c and .h files
- use BIT(x) macro instead of (1 << x)
- replaced HOST and DEV with PHY0 and PHY1 in phy-exynos4212-usb2.c, the
  registers are described as PHYx in the documentation hence the decision to
  leave the PHYx naming
- fixed typo in exynos4210_rate_to_clk reg -> *reg
- change hax_mode_switch and enabled type to bool
4) usb: ehci-s5p: Change to use phy provided by the generic phy framework
- Put the issue of phy->otg in order - since the new phy driver does not provide
  this field. With the new driver the switch between host and device is done in
  power_on of the respective host and device phys.
5) usb: s3c-hsotg: Use the new Exynos USB phy driver with the generic phy
   framework
- fixed the example in the documentation
6) phy: Add support for S5PV210 to the Exynos USB PHY driver
- include files cleanup
- use BIT(x) macro instead of (1 << x)
7) phy: Add Exynos 5250 support to the Exynos USB 2.0 PHY driver
- include files cleanup
- use BIT(x) macro instead of (1 << x)
8) dts: Add usb2phy to Exynos 4
- no changes
9) dts: Add usb2phy to Exynos 5250
- no changes

----------------
Changes from v3:
- using PMU and system registers indirectly via syscon
- change labelling
- change Kconfig name
- fixed typos/stray whitespace
- move of_phy_provider_register() to the end of probe
- add a regular error return code to the rate_to_clk functions
- cleanup code and remove unused code
- change struct names to avoid collisions
- add mechanism to support multiple phys by the ehci driver

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
using the Generic PHY Framework created by Kishon Vijay Abrahan I. It
can be found here https://lkml.org/lkml/2013/8/21/29. This patch adds
support to Exynos4 family of SoCs. Support for Exynos3 and Exynos5 is
planned to be added in the near future.

I welcome your comments.

----------------------

[1] https://lkml.org/lkml/2013/8/21/29

Kamil Debski (8):
  phy: core: Add an exported of_phy_get function
  phy: core: Add devm_of_phy_get to phy-core
  phy: Add new Exynos USB PHY driver
  usb: ehci-s5p: Change to use phy provided by the generic phy
    framework
  usb: s3c-hsotg: Use the new Exynos USB phy driver with the generic
    phy framework
  phy: Add Exynos 5250 support to the Exynos USB 2.0 PHY driver
  dts: Add usb2phy to Exynos 4
  dts: Add usb2phy to Exynos 5250

Mateusz Krawczuk (1):
  phy: Add support for S5PV210 to the Exynos USB PHY driver

 .../devicetree/bindings/arm/samsung/pmu.txt        |    2 +
 .../devicetree/bindings/phy/samsung-phy.txt        |   57 +++
 .../devicetree/bindings/usb/samsung-hsotg.txt      |    4 +
 Documentation/devicetree/bindings/usb/usb-ehci.txt |   35 ++
 arch/arm/boot/dts/exynos4.dtsi                     |   31 ++
 arch/arm/boot/dts/exynos4210.dtsi                  |   17 +
 arch/arm/boot/dts/exynos4x12.dtsi                  |   17 +
 arch/arm/boot/dts/exynos5250.dtsi                  |   33 +-
 drivers/phy/Kconfig                                |   50 +++
 drivers/phy/Makefile                               |    5 +
 drivers/phy/phy-core.c                             |   76 +++-
 drivers/phy/phy-exynos4210-usb2.c                  |  257 +++++++++++++
 drivers/phy/phy-exynos4212-usb2.c                  |  306 +++++++++++++++
 drivers/phy/phy-exynos5250-usb2.c                  |  406 ++++++++++++++++++++
 drivers/phy/phy-s5pv210-usb2.c                     |  199 ++++++++++
 drivers/phy/phy-samsung-usb2.c                     |  238 ++++++++++++
 drivers/phy/phy-samsung-usb2.h                     |   69 ++++
 drivers/usb/gadget/s3c-hsotg.c                     |   11 +-
 drivers/usb/host/ehci-exynos.c                     |   97 +++--
 include/linux/phy/phy.h                            |    3 +
 20 files changed, 1853 insertions(+), 60 deletions(-)
 create mode 100644 drivers/phy/phy-exynos4210-usb2.c
 create mode 100644 drivers/phy/phy-exynos4212-usb2.c
 create mode 100644 drivers/phy/phy-exynos5250-usb2.c
 create mode 100644 drivers/phy/phy-s5pv210-usb2.c
 create mode 100644 drivers/phy/phy-samsung-usb2.c
 create mode 100644 drivers/phy/phy-samsung-usb2.h

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
