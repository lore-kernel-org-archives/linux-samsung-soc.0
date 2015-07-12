From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 06/13] irqchip: kill off set_irq_flags usage
Date: Sun, 12 Jul 2015 18:43:56 +0200 (CEST)
Message-ID: <alpine.DEB.2.11.1507121737030.20072@nanos>
References: <1436711211-18223-1-git-send-email-robh@kernel.org> <1436711211-18223-7-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1436711211-18223-7-git-send-email-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org, arm@kernel.org, Jason Cooper <jason@lakedaemon.net>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Alexander Shiyan <shc_work@mail.ru>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-samsung-soc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, 12 Jul 2015, Rob Herring wrote:

> set_irq_flags is ARM specific with custom flags which have genirq
> equivalents. Convert drivers to use the genirq interfaces directly, so we
> can kill off set_irq_flags. The translation of flags is as follows:
> 
> IRQF_VALID -> !IRQ_NOREQUEST
> IRQF_PROBE -> !IRQ_NOPROBE
> IRQF_NOAUTOEN -> IRQ_NOAUTOEN
> 
> For IRQs managed by an irqdomain, the irqdomain core code handles clearing
> and setting IRQ_NOREQUEST already, so there is no need to do this in
> .map() functions and we can simply remove the set_irq_flags calls. Some
> users also set IRQ_NOPROBE and this has been maintained although it is not

clear IRQ_NOPROBE, right?

> clear that is really needed. There appears to be a great deal of blind
> copy and paste of this code.

Looking at the irq probe users:

drivers/input/touchscreen/ucb1400_ts.c
drivers/mfd/ucb1x00-core.c

The probe function was added in the initial implementation of the
driver (2006), so it predates device tree.

drivers/net/appletalk/ltpc.c
drivers/net/arcnet/com20020-isa.c
drivers/net/arcnet/com90io.c
drivers/net/arcnet/com90xx.c

Surely not stuff you find on todays ARM systems

drivers/net/ethernet/8390/ne.c
drivers/net/ethernet/8390/wd.c
drivers/net/ethernet/amd/lance.c
drivers/net/ethernet/amd/ni65.c
drivers/net/ethernet/amd/pcnet32.c

Ditto

drivers/net/ethernet/smsc/smc911x.c
drivers/net/ethernet/smsc/smc9194.c
drivers/net/ethernet/smsc/smc91x.c

Those might still be, but on the DT based boards the probing should be
completely irrelevant

drivers/net/hamradio/dmascc.c
drivers/net/wan/cosa.c
drivers/net/wan/sbni.c
drivers/parport/parport_pc.c

Surely not stuff you find on todays ARM systems

drivers/pcmcia/yenta_socket.c

Russell might still use that.

drivers/scsi/NCR53c406a.c
drivers/scsi/sym53c416.c
drivers/tty/cyclades.c

Surely not stuff you find on todays ARM systems

drivers/tty/serial/8250/8250_core.c

The irq probing is used by

    mach-imx/mach-mx31ads.c
    mach-iop32x/n2100.c

    and X86

So in most of the irqchip drivers, this is irrelevant.

Thanks,

	tglx
