From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] ARM: Exynos5250: Enabling dwc3-exynos driver
Date: Wed, 07 Nov 2012 18:18:15 +0100
Message-ID: <1719536.A7tLiC5qER@flatron>
References: <1352215729-11703-1-git-send-email-gautam.vivek@samsung.com> <CAFp+6iGFwTAvhamhoQszBL8QUau64XtDWGR1yX0azbuw1iWgVA@mail.gmail.com> <20121107164322.GC12714@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:62915 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752347Ab2KGRSR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Nov 2012 12:18:17 -0500
In-Reply-To: <20121107164322.GC12714@arwen.pp.htv.fi>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: balbi@ti.com
Cc: Vivek Gautam <gautamvivek1987@gmail.com>, Vivek Gautam <gautam.vivek@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-usb@vger.kernel.org, kgene.kim@samsung.com, av.tikhomirov@samsung.com, yulgon.kim@samsung.com, Thomas Abraham <thomas.abraham@linaro.org>, Praveen Paneri <p.paneri@samsung.com>

Hi Vivek, Felipe,

On Wednesday 07 of November 2012 18:43:22 Felipe Balbi wrote:
> Hi,
> 
> On Wed, Nov 07, 2012 at 06:55:03PM +0530, Vivek Gautam wrote:
> > Hi,
> > 
> > On Tue, Nov 6, 2012 at 10:13 PM, Felipe Balbi <balbi@ti.com> wrote:
> > > On Tue, Nov 06, 2012 at 08:58:49PM +0530, Vivek Gautam wrote:
> > >> Adding DWC3 device tree node for Exynos5250 along with the
> > >> device address and clock support needed for the controller.
> > >> 
> > >> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> > >> ---
> > >> 
> > >>  arch/arm/boot/dts/exynos5250.dtsi       |    6 ++++++
> > >>  arch/arm/mach-exynos/clock-exynos5.c    |   24
> > >>  ++++++++++++++++++++++++
> > >>  arch/arm/mach-exynos/include/mach/map.h |    1 +
> > >>  arch/arm/mach-exynos/mach-exynos5-dt.c  |    2 ++
> > >>  drivers/usb/Kconfig                     |    1 +
> > >>  5 files changed, 34 insertions(+), 0 deletions(-)
> > >> 
> > >> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> > >> b/arch/arm/boot/dts/exynos5250.dtsi index cf6a02d..52bca54 100644
> > >> --- a/arch/arm/boot/dts/exynos5250.dtsi
> > >> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> > >> @@ -68,6 +68,12 @@
> > >> 
> > >>               interrupts = <0 96 0>;
> > >>       
> > >>       };
> > >> 
> > >> +     dwc3 {
> > > 
> > > shouldn't this be usb@12000000 ??
> > 
> > Kept this in accordance with controller's name, similar to the change
> > in following:
> > http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg12800.
> > html
> > 
> > Needs to be changed ?
> 
> I'll leave it to DT experts, but I was under the impression that we
> should be using generic functionality names (usb, i2c, spi, uart, gpio,
> etc) instead of the IP name. IP name is something more for compatible
> flag.
> 
> Don't take my word for it though :-) DT experts are the ones with final
> saying

Wrt node name, as far as I am aware of, there is no strict convention of 
naming nodes, but the way you suggested is better in terms of readability - 
you don't have to know this particular IP to find out what it is used for.

Similar thing is with @addr in node names. I've been always adding @addr to 
the name whenever the node had reg property inside (with the same address 
of course), but I'm not sure if there is a strict convention here.

Best regards,
Tomasz Figa
