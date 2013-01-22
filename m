From: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH v6 0/4] Adding usb2.0 host-phy support for exynos5250
Date: Mon, 21 Jan 2013 21:23:28 -0800
Message-ID: <053c01cdf860$9e98df20$dbca9d60$@samsung.com>
References: <1357916550-11421-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1357916550-11421-1-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-language: en-us
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Vivek Gautam' <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Vivek Gautam wrote:
> 
> Changes from v5:
>  - Rebased on top of latest patches:
>         usb: phy: samsung: Introducing usb phy driver for hsotg (v9)
>         usb: phy: samsung: Add support to set pmu isolation (v6)
>    As a result adding hostphy enable mask and hostphy register offsets
>    to driver data in order to access the HOSTPHY CONTROL register.
> 
>  - Adding member 'otg' to struct samsung-usbphy so that its consumers
>    can call otg->set_host so as to make 'phy' aware of the consumer type:
> 	HOST/DEVICE
> 
>  - Adding 'otg' to 'struct s5p_ehci_hcd' and 'struct exynos_ohci_hcd'
>    which keeps track of 'otg' of the controllers' phy. This then sets
>    the host.
> 
>  - Moved samsung_usbphy_set_type() calls from ehci-s5p and ohci-exynos
>    to phy driver itself where based on phy_type it is called.
> 
>  - Added separate macro definition for USB20PHY_CFG register to select
>    between host/device type usb link.
> 
>  - Removing unnecessary argument 'phy_type' from
> samsung_usbphy_set_type()
>    and samsung_usbphy_cfg_sel().
> 
>  - Addressed few nits:
> 	-- added macro for 'KHZ'
> 	-- removing useless 'if' from samsung_usbphy_cfg_sel()
> 	-- keeping the place of clk_get intact and requesting driver
> 	   data before that.
> 
> Vivek Gautam (4):
>   ARM: EXYNOS: Update & move usb-phy types to generic include layer
>   usb: phy: samsung: Add host phy support to samsung-phy driver
>   USB: ehci-s5p: Add phy driver support
>   USB: ohci-exynos: Add phy driver support
> 
>  .../devicetree/bindings/usb/samsung-usbphy.txt     |   12 +-
>  drivers/usb/host/ehci-s5p.c                        |   81 +++-
>  drivers/usb/host/ohci-exynos.c                     |   85 +++-
>  drivers/usb/phy/Kconfig                            |    2 +-
>  drivers/usb/phy/samsung-usbphy.c                   |  512
++++++++++++++++++--
>  include/linux/usb/samsung_usb_phy.h                |   16 +
>  6 files changed, 635 insertions(+), 73 deletions(-)
>  create mode 100644 include/linux/usb/samsung_usb_phy.h
> 
> --
> 1.7.6.5

Looks good to me,

Felipe and Greg, I don't know who should take this series anyway, feel free
to add  my ack:

Acked-by: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Thanks.

- Kukjin

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
