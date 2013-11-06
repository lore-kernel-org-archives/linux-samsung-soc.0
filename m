From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 1/3] phy: Add new Exynos USB PHY driver
Date: Wed, 06 Nov 2013 12:38:54 +0100
Message-ID: <2656549.jVSier62Qi@amdc1227>
References: <1383668001-19141-1-git-send-email-k.debski@samsung.com>
 <1383668001-19141-2-git-send-email-k.debski@samsung.com>
 <5279FB45.3010808@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <5279FB45.3010808-l0cyMroinI0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mat.krawczuk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, av.tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kishon

On Wednesday 06 of November 2013 13:48:13 Kishon Vijay Abraham I wrote:
> Hi,
> 
> On Tuesday 05 November 2013 09:43 PM, Kamil Debski wrote:
> > Add a new driver for the Exynos USB PHY. The new driver uses the generic
> > PHY framework. The driver includes support for the Exynos 4x10 and 4x12
> > SoC families.
> >
> > Signed-off-by: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > ---
> >   .../devicetree/bindings/phy/samsung-usbphy.txt     |   52 ++++
> >   drivers/phy/Kconfig                                |   23 +-
> >   drivers/phy/Makefile                               |    4 +
> >   drivers/phy/phy-exynos-usb2.c                      |  234 ++++++++++++++
> >   drivers/phy/phy-exynos-usb2.h                      |   87 ++++++
> >   drivers/phy/phy-exynos4210-usb2.c                  |  272 ++++++++++++++++
> >   drivers/phy/phy-exynos4212-usb2.c                  |  324 ++++++++++++++++++++
> >   7 files changed, 995 insertions(+), 1 deletion(-)
> >   create mode 100644 Documentation/devicetree/bindings/phy/samsung-usbphy.txt
> >   create mode 100644 drivers/phy/phy-exynos-usb2.c
> >   create mode 100644 drivers/phy/phy-exynos-usb2.h
> >   create mode 100644 drivers/phy/phy-exynos4210-usb2.c
> >   create mode 100644 drivers/phy/phy-exynos4212-usb2.c
[snip]
> > diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> > index a344f3d..bdf0fab 100644
> > --- a/drivers/phy/Kconfig
> > +++ b/drivers/phy/Kconfig
[snip]
> > @@ -51,4 +51,25 @@ config PHY_EXYNOS_DP_VIDEO
> >   	help
> >   	  Support for Display Port PHY found on Samsung EXYNOS SoCs.
> >
> > +config PHY_EXYNOS_USB2
> > +	tristate "Samsung USB 2.0 PHY driver"
> > +	help
> > +	  Enable this to support Samsung USB phy helper driver for Samsung SoCs.
> > +	  This driver provides common interface to interact, for Samsung
> > +	  USB 2.0 PHY driver.
> 
> I still think we can get rid of this helper driver and have a single 
> driver for both PHY_EXYNOS4210_USB2 and PHY_EXYNOS4212_USB2.

This helper driver is a really nice way to avoid code duplication, while
still leaving the code clean and readable.

All the Samsung USB 2.0 PHYs require exactly the same semantics
(isolation, reference rate configuration, power up, power on), but each
one has completely different layout of registers and bits inside
registers.

Making a big single driver would end up being identical to the old Exynos
USB2PHY driver with a lot of if and switch statements inside most of
functions, which is not only ugly but makes any further extension hard.

In addition, this approach makes it possible to disable support for SoCs
that are not needed in particular use cases, allowing smaller kernel
images.

> > +
> > +config PHY_EXYNOS4210_USB2
> > +	bool "Support for Exynos 4210"
> > +	depends on PHY_EXYNOS_USB2
> > +	depends on CPU_EXYNOS4210
> > +	help
> > +	  Enable USB PHY support for Exynos 4210
> > +
> > +config PHY_EXYNOS4212_USB2
> > +	bool "Support for Exynos 4212"
> > +	depends on PHY_EXYNOS_USB2
> > +	depends on (SOC_EXYNOS4212 || SOC_EXYNOS4412)
> > +	help
> > +	  Enable USB PHY support for Exynos 4212
> > +
> >   endmenu
[snip]
> > +extern const struct usb2_phy_config exynos4210_usb2_phy_config;
> > +extern const struct usb2_phy_config exynos4212_usb2_phy_config;
> > +
> > +static const struct of_device_id exynos_usb2_phy_of_match[] = {
> > +#ifdef CONFIG_PHY_EXYNOS4210_USB2
> 
> I don't think you'll need #ifdef here. Anyways the driver data can be 
> obtained using the appropriate compatible value in dt data no?

Huh?

This is not about driver data, but rather about the ability to match the
driver only to devices that are actually supported with selected Kconfig
options.

Best regards,
Tomasz

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
