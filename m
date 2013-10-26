From: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 3/5] phy: Add support for S5PV210 to the Exynos USB PHY
 driver
Date: Sat, 26 Oct 2013 10:40:02 +0900
Message-ID: <003701ced1ec$4a511d40$def357c0$%han@samsung.com>
References: <1382710529-12082-1-git-send-email-k.debski@samsung.com>
 <1382710529-12082-4-git-send-email-k.debski@samsung.com>
 <526A933C.4020904@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <526A933C.4020904-l0cyMroinI0@public.gmane.org>
Content-language: ko
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Kishon Vijay Abraham I' <kishon-l0cyMroinI0@public.gmane.org>, 'Kamil Debski' <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Kyungmin Park' <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Tomasz Figa' <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Sylwester Nawrocki' <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Marek Szyprowski' <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Vivek Gautam' <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Mateusz Krawczuk' <mat.krawczuk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 'Praveen Paneri' <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Yulgon Kim' <yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Anton Tikhomirov' <av.tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Jingoo Han' <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Saturday, October 26, 2013 12:50 AM, Kishon Vijay Abraham I wrote:
> On Friday 25 October 2013 07:45 PM, Kamil Debski wrote:
> > From: Mateusz Krawczuk <m.krawczuk-GrGkmOP51GdLN7c7dRTbYkEOCMrvLtNR@public.gmane.org>
> >
> > Add support for the Samsung's S5PV210 SoC to the Exynos USB PHY driver.
> >
> > Signed-off-by: Mateusz Krawczuk <m.krawczuk-GrGkmOP51GdLN7c7dRTbYkEOCMrvLtNR@public.gmane.org>
> > [k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org: whitespace cleanup and commit description]
> > Signed-off-by: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > ---
> >  drivers/phy/Kconfig           |    7 ++
> >  drivers/phy/phy-exynos-usb.c  |   10 ++
> >  drivers/phy/phy-exynos-usb.h  |    1 +
> >  drivers/phy/phy-s5pv210-usb.c |  236 +++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 254 insertions(+)
> >  create mode 100644 drivers/phy/phy-s5pv210-usb.c

[.....]

> > diff --git a/drivers/phy/phy-s5pv210-usb.c b/drivers/phy/phy-s5pv210-usb.c
> > new file mode 100644
> > index 0000000..575275d
> > --- /dev/null
> > +++ b/drivers/phy/phy-s5pv210-usb.c
> 
> how different is this IP different from the previous ones? Does it deserve a
> separate driver or the previous drivers can be re-used?

[.....]

> > +const struct uphy_config s5pv210_uphy_config = {
> > +	.cpu		= TYPE_S5PV210,
> > +	.num_phys	= S5PV210_NUM_PHYS,
> > +	.phys		= s5pv210_phys,
> > +};
> 
> IMO this looks similar to the other drivers. Please re-use the drivers wherever
> possible.
> 

+cc Praveen Paneri(Author of Samsung PHY driver), Yulgon Kim, Anton Tikhomirov

I agree with Kishon's opinion.

Actually, all Exynos USB PHY controllers are not different IPs.
However, the differences between Exynos USB PHY controllers are
not little.

Best regards,
Jingoo Han

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
