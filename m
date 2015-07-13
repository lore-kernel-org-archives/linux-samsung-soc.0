From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 06/13] irqchip: kill off set_irq_flags usage
Date: Mon, 13 Jul 2015 11:26:55 -0500
Message-ID: <CAL_JsqJfDdDAQ1gr1w3w8_FVqKzxqDag-PHnwguaPfT+6zqszw@mail.gmail.com>
References: <1436711211-18223-1-git-send-email-robh@kernel.org>
 <1436711211-18223-7-git-send-email-robh@kernel.org> <alpine.DEB.2.11.1507121737030.20072@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f179.google.com ([209.85.160.179]:35227 "EHLO
	mail-yk0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750792AbbGMQ1P (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Jul 2015 12:27:15 -0400
In-Reply-To: <alpine.DEB.2.11.1507121737030.20072@nanos>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Russell King <linux@arm.linux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Alexander Shiyan <shc_work@mail.ru>, Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-rpi-kernel@lists.infradead.org

On Sun, Jul 12, 2015 at 11:43 AM, Thomas Gleixner <tglx@linutronix.de> wrote:
> On Sun, 12 Jul 2015, Rob Herring wrote:
>
>> set_irq_flags is ARM specific with custom flags which have genirq
>> equivalents. Convert drivers to use the genirq interfaces directly, so we
>> can kill off set_irq_flags. The translation of flags is as follows:
>>
>> IRQF_VALID -> !IRQ_NOREQUEST
>> IRQF_PROBE -> !IRQ_NOPROBE
>> IRQF_NOAUTOEN -> IRQ_NOAUTOEN
>>
>> For IRQs managed by an irqdomain, the irqdomain core code handles clearing
>> and setting IRQ_NOREQUEST already, so there is no need to do this in
>> .map() functions and we can simply remove the set_irq_flags calls. Some
>> users also set IRQ_NOPROBE and this has been maintained although it is not
>
> clear IRQ_NOPROBE, right?

Both set and clear really. The state of IRQ_NOPROBE is a don't care in
most cases as you have outlined below. Are the cases of setting
IRQ_NOPROBE really needed or simply a bunch of copy and paste?

I've noticed I have a few places wrong with probe setting though, so
I'll be sending a v3.

>> clear that is really needed. There appears to be a great deal of blind
>> copy and paste of this code.
>
> Looking at the irq probe users:
>
> drivers/input/touchscreen/ucb1400_ts.c
> drivers/mfd/ucb1x00-core.c
>
> The probe function was added in the initial implementation of the
> driver (2006), so it predates device tree.

We still have lots of platforms which are not (and probably never will
be) DT. Certainly, DT only irqchips should be easy to make consistent.
The older stuff is harder and not frequently tested.

> drivers/net/appletalk/ltpc.c
> drivers/net/arcnet/com20020-isa.c
> drivers/net/arcnet/com90io.c
> drivers/net/arcnet/com90xx.c
>
> Surely not stuff you find on todays ARM systems
>
> drivers/net/ethernet/8390/ne.c
> drivers/net/ethernet/8390/wd.c
> drivers/net/ethernet/amd/lance.c
> drivers/net/ethernet/amd/ni65.c
> drivers/net/ethernet/amd/pcnet32.c
>
> Ditto
>
> drivers/net/ethernet/smsc/smc911x.c
> drivers/net/ethernet/smsc/smc9194.c
> drivers/net/ethernet/smsc/smc91x.c
>
> Those might still be, but on the DT based boards the probing should be
> completely irrelevant

Yes, these are quite common on ARM boards, and probably few if any
rely on irq probing regardless of DT.

> drivers/net/hamradio/dmascc.c
> drivers/net/wan/cosa.c
> drivers/net/wan/sbni.c
> drivers/parport/parport_pc.c
>
> Surely not stuff you find on todays ARM systems
>
> drivers/pcmcia/yenta_socket.c
>
> Russell might still use that.
>
> drivers/scsi/NCR53c406a.c
> drivers/scsi/sym53c416.c
> drivers/tty/cyclades.c
>
> Surely not stuff you find on todays ARM systems
>
> drivers/tty/serial/8250/8250_core.c
>
> The irq probing is used by
>
>     mach-imx/mach-mx31ads.c
>     mach-iop32x/n2100.c
>
>     and X86
>
> So in most of the irqchip drivers, this is irrelevant.

Agreed, but that's a separate series I think. I'm trying not to change
behavior with this series. Are you proposing I do something different
with this patch?

Rob
