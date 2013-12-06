From: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 5/9] usb: s3c-hsotg: Use the new Exynos USB phy driver
 with the generic phy framework
Date: Fri, 6 Dec 2013 10:01:01 -0500
Message-ID: <20131206150101.GA31091@beef>
References: <1386246579-25141-1-git-send-email-k.debski@samsung.com>
 <1386246579-25141-6-git-send-email-k.debski@samsung.com>
 <52A1B0F7.2050501@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52A1B0F7.2050501-l0cyMroinI0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mat.krawczuk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, av.tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Dec 06, 2013 at 04:41:51PM +0530, Kishon Vijay Abraham I wrote:
> Hi,
> 
> On Thursday 05 December 2013 05:59 PM, Kamil Debski wrote:
> > Change the used phy driver to the new Exynos USB phy driver that uses the
> > generic phy framework.
> > 
> > Signed-off-by: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > ---
> >  .../devicetree/bindings/usb/samsung-hsotg.txt      |    4 ++++
> >  drivers/usb/gadget/s3c-hsotg.c                     |   11 ++++++-----
> >  2 files changed, 10 insertions(+), 5 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/samsung-hsotg.txt b/Documentation/devicetree/bindings/usb/samsung-hsotg.txt
> > index b83d428..9340d06 100644
> > --- a/Documentation/devicetree/bindings/usb/samsung-hsotg.txt
> > +++ b/Documentation/devicetree/bindings/usb/samsung-hsotg.txt
> > @@ -24,6 +24,8 @@ Required properties:
> >      - first entry: must be "otg"
> >  - vusb_d-supply: phandle to voltage regulator of digital section,
> >  - vusb_a-supply: phandle to voltage regulator of analog section.
> > +- phys: from general PHY binding: phandle to the PHY device
> > +- phy-names: from general PHY binding: should be "usb2-phy"
> 
> are you sure it's usb2-phy. The example below seems to have a different value.

I requested this be changed to usb2-phy, looks like he just missed the
update to the example.

> 
> >  
> >  Example
> >  -----
> > @@ -36,5 +38,7 @@ Example
> >  		clock-names = "otg";
> >  		vusb_d-supply = <&vusb_reg>;
> >  		vusb_a-supply = <&vusbdac_reg>;
> > +		phys = <&usb2phy 0>;
> > +		phy-names = "device";
> >  	};
> >  
> > diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
> > index eccb147..db096fd 100644
> > --- a/drivers/usb/gadget/s3c-hsotg.c
> > +++ b/drivers/usb/gadget/s3c-hsotg.c
> > @@ -31,6 +31,7 @@
> >  #include <linux/regulator/consumer.h>
> >  #include <linux/of.h>
> >  #include <linux/of_platform.h>
> > +#include <linux/phy/phy.h>
> >  
> >  #include <linux/usb/ch9.h>
> >  #include <linux/usb/gadget.h>
> > @@ -162,7 +163,7 @@ struct s3c_hsotg_ep {
> >  struct s3c_hsotg {
> >  	struct device		 *dev;
> >  	struct usb_gadget_driver *driver;
> > -	struct usb_phy		*phy;
> > +	struct phy		 *phy;
> >  	struct s3c_hsotg_plat	 *plat;
> >  
> >  	spinlock_t              lock;
> > @@ -2905,7 +2906,7 @@ static void s3c_hsotg_phy_enable(struct s3c_hsotg *hsotg)
> >  	dev_dbg(hsotg->dev, "pdev 0x%p\n", pdev);
> >  
> >  	if (hsotg->phy)
> > -		usb_phy_init(hsotg->phy);
> > +		phy_power_on(hsotg->phy);
> >  	else if (hsotg->plat->phy_init)
> >  		hsotg->plat->phy_init(pdev, hsotg->plat->phy_type);
> >  }
> > @@ -2922,7 +2923,7 @@ static void s3c_hsotg_phy_disable(struct s3c_hsotg *hsotg)
> >  	struct platform_device *pdev = to_platform_device(hsotg->dev);
> >  
> >  	if (hsotg->phy)
> > -		usb_phy_shutdown(hsotg->phy);
> > +		phy_power_off(hsotg->phy);
> >  	else if (hsotg->plat->phy_exit)
> >  		hsotg->plat->phy_exit(pdev, hsotg->plat->phy_type);
> >  }
> > @@ -3529,7 +3530,7 @@ static void s3c_hsotg_delete_debug(struct s3c_hsotg *hsotg)
> >  static int s3c_hsotg_probe(struct platform_device *pdev)
> >  {
> >  	struct s3c_hsotg_plat *plat = dev_get_platdata(&pdev->dev);
> > -	struct usb_phy *phy;
> > +	struct phy *phy;
> >  	struct device *dev = &pdev->dev;
> >  	struct s3c_hsotg_ep *eps;
> >  	struct s3c_hsotg *hsotg;
> > @@ -3544,7 +3545,7 @@ static int s3c_hsotg_probe(struct platform_device *pdev)
> >  		return -ENOMEM;
> >  	}
> >  
> > -	phy = devm_usb_get_phy(dev, USB_PHY_TYPE_USB2);
> > +	phy = devm_phy_get(&pdev->dev, "usb2-phy");
> >  	if (IS_ERR(phy)) {
> >  		/* Fallback for pdata */
> >  		plat = dev_get_platdata(&pdev->dev);
> > 
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
