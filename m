From: Vivek Gautam <gautamvivek1987@gmail.com>
Subject: Re: [PATCH] ARM: Exynos5250: Enabling dwc3-exynos driver
Date: Thu, 8 Nov 2012 10:36:17 +0530
Message-ID: <CAFp+6iGs6Fz78gmFMiWgUzCQ919gphOWDL4Wz7xvAXe=aqKGXg@mail.gmail.com>
References: <1352215729-11703-1-git-send-email-gautam.vivek@samsung.com>
	<CAFp+6iGFwTAvhamhoQszBL8QUau64XtDWGR1yX0azbuw1iWgVA@mail.gmail.com>
	<20121107164322.GC12714@arwen.pp.htv.fi>
	<1719536.A7tLiC5qER@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:45969 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751489Ab2KHFGT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Nov 2012 00:06:19 -0500
In-Reply-To: <1719536.A7tLiC5qER@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: balbi@ti.com, Vivek Gautam <gautam.vivek@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-usb@vger.kernel.org, kgene.kim@samsung.com, av.tikhomirov@samsung.com, yulgon.kim@samsung.com, Thomas Abraham <thomas.abraham@linaro.org>, Praveen Paneri <p.paneri@samsung.com>

Hi,


On Wed, Nov 7, 2012 at 10:48 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hi Vivek, Felipe,
>
> On Wednesday 07 of November 2012 18:43:22 Felipe Balbi wrote:
>> Hi,
>>
>> On Wed, Nov 07, 2012 at 06:55:03PM +0530, Vivek Gautam wrote:
>> > Hi,
>> >
>> > On Tue, Nov 6, 2012 at 10:13 PM, Felipe Balbi <balbi@ti.com> wrote:
>> > > On Tue, Nov 06, 2012 at 08:58:49PM +0530, Vivek Gautam wrote:
>> > >> Adding DWC3 device tree node for Exynos5250 along with the
>> > >> device address and clock support needed for the controller.
>> > >>
>> > >> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
>> > >> ---
>> > >>
>> > >>  arch/arm/boot/dts/exynos5250.dtsi       |    6 ++++++
>> > >>  arch/arm/mach-exynos/clock-exynos5.c    |   24
>> > >>  ++++++++++++++++++++++++
>> > >>  arch/arm/mach-exynos/include/mach/map.h |    1 +
>> > >>  arch/arm/mach-exynos/mach-exynos5-dt.c  |    2 ++
>> > >>  drivers/usb/Kconfig                     |    1 +
>> > >>  5 files changed, 34 insertions(+), 0 deletions(-)
>> > >>
>> > >> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
>> > >> b/arch/arm/boot/dts/exynos5250.dtsi index cf6a02d..52bca54 100644
>> > >> --- a/arch/arm/boot/dts/exynos5250.dtsi
>> > >> +++ b/arch/arm/boot/dts/exynos5250.dtsi
>> > >> @@ -68,6 +68,12 @@
>> > >>
>> > >>               interrupts = <0 96 0>;
>> > >>
>> > >>       };
>> > >>
>> > >> +     dwc3 {
>> > >
>> > > shouldn't this be usb@12000000 ??
>> >
>> > Kept this in accordance with controller's name, similar to the change
>> > in following:
>> > http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg12800.
>> > html
>> >
>> > Needs to be changed ?
>>
>> I'll leave it to DT experts, but I was under the impression that we
>> should be using generic functionality names (usb, i2c, spi, uart, gpio,
>> etc) instead of the IP name. IP name is something more for compatible
>> flag.
>>
>> Don't take my word for it though :-) DT experts are the ones with final
>> saying
>
> Wrt node name, as far as I am aware of, there is no strict convention of
> naming nodes, but the way you suggested is better in terms of readability -
> you don't have to know this particular IP to find out what it is used for.
>
> Similar thing is with @addr in node names. I've been always adding @addr to
> the name whenever the node had reg property inside (with the same address
> of course), but I'm not sure if there is a strict convention here.
>

Better to make things more readable ;-)
It will be nice that i change this to dwc3 as well as ehci and ohci in
the change:
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg12800.
Thanks for suggestions.
I shall also update the Documentation/devicetree/bindings. I missed
that here :-(

> Best regards,
> Tomasz Figa
>



--
Thanks & Regards
Vivek
