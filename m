From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: RE: [PATCH v6 8/8] usb: ehci-exynos: Change to use phy provided by
 the generic phy framework
Date: Wed, 5 Feb 2014 14:55:51 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1402051453150.1312-100000@iolanthe.rowland.org>
References: <054301cf228a$eb58a480$c209ed80$%debski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <054301cf228a$eb58a480$c209ed80$%debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mat.krawczuk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, av.tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tjakobi-o02PS0xoJP9W0yFyLvAVXMxlOr/tl8fh@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 5 Feb 2014, Kamil Debski wrote:

> Hi Alan,
> 
> Thank you for your review.

You're welcome.

> > 
> > > Change the phy provider used from the old one using the USB phy
> > You have removed all the OTG stuff from the driver.  This wasn't
> > mentioned in the patch description, and it has no connection with the
> > PHY work.
> 
> Maybe I'll explain more about what are we trying to achieve. The goal
> is to replace the old phy driver with the new one. In the old driver it was
> difficult to add support to new SoC. It also had issues with having device
> and
> host working together.
> 
> You're right that until the old phy driver is removed support for the it
> should
> remain. To be able to remove the old driver both new USB2 and new USB3 phy
> drivers
> have to be ready. The USB3 driver is written by Vivek Gautam and as I see
> it, he
> is also close to completion.
> 
> Regarding the otg part. The old phy driver is the only provider of the otg
> structure. It sets the host field of the structure. It is then used by
> samsung_usb2phy_init (drivers/usb/phy/phy-samsung-usb2.c) to check which
> driver is requesting the phy (is it host or device). In the new driver this
> is determined by the entry in device tree. So no need to check the otg
> struct
> and strstr (!) to check if dev_name is ehci, ohci or other, like the old
> driver.

Okay, that's fine.  But please explain this in the patch description
next time.  Otherwise the connection between the phy driver and the otg
structure is not at all clear; they look like two unrelated things.

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
