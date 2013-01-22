From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v8 0/4] Adding usb2.0 host-phy support for exynos5250
Date: Tue, 22 Jan 2013 18:30:39 +0530
Message-ID: <1358859643-5030-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Changes from v7:
 - Rebased on 'xceive' of Balbi's usb tree.
 - Placing proper Acked By's received for each patch.

Changes from v6:
 - Changing macro names from 'HOST_CTRL0_FSEL_CLKSEL_XX' to 'FSEL_CLKSEL_XX'
   since it's being used by HOST and OTG block to prepare reference clock.
 - Directly Assigning 'FSEL_CLKSEL_XX' to refclk_freq in
   samsung_usbphy_get_refclk_freq() instead of ORing them since we are
   anyways using macros:
        "HOST_CTRL0_FSEL(_x)                    ((_x) << 16)"
        "OTG_SYS_FSEL(_x)                       ((_x) << 4)"

Changes from v5:
 - Adding hostphy enable mask and hostphy register offsets
   to driver data in order to access the HOSTPHY CONTROL register.

 - Adding member 'otg' to struct samsung-usbphy so that its consumers
   can call otg->set_host so as to make 'phy' aware of the consumer type:
        HOST/DEVICE

 - Adding 'otg' to 'struct s5p_ehci_hcd' and 'struct exynos_ohci_hcd'
   which keeps track of 'otg' of the controllers' phy. This then sets
   the host.

 - Moved samsung_usbphy_set_type() calls from ehci-s5p and ohci-exynos
   to phy driver itself where based on phy_type it is called.

 - Added separate macro definition for USB20PHY_CFG register to select
   between host/device type usb link.

 - Removing unnecessary argument 'phy_type' from samsung_usbphy_set_type()
   and samsung_usbphy_cfg_sel().

 - Addressed few nits:
        -- added macro for 'KHZ'
        -- removing useless 'if' from samsung_usbphy_cfg_sel()
        -- keeping the place of clk_get intact and requesting driver
           data before that.

Vivek Gautam (4):
  ARM: EXYNOS: Update & move usb-phy types to generic include layer
  usb: phy: samsung: Add host phy support to samsung-phy driver
  USB: ehci-s5p: Add phy driver support
  USB: ohci-exynos: Add phy driver support

 .../devicetree/bindings/usb/samsung-usbphy.txt     |   12 +-
 drivers/usb/host/ehci-s5p.c                        |   81 +++-
 drivers/usb/host/ohci-exynos.c                     |   85 +++-
 drivers/usb/phy/Kconfig                            |    2 +-
 drivers/usb/phy/samsung-usbphy.c                   |  513 ++++++++++++++++++--
 include/linux/usb/samsung_usb_phy.h                |   16 +
 6 files changed, 636 insertions(+), 73 deletions(-)
 create mode 100644 include/linux/usb/samsung_usb_phy.h

-- 
1.7.6.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
