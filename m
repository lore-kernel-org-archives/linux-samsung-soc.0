From: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH RESEND v2 1/2] phy: core: Add an exported of_phy_get
 function
Date: Fri, 13 Dec 2013 16:26:28 +0100
Message-ID: <008a01cef817$b24844e0$16d8cea0$%debski@samsung.com>
References: <1386943380-28596-1-git-send-email-k.debski@samsung.com>
 <52AB1D75.4030207@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <52AB1D75.4030207-l0cyMroinI0@public.gmane.org>
Content-language: pl
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Kishon Vijay Abraham I' <kishon-l0cyMroinI0@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kishon,

> From: Kishon Vijay Abraham I [mailto:kishon-l0cyMroinI0@public.gmane.org]
> Sent: Friday, December 13, 2013 3:45 PM
> 
> Hi,
> 
> On Friday 13 December 2013 07:32 PM, Kamil Debski wrote:
> > Previously the of_phy_get function took a struct device * and was
> > declared static. It was impossible to call it from another driver and
> > thus it was impossible to get phy defined for a given node. The old
> > function was renamed to _of_phy_get and was left for internal use.
> > of_phy_get function was added and it was exported. The function
> > enables to get a phy for a given device tree node.
> >
> > Signed-off-by: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > ---
> > It seems that my git send-email is playing up and sent the previous
> > emails without from. This is a resend. Sorry for any confusion.
> > ---
> >  drivers/phy/phy-core.c  |   41 ++++++++++++++++++++++++++++++++-----
> ----
> >  include/linux/phy/phy.h |    1 +
> >  2 files changed, 33 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c index
> > 03cf8fb..f0dbd42 100644
> > --- a/drivers/phy/phy-core.c
> > +++ b/drivers/phy/phy-core.c
> > @@ -240,8 +240,8 @@ out:
> >  EXPORT_SYMBOL_GPL(phy_power_off);
> >
> >  /**
> > - * of_phy_get() - lookup and obtain a reference to a phy by phandle
> > - * @dev: device that requests this phy
> > + * _of_phy_get() - lookup and obtain a reference to a phy by phandle
> > + * @np: device_node for which to get the phy
> >   * @index: the index of the phy
> >   *
> >   * Returns the phy associated with the given phandle value, @@
> > -250,20 +250,17 @@ EXPORT_SYMBOL_GPL(phy_power_off);
> >   * not yet loaded. This function uses of_xlate call back function
> provided
> >   * while registering the phy_provider to find the phy instance.
> >   */
> > -static struct phy *of_phy_get(struct device *dev, int index)
> > +static struct phy *_of_phy_get(struct device_node *np, int index)
> >  {
> >  	int ret;
> >  	struct phy_provider *phy_provider;
> >  	struct phy *phy = NULL;
> >  	struct of_phandle_args args;
> >
> > -	ret = of_parse_phandle_with_args(dev->of_node, "phys", "#phy-
> cells",
> > +	ret = of_parse_phandle_with_args(np, "phys", "#phy-cells",
> >  		index, &args);
> > -	if (ret) {
> > -		dev_dbg(dev, "failed to get phy in %s node\n",
> > -			dev->of_node->full_name);
> > +	if (ret)
> >  		return ERR_PTR(-ENODEV);
> > -	}
> >
> >  	mutex_lock(&phy_provider_mutex);
> >  	phy_provider = of_phy_provider_lookup(args.np); @@ -283,6 +280,32
> @@
> > err0:
> >  }
> >
> >  /**
> > + * of_phy_get() - lookup and obtain a reference to a phy using a
> device_node.
> > + * @np: device_node for which to get the phy
> > + * @index: the index of the phy
> 
> Would be better if the user can get the PHY by string instead of index.

Ok, this sounds doable. I will add of_phy_get_by_name analogous to the clk
framework.

> > + *
> > + * Returns the phy driver, after getting a refcount to it; or
> > + * -ENODEV if there is no such phy.  The caller is responsible for
> > + * calling phy_put() to release that count.
> > + */
> > +struct phy *of_phy_get(struct device_node *np, int index) {
> > +	struct phy *phy = NULL;
> > +
> > +	phy = _of_phy_get(np, index);
> > +	if (IS_ERR(phy))
> dev_err here?

dev_err requires a dev, so it is not possible with the arguments used.
And we do not want to add any extra parameters to keep the function call
analogous to other of_*_get (as for example of_clk_get).

Best wishes,
-- 
Kamil Debski
Samsung R&D Institute Poland


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
