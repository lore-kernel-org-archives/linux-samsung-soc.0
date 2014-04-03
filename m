From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 4/8] PCI: imx6: use new clock names
Date: Thu, 03 Apr 2014 10:21:05 +0200
Message-ID: <1396513265.5057.7.camel@weser.hi.pengutronix.de>
References: <1396025579-14344-1-git-send-email-l.stach@pengutronix.de>
	 <1396025579-14344-5-git-send-email-l.stach@pengutronix.de>
	 <20140403065037.GJ2801@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140403065037.GJ2801@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Richard Zhu <r65037-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Shawn,

Am Donnerstag, den 03.04.2014, 14:50 +0800 schrieb Shawn Guo:
> On Fri, Mar 28, 2014 at 05:52:55PM +0100, Lucas Stach wrote:
> > As defined in the new binding.
> > 
> > Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > ---
> >  drivers/pci/host/pci-imx6.c | 74 ++++++++++++++++++---------------------------
> >  1 file changed, 29 insertions(+), 45 deletions(-)
> > 
> > diff --git a/drivers/pci/host/pci-imx6.c b/drivers/pci/host/pci-imx6.c
> > index ee082509b0ba..71730bbcd9a2 100644
> > --- a/drivers/pci/host/pci-imx6.c
> > +++ b/drivers/pci/host/pci-imx6.c
> ...
> > @@ -583,32 +574,25 @@ static int __init imx6_pcie_probe(struct platform_device *pdev)
> >  	}
> >  
> >  	/* Fetch clocks */
> > -	imx6_pcie->lvds_gate = devm_clk_get(&pdev->dev, "lvds_gate");
> > -	if (IS_ERR(imx6_pcie->lvds_gate)) {
> > -		dev_err(&pdev->dev,
> > -			"lvds_gate clock select missing or invalid\n");
> > -		return PTR_ERR(imx6_pcie->lvds_gate);
> > -	}
> > -
> > -	imx6_pcie->sata_ref_100m = devm_clk_get(&pdev->dev, "sata_ref_100m");
> > -	if (IS_ERR(imx6_pcie->sata_ref_100m)) {
> > +	imx6_pcie->pcie_phy = devm_clk_get(&pdev->dev, "pcie_phy");
> > +	if (IS_ERR(imx6_pcie->pcie_phy)) {
> 
> Won't this break the existing DTBs?
> 
Yes, it will. But I think it's justified to break the binding,
considering how much brokenness was in there and the relatively few
number of users right now.

All these patches depend on agreement of the new binding, as laid out in
patch 2/8. I don't think it makes much sense in keeping the old cruft
around given that the old binding was properly reviewed by PCI experts.

Regards,
Lucas
-- 
Pengutronix e.K.                           | Lucas Stach                 |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-5076 |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
