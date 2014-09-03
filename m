From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH v2] irqchip: exynos-combiner: Fix compilation error on
 ARM64
Date: Wed, 3 Sep 2014 07:57:28 -0400
Message-ID: <20140903115728.GJ30467@titan.lakedaemon.net>
References: <1409722329-18309-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mho-02-ewr.mailhop.org ([204.13.248.72]:26090 "EHLO
	mho-02-ewr.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756199AbaICL5l convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Sep 2014 07:57:41 -0400
Content-Disposition: inline
In-Reply-To: <1409722329-18309-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: linux-kernel@vger.kernel.org, naveenkrishna.ch@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Sudeep Holla <sudeep.holla@arm.com>

On Wed, Sep 03, 2014 at 11:02:09AM +0530, Naveen Krishna Chatradhi wrot=
e:
> The following compilation error occurs on 64-bit Exynos7 SoC:
>=20
> drivers/irqchip/exynos-combiner.c: In function =E2=80=98combiner_irq_=
domain_map=E2=80=99:
> drivers/irqchip/exynos-combiner.c:162:2: error: implicit declaration =
of function =E2=80=98set_irq_flags=E2=80=99 [-Werror=3Dimplicit-functio=
n-declaration]
>   set_irq_flags(irq, IRQF_VALID | IRQF_PROBE);
>   ^
> drivers/irqchip/exynos-combiner.c:162:21: error: =E2=80=98IRQF_VALID=E2=
=80=99 undeclared (first use in this function)
>   set_irq_flags(irq, IRQF_VALID | IRQF_PROBE);
>                      ^
> drivers/irqchip/exynos-combiner.c:162:21: note: each undeclared ident=
ifier is reported only once for each function it appears in
> drivers/irqchip/exynos-combiner.c:162:34: error: =E2=80=98IRQF_PROBE=E2=
=80=99 undeclared (first use in this function)
>   set_irq_flags(irq, IRQF_VALID | IRQF_PROBE);
>=20
> Fix the build error by including linux/interrupt.h.
>=20
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> ---
> Changes since v1:
> Used linux/interrupt.h instead of asm/hardirq.h
>=20
>  drivers/irqchip/exynos-combiner.c |    1 +
>  1 file changed, 1 insertion(+)

Applied to irqchip/urgent

thx,

Jason.
