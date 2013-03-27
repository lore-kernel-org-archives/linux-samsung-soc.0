From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 3/6] usb: phy: samsung: Consolidate reference clock rate
 handling
Date: Wed, 27 Mar 2013 14:39:08 +0100
Message-ID: <3457341.kfl8pm1NLi@amdc1227>
References: <1364309595-16102-1-git-send-email-t.figa@samsung.com>
 <1418529.52pdDLWkRZ@amdc1227> <20130327133149.GI4626@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20130327133149.GI4626-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wednesday 27 of March 2013 15:31:49 Felipe Balbi wrote:
> Hi,
> 
> On Wed, Mar 27, 2013 at 02:26:08PM +0100, Tomasz Figa wrote:
> > Hi Felipe,
> > 
> > On Wednesday 27 of March 2013 15:19:58 Felipe Balbi wrote:
> > > Hi,
> > > 
> > > On Tue, Mar 26, 2013 at 03:53:12PM +0100, Tomasz Figa wrote:
> > > > @@ -307,6 +310,7 @@ static int samsung_usb3phy_remove(struct
> > > > platform_device *pdev)>
> > > > 
> > > >  static struct samsung_usbphy_drvdata usb3phy_exynos5 = {
> > > >  
> > > >  	.cpu_type		= TYPE_EXYNOS5250,
> > > >  	.devphy_en_mask		= EXYNOS_USBPHY_ENABLE,
> > > > 
> > > > +	.rate_to_clksel		= samsung_usbphy_rate_to_clksel_4x12,
> > > 
> > > why isn't this just a clk_get_rate() ???
> > 
> > As the name suggests, this is a function to get appropriate CLKSEL value
> > to
> > write into PHYCLK register for reference clock rate on particular platform
> > (clk_get_rate is used inside to get the rate).
> 
> alright, then you don't need this function pointer at all, look at both
> 
> your rate_to_clksel functions (quoted below):
> | +int samsung_usbphy_rate_to_clksel_64xx(struct samsung_usbphy *sphy,
> | +                                                       unsigned long
> | rate)
> | +{
> | +       unsigned int clksel;
> | +
> | +       switch (rate) {
> | +       case 12 * MHZ:
> | +               clksel = PHYCLK_CLKSEL_12M;

Please note the PHYCLK_CLKSEL_ prefix here...

> | +               break;
> | +       case 24 * MHZ:
> | +               clksel = PHYCLK_CLKSEL_24M;
> | +               break;
> | +       case 48 * MHZ:
> | +               clksel = PHYCLK_CLKSEL_48M;
> | +               break;
> | +       default:
> | +               dev_err(sphy->dev,
> | +                       "Invalid reference clock frequency: %lu\n", rate);
> | +               return -EINVAL;
> | +       }
> | +
> | +       return clksel;
> | +}
> | +EXPORT_SYMBOL_GPL(samsung_usbphy_rate_to_clksel_64xx);
> | +
> | +int samsung_usbphy_rate_to_clksel_4x12(struct samsung_usbphy *sphy,
> | +                                                       unsigned long
> | rate)
> | +{
> | +       unsigned int clksel;
> | +
> | +       switch (rate) {
> | +       case 9600 * KHZ:
> | +               clksel = FSEL_CLKSEL_9600K;
> | +               break;
> | +       case 10 * MHZ:
> | +               clksel = FSEL_CLKSEL_10M;
> | +               break;
> | +       case 12 * MHZ:
> | +               clksel = FSEL_CLKSEL_12M;

..and then FSEL_CLKSEL_ here. They have different values. (Their names are a 
bit unfortunate, though...)

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Kernel and System Framework

> | +               break;
> | +       case 19200 * KHZ:
> | +               clksel = FSEL_CLKSEL_19200K;
> | +               break;
> | +       case 20 * MHZ:
> | +               clksel = FSEL_CLKSEL_20M;
> | +               break;
> | +       case 24 * MHZ:
> | +               clksel = FSEL_CLKSEL_24M;
> | +               break;
> | +       case 50 * MHZ:
> | +               clksel = FSEL_CLKSEL_50M;
> | +               break;
> | +       default:
> | +               dev_err(sphy->dev,
> | +                       "Invalid reference clock frequency: %lu\n", rate);
> | +               return -EINVAL;
> | +       }
> | +
> | +       return clksel;
> | +}
> | +EXPORT_SYMBOL_GPL(samsung_usbphy_rate_to_clksel_4x12);
> 
> They both return the same thing and test the same thing. You clearly
> don't need this function pointer. The only thing you need to be careful
> is that different platforms will have different clock rates, but that
> can just as easily be turned into a generic check.
> 
> I don't see the need for $SUBJECT.

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
