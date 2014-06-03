From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 0/8] i.MX6 PCIe binding change and MSI support
Date: Tue, 03 Jun 2014 15:22:47 +0200
Message-ID: <1401801767.5422.4.camel@weser.hi.pengutronix.de>
References: <1396025579-14344-1-git-send-email-l.stach@pengutronix.de>
	 <20140424175844.GD29593@google.com>
	 <1398421265.4657.25.camel@weser.hi.pengutronix.de>
	 <CAErSpo7Boi8d+apAUC3TmmE33LuRMYJ6J+TEPLRbeyZyU3O8RQ@mail.gmail.com>
	 <1398774686.4677.12.camel@weser.hi.pengutronix.de>
	 <1399885183.5016.4.camel@weser.hi.pengutronix.de>
	 <20140530173053.GF4607@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140530173053.GF4607-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Richard Zhu <r65037-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>, linux-arm <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Bjorn,

Am Freitag, den 30.05.2014, 11:30 -0600 schrieb Bjorn Helgaas:
> On Mon, May 12, 2014 at 10:59:43AM +0200, Lucas Stach wrote:
> > Hi Bjorn,
> > 
> > just a friendly reminder. It would be nice if you could pull those in.
> > 
> > Shawn already pulled the DT change and as it is a binding change this
> > means PCIe on i.MX6 is broken in -next, as long as the remaining patches
> > are missing.
> 
> I applied these to pci/host-imx6 for v3.16.
> 
> Sorry I didn't do this sooner; I get a lot of email and it's easy to
> overlook things.  I mostly work from patchwork
> (http://patchwork.ozlabs.org/project/linux-pci/list/?order=date), and I had
> dropped this series from there because there was enough discussion that I
> expected a re-post, so it wasn't on my radar screen anymore.
> 
> Bjorn
> 
> > Am Dienstag, den 29.04.2014, 14:31 +0200 schrieb Lucas Stach:
> > > Hi Bjorn,
> > > 
> > > Am Freitag, den 25.04.2014, 08:39 -0600 schrieb Bjorn Helgaas:
> > > [...]
> > > > >> >   PCI: designware: split Exynos and i.MX bindings

It seems you missed this one patch. This isn't too urgent, as it is just
the doc update, but it should still go into 3.16 along with the other
changes. I would have expected that is ok for this to go through your
tree.

Regards,
Lucas
-- 
Pengutronix e.K.             | Lucas Stach                 |
Industrial Linux Solutions   | http://www.pengutronix.de/  |

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
