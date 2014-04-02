From: "Hong-Xing.Zhu-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Hong-Xing.Zhu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH 1/8] ARM: imx6q-clk: parent lvds_gate from lvds_sel
Date: Wed, 2 Apr 2014 12:57:25 +0000
Message-ID: <2d4c3e19ef3f4579a2cbdea70176e7d3@BLUPR03MB136.namprd03.prod.outlook.com>
References: <1396025579-14344-1-git-send-email-l.stach@pengutronix.de>
 <1396025579-14344-2-git-send-email-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396025579-14344-2-git-send-email-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Lucas:
Thanks for your re-structure the management of the output on CLK1/2 pads.


> -----Original Message-----
> From: linux-pci-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:linux-pci-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org]
> On Behalf Of Lucas Stach
> Sent: Saturday, March 29, 2014 12:53 AM
> To: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Sean Cross; Marek Vasut; Zhu Richard-R65037; Bjorn
> Helgaas; Jingoo Han; Shawn Guo; Ian Campbell; Mark Rutland; Pawel Moll; Rob
> Herring; Arnd Bergmann; Tim Harvey; kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
> Subject: [PATCH 1/8] ARM: imx6q-clk: parent lvds_gate from lvds_sel
> 
> Allows fror proper refcounting of the parent clocks when enabling the clock
> output on CLK1/2 pads.
> 
> Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Acked-by: Richard Zhu <r65037-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

> ---
>  arch/arm/mach-imx/clk-imx6q.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-imx/clk-imx6q.c b/arch/arm/mach-imx/clk-imx6q.c
> index af2e582d2b74..f98a6bb98145 100644
> --- a/arch/arm/mach-imx/clk-imx6q.c
> +++ b/arch/arm/mach-imx/clk-imx6q.c
> @@ -208,8 +208,8 @@ static void __init imx6q_clocks_init(struct device_node
> *ccm_node)
>  	 * the "output_enable" bit as a gate, even though it's really just
>  	 * enabling clock output.
>  	 */
> -	clk[lvds1_gate] = imx_clk_gate("lvds1_gate", "dummy", base + 0x160, 10);
> -	clk[lvds2_gate] = imx_clk_gate("lvds2_gate", "dummy", base + 0x160, 11);
> +	clk[lvds1_gate] = imx_clk_gate("lvds1_gate", "lvds1_sel", base + 0x160,
> 10);
> +	clk[lvds2_gate] = imx_clk_gate("lvds2_gate", "lvds2_sel", base +
> +0x160, 11);
> 
>  	/*                                name              parent_name
> reg       idx */
>  	clk[pll2_pfd0_352m] = imx_clk_pfd("pll2_pfd0_352m", "pll2_bus",     base
> + 0x100, 0);
> --
> 1.9.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pci" in the
> body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org More majordomo info at
> http://vger.kernel.org/majordomo-info.html
> 


Best Regards
Richard Zhu


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
