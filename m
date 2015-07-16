From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v2 06/13] irqchip: kill off set_irq_flags usage
Date: Thu, 16 Jul 2015 21:32:20 +0200
Message-ID: <87pp3rj3uj.fsf@belgarion.home>
References: <1436711211-18223-1-git-send-email-robh@kernel.org>
	<1436711211-18223-7-git-send-email-robh@kernel.org>
	<alpine.DEB.2.11.1507121737030.20072@nanos>
	<20150716132632.GK7557@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, arm@kernel.org, Alexander Shiyan <shc_work@mail.ru>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-rpi-kernel@lists.infradead.org, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Jason Cooper <jason@lakedaemon.net>
List-Id: linux-samsung-soc@vger.kernel.org

Russell King - ARM Linux <linux@arm.linux.org.uk> writes:

>> drivers/net/ethernet/smsc/smc911x.c
>> drivers/net/ethernet/smsc/smc9194.c
>> drivers/net/ethernet/smsc/smc91x.c
>> 
>> Those might still be, but on the DT based boards the probing should be
>> completely irrelevant
>
> SA11x0 stuff uses smc91x.c
PXA uses it also for lubbock, mainstone and zylonite boards, which are not yet
converted to DT, and won't drop platform_data, even if they are DT converted.
I remember testing this patchset on lubbock at least.

> ucb1x00.c definitely uses IRQ probing on SA11x0 platforms.
For PXA I must admit I don't yet know. I know lubbock has an UCB1400, but I
don't have it working yet, so I can't foresee the problems yet.

Cheers.

-- 
Robert
