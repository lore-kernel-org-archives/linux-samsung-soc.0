From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH] usb: ohci-exynos: Add facility to use phy provided by
 the generic phy framework
Date: Tue, 22 Apr 2014 13:59:43 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1404221358530.1326-100000@iolanthe.rowland.org>
References: <CAFp+6iGrgMTE27FxpFTQfALJO_XypxGSZ1-wny8KAoY1sLBbWw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from iolanthe.rowland.org ([192.131.102.54]:42675 "HELO
	iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S933515AbaDVR7o (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Apr 2014 13:59:44 -0400
In-Reply-To: <CAFp+6iGrgMTE27FxpFTQfALJO_XypxGSZ1-wny8KAoY1sLBbWw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>
Cc: Linux USB Mailing List <linux-usb@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-doc@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Kukjin Kim <kgene.kim@samsung.com>, robh+dt@kernel.org, Jingoo Han <jg1.han@samsung.com>

On Tue, 22 Apr 2014, Vivek Gautam wrote:

> On Thu, Apr 10, 2014 at 6:54 PM, Vivek Gautam <gautam.vivek@samsung.com> wrote:
> > Add support to consume phy provided by Generic phy framework.
> > Keeping the support for older usb-phy intact right now, in order
> > to prevent any functionality break in absence of relevant
> > device tree side change for ohci-exynos.
> > Once we move to new phy in the device nodes for ohci, we can
> > remove the support for older phys.
> 
> Any comments on this please.
> I think whatever the approach we follow, that can be common to both
> ehci-exynos[1], and ohci-exynos, since
> both are needed to move to the new generic phy framework, keeping
> support for older usb-phy
> so as to have smooth transition, in order to avoid any regression.

I lost my copies of the ehci-exynos patch, but probably the same 
comments apply as for the ohci-exynos patch.

Alan Stern
