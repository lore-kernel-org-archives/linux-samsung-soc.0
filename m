From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v6 4/8] ARM: Add .init_platform() callback to machine descriptor
Date: Sat, 22 Jun 2013 15:46:41 +0200
Message-ID: <2503927.uZIubvXWLh@flatron>
References: <1371774924-9224-1-git-send-email-tomasz.figa@gmail.com> <1371774924-9224-5-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f50.google.com ([209.85.214.50]:58338 "EHLO
	mail-bk0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755671Ab3FVNqn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 22 Jun 2013 09:46:43 -0400
In-Reply-To: <1371774924-9224-5-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Mark Brown <broonie@kernel.org>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@linaro.org>, Benoit Cousson <benoit.cousson@linaro.org>, devicetree-discuss@lists.ozlabs.org, Jason Cooper <jason@lakedaemon.net>, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Nicolas Pitre <nico@fluxnic.net>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will.deacon@arm.com>

Hi Kukjin,

On Friday 21 of June 2013 02:35:20 Tomasz Figa wrote:
> Most ARM platforms have parts that should be initialized as early as
> possible, which usually means as soon as memory management (kmalloc,
> ioremap) starts to work,
> 
> However, currently there is no appropriate callback in machine_desc
> struct to use for such initialization and platforms tend to stuff things
> up .init_irq() and .init_time() callbacks.
> 
> Since all the DT-based platforms are going towards generic IRQ and time
> initialization (using irqchip_init and clocksource_of_init) and current
> code assumes that if custom callbacks are not provided in machine_desc
> then generic ones should be used, this problem has become a bit more
> inconvenient.
> 
> This patch tries to solve this issue by introducing new callback called
> .init_platform(), where any custom low level initialization of platform
> can be done safely.
> 
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> ---
>  arch/arm/include/asm/mach/arch.h | 1 +
>  arch/arm/kernel/irq.c            | 3 +++
>  2 files changed, 4 insertions(+)

Please disregard this patch when applying the series (if that happens).

Best regards,
Tomasz
