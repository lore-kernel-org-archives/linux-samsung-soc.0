From: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH v5 3/9] phy: Add new Exynos USB 2.0 PHY driver
Date: Wed, 08 Jan 2014 18:56:25 +0100
Message-ID: <04dc01cf0c9a$f37c24d0$da746e70$%debski@samsung.com>
References: <1387545857-9472-1-git-send-email-k.debski@samsung.com>
 <1387545857-9472-4-git-send-email-k.debski@samsung.com>
 <52CA818A.4090403@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <52CA818A.4090403-l0cyMroinI0@public.gmane.org>
Content-language: pl
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Kishon Vijay Abraham I' <kishon-l0cyMroinI0@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mat.krawczuk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, av.tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tjakobi-o02PS0xoJP9W0yFyLvAVXMxlOr/tl8fh@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

> From: Kishon Vijay Abraham I [mailto:kishon-l0cyMroinI0@public.gmane.org]
> Sent: Monday, January 06, 2014 11:12 AM
> 
> Hi,
> 
> On Friday 20 December 2013 06:54 PM, Kamil Debski wrote:
> > Add a new driver for the Exynos USB 2.0 PHY. The new driver uses the
> > generic PHY framework. The driver includes support for the Exynos
> 4x10
> > and 4x12 SoC families.
> >
> > Signed-off-by: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > ---
> >   .../devicetree/bindings/phy/samsung-phy.txt        |   55 ++++
> >   drivers/phy/Kconfig                                |   29 ++
> >   drivers/phy/Makefile                               |    3 +
> >   drivers/phy/phy-exynos4210-usb2.c                  |  257
> ++++++++++++++++
> >   drivers/phy/phy-exynos4212-usb2.c                  |  306
> ++++++++++++++++++++
> >   drivers/phy/phy-samsung-usb2.c                     |  226
> +++++++++++++++
> >   drivers/phy/phy-samsung-usb2.h                     |   67 +++++
> >   7 files changed, 943 insertions(+)
> >   create mode 100644 drivers/phy/phy-exynos4210-usb2.c
> >   create mode 100644 drivers/phy/phy-exynos4212-usb2.c
> >   create mode 100644 drivers/phy/phy-samsung-usb2.c
> >   create mode 100644 drivers/phy/phy-samsung-usb2.h
> >
> .
> .
> <snip>
> .
> .
> 
> > diff --git a/drivers/phy/phy-samsung-usb2.h
> > b/drivers/phy/phy-samsung-usb2.h new file mode 100644 index
> > 0000000..ab89f91
> > --- /dev/null
> > +++ b/drivers/phy/phy-samsung-usb2.h
> > @@ -0,0 +1,67 @@
> > +/*
> > + * Samsung SoC USB 1.1/2.0 PHY driver
> > + *
> > + * Copyright (C) 2013 Samsung Electronics Co., Ltd.
> > + * Author: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > + *
> > + * This program is free software; you can redistribute it and/or
> > +modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + */
> > +
> > +#ifndef _PHY_EXYNOS_USB2_H
> > +#define _PHY_EXYNOS_USB2_H
> > +
> > +#include <linux/clk.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/spinlock.h>
> > +
> > +#define KHZ 1000
> > +#define MHZ (KHZ * KHZ)
> > +
> > +struct samsung_usb2_phy_driver;
> > +struct samsung_usb2_phy_instance;
> > +struct samsung_usb2_phy_config;
> > +
> > +struct samsung_usb2_phy_instance {
> > +	const struct samsung_usb2_common_phy *cfg;
> > +	struct clk *clk;
> > +	struct phy *phy;
> > +	struct samsung_usb2_phy_driver *drv;
> > +	unsigned long rate;
> > +	u32 clk_reg_val;
> > +	bool enabled;
> > +};
> > +
> > +struct samsung_usb2_phy_driver {
> > +	const struct samsung_usb2_phy_config *cfg;
> > +	struct clk *clk;
> > +	struct device *dev;
> > +	void __iomem *reg_phy;
> > +	struct regmap *reg_pmu;
> > +	struct regmap *reg_sys;
> > +	spinlock_t lock;
> > +	struct samsung_usb2_phy_instance instances[0];
> 
> I think having instances as array here would allocate more space while
> allocating 'samsung_usb2_phy_driver' in 'samsung_usb2_phy_probe'.
> 

I am not sure if I understand you correctly here. Maybe I will explain
what I intended to write. An array with size 0 at the end of a structure
takes no space in the structure. The benefit of using it is that after
the structure one can allocate a number of the array elements and
address them easily. Another option would be placing pointer in the
samsung_usb2_phy_instance and allocate memory separately, but this would
involve two allocations and a pointer would be always present in the 
structure.

Best wishes,
-- 
Kamil Debski
Samsung R&D Institute Poland



--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
